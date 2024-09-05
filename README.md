
# XSS Vortex

  

![XSS Vortex Logo](logo2.png)

  

XSS Vortex é uma ferramenta de automação de pentest que combina várias ferramentas populares para coletar informações e identificar vulnerabilidade XSS em aplicações web. Com uma interface amigável e um fluxo de trabalho simplificado, o XSS Vortex é ideal para profissionais de segurança e entusiastas.

  

## Funcionalidade

  

O XSS Vortex realiza as seguintes etapas automatizadas:

  

1.  **Coleta de URLs**: Utiliza o Assetfinder para encontrar URLs relacionadas ao domínio especificado.

2.  **Verificação de Hosts**: Usa o HTTPX para verificar quais URLs estão ativas.

3.  **Busca de Endpoints**: Aplica o Katana para coletar endpoints das URLs ativas.

4.  **Transferência de Endpoints**: Copia os endpoints encontrados para um diretório específico.

5.  **Verificação de Vulnerabilidades**: Executa o XSS Vibes para identificar possíveis vulnerabilidades nos endpoints coletados.

6.  **Limpeza de Arquivos Temporários**: Remove arquivos temporários gerados durante o processo.

  

## Pré-requisitos

  

Antes de executar o XSS Vortex, você deve ter as seguintes ferramentas instaladas no seu sistema:

  

- [Assetfinder](https://github.com/tomnomnom/assetfinder): Ferramenta para encontrar subdomínios e URLs.

- [HTTPX](https://github.com/projectdiscovery/httpx): Ferramenta para verificar a disponibilidade de URLs.

- [Katana](https://github.com/projectdiscovery/katana): Ferramenta para coletar endpoints de aplicações web.

- [XSS Vibes](https://github.com/faiyazahmad07/xss_vibes): Ferramenta para testar vulnerabilidades de XSS.

  

### Instalação das Ferramentas

  

Para instalar as ferramentas acima, siga as instruções nos links fornecidos. É recomendável que a pasta do XSS Vibes e o script XSS Vortex estejam localizados em `/root/tools/`.

  

## Como Usar

  

### Passo a Passo

  

1.  **Clone o repositório**:

```bash

git clone https://github.com/maxgabrieldev/XSSVortex.git

cd XSSVortex
```
2. Torne o script executável:
```bash
chmod +x xssvortex.sh
```
3. Execute o script:
```bash
./xssvortex.sh -d example.com
```
	Substitua 'example.com' pelo domínio que você deseja testar.
4. Obtenha ajuda:
Para mais informações sobre como usar o script, execute:
```bash
./xssvortex.sh -h
```
## Contribuições

Contribuições são bem-vindas! Se você quiser melhorar o XSS Vortex ou adicionar novas funcionalidades, sinta-se à vontade para abrir um pull request.

## Licença

Este projeto é licenciado sob a [MIT License](https://opensource.org/license/mit).

## Contato

Para dúvidas ou sugestões, entre em contato:

-   **Seu Nome**:  [maxgabrielsec@gmail.com](mailto:maxgabrielsec@gmail.com)
