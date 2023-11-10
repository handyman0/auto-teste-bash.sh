# auto-teste-bash.sh
algoritmo de autoteste para quem escreve em bash-script 

# Script de Execução de Arquivos

Este é um script Bash simples que permite a execução fácil de arquivos em diferentes linguagens (C, Bash, Python). 
Ele também verifica e, se necessário, instala a versão mais recente do Python.

## Uso
1. Execute o script Bash:
2. bash
3. ./executar_arquivo.sh

4. O script solicitará o nome do arquivo que você deseja executar.

5. Com base na extensão do arquivo, o script identificará a linguagem e executará o arquivo.

## Funcionalidades

- **Verificação da Versão do Python:** O script verifica a versão mais recente do Python no site oficial.

- **Instalação Automática do Python:** Se o Python não estiver instalado, o script oferecerá a opção de instalá-lo automaticamente.

- **Execução de Diferentes Tipos de Arquivos:** Suporte para arquivos em C, Bash script e Python.

- **Teste Automatizado:** O script inclui uma função de teste para executar o arquivo várias vezes.

## Requisitos

- **curl:** Para fazer solicitações HTTP e obter informações sobre a versão mais recente do Python.
- **gcc:** Para compilar arquivos C.

## Notas

- Certifique-se de ter permissões de execução no script:
  ```bash
  chmod +x executar_arquivo.sh
  ```

- Teste o script com diferentes tipos de arquivos para garantir que ele funcione corretamente.

- Este script foi desenvolvido para sistemas baseados em Debian/Ubuntu. Pode ser necessário ajustá-lo para outros sistemas operacionais.

---

**Aviso:** Use este script com cuidado e apenas em arquivos confiáveis. Não nos responsabilizamos por qualquer dano causado pelo uso deste script.

```
fique a vontade para usa-lo :D

contato: Linkedin: https://www.linkedin.com/in/luizfernando-perfil/
