# Script de Cancelamento da Fila de Impressão e Reinicialização do Spooler

Este repositório contém um script em batch (.bat) que permite cancelar toda a fila de impressão no Windows e reiniciar o serviço de spooler de impressão. O script é projetado para ser executado automaticamente, sem a necessidade de interação do usuário, desde que tenha permissões administrativas.

## Funcionalidades

- **Cancela toda a fila de impressão**: O script exclui todos os arquivos na fila de impressão no diretório do spooler.
- **Reinicia o serviço de spooler de impressão**: Após a limpeza da fila, o serviço do spooler de impressão é reiniciado automaticamente.
- **Executa sem interação do usuário**: O script não solicita permissão ou interação do usuário, mas requer privilégios administrativos.

## Requisitos

- Sistema operacional: Windows
- Permissões administrativas para executar o script.

## Como Usar

1. **Baixe o Script:**
   - Faça o clone deste repositório ou baixe o arquivo `.bat` diretamente.

2. **Execute o Script:**
   - Clique com o botão direito do mouse no arquivo `cancelar_fila_impressao.bat` e selecione **"Executar como administrador"**.
   - O script irá:
     - Parar o serviço de spooler de impressão.
     - Limpar a fila de impressão.
     - Reiniciar o serviço de spooler de impressão.

3. **Permissões Administrativas**:
   - O script verifica se está sendo executado com privilégios elevados. Se não, ele pedirá para ser reiniciado com permissões administrativas.

## Como Funciona

- O script executa os seguintes passos:
  1. Verifica se está sendo executado com permissões administrativas.
  2. Para o serviço de spooler de impressão.
  3. Exclui todos os arquivos da fila de impressão no diretório `%systemroot%\System32\spool\PRINTERS\`.
  4. Reinicia o serviço de spooler de impressão.

O processo é realizado automaticamente, sem exigir intervenção do usuário, exceto para a confirmação de elevação de permissões quando necessário.

## Exemplo de Execução

Ao executar o script, você verá a seguinte saída no prompt de comando:

```bash
Cancelando toda a fila de impressão...
Fila de impressão cancelada e serviço reiniciado com sucesso.
