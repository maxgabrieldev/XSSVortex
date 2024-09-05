#!/bin/bash

#==========================================================================================#
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'
#==========================================================================================#

show_help() {
    echo -e "${BLUE}Uso: ./xssvortex.sh -d DOMÍNIO${NC}"
    echo
    echo -e "${YELLOW}Opções:${NC}"
    echo -e "  -d DOMÍNIO     Especifica o domínio para realizar o pentest."
    echo -e "  -h             Exibe esta mensagem de ajuda."
    echo
    echo -e "${GREEN}Exemplo:${NC}"
    echo -e "  ./xssvortex.sh -d example.com"
}
#==========================================================================================#

check_dependencies() {
    for tool in assetfinder httpx katana python3; do
        if ! command -v $tool &> /dev/null; then
            echo -e "${RED}Erro: A ferramenta '$tool' não está instalada.${NC}"
            exit 1
        fi
    done
}

#==========================================================================================#
if [ $# -eq 0 ]; then
    echo -e "${RED}Erro: Nenhum argumento fornecido. Use -h ou --help para mais informações.${NC}"
    exit 1
fi
#==========================================================================================#

while getopts "d:h" opt; do
    case $opt in
        d) 
            NOMEDOSITE="$OPTARG" 
            ;;
        h) 
            show_help
            exit 0
            ;;
        \?) 
            echo -e "${RED}Opção inválida: -$OPTARG${NC}" >&2
            show_help
            exit 1
            ;;
    esac
done
#==========================================================================================#

if [ -z "$NOMEDOSITE" ]; then
    echo -e "${RED}Erro: O domínio não foi especificado.${NC}"
    show_help
    exit 1
fi

#==========================================================================================#

check_dependencies
#==========================================================================================#

DATA=$(date +%Y%m%d)
FORMATO_SAIDA="${DATA}_${NOMEDOSITE}"


#==========================================================================================#

echo -e "${BLUE}Executando Assetfinder...${NC}"
assetfinder $NOMEDOSITE >> "${FORMATO_SAIDA}_urls.txt"


echo -e "${BLUE}Executando HTTPX...${NC}"
httpx -l "${FORMATO_SAIDA}_urls.txt" -o "${FORMATO_SAIDA}_livehosts.txt"


echo -e "${BLUE}Executando Katana...${NC}"
katana -u "${FORMATO_SAIDA}_livehosts.txt" -o "${FORMATO_SAIDA}_endpoints.txt"


echo -e "${BLUE}Transferindo endpoints para /root/tools/xss_vibes...${NC}"
cp "${FORMATO_SAIDA}_endpoints.txt" /root/tools/xss_vibes


echo -e "${BLUE}Executando XSS Vibes...${NC}"
cd /root/tools/xss_vibes
python3 main.py -f "${FORMATO_SAIDA}_endpoints.txt" -t 10 -o "${FORMATO_SAIDA}_vulnerabilities.txt"
cd /root/tools  
#==========================================================================================#

echo -e "${BLUE}Limpando arquivos temporários...${NC}"
rm -f "${FORMATO_SAIDA}_urls.txt" "${FORMATO_SAIDA}_livehosts.txt" "${FORMATO_SAIDA}_endpoints.txt"


if [ $? -eq 0 ]; then
    echo -e "${GREEN}Arquivos temporários apagados com sucesso.${NC}"
else
    echo -e "${RED}Erro ao apagar arquivos temporários.${NC}"
fi
#==========================================================================================#

echo -e "${GREEN}Processo concluído. Resultados salvos em ${FORMATO_SAIDA}_vulnerabilities.txt.${NC}"
