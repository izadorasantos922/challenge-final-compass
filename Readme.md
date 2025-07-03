## Challenge Final Compass

## Visão Geral

Este repositório contém uma suíte de testes automatizados desenvolvida com Robot Framework para o módulo de reservas de uma aplicação web, como parte do desafio final do programa de bolsas da Compass UOL. O projeto tem como objetivo testar a funcionalidade de navegação para a página "Minhas Reservas", extração de códigos de reserva e validação de sua corretude.

## Funcionalidades

- **Testes Automatizados**: Utiliza Robot Framework com a biblioteca Browser para automação de testes web.
- **Validação de Reservas**: Verifica a navegação para a página de reservas, extrai códigos de reserva de 8 dígitos e valida sua presença na interface.
- **Estrutura Modular**: Organizado com recursos e palavras-chave reutilizáveis para fácil manutenção.

## Tecnologias Utilizadas

- **Robot Framework**: Para automação de testes.
- **Biblioteca Browser**: Para interação com navegadores web.
- **Biblioteca String**: Para manipulação de strings na extração de códigos.
- **Python**: Linguagem base do Robot Framework.
- **Playwright**: Backend da biblioteca Browser para interação com elementos web.

## Pré-requisitos

Para executar os testes, você precisa ter instalado:

- Python 3.8 ou superior
- Robot Framework (`pip install robotframework`)
- Biblioteca Browser (`pip install robotframework-browser`)
- Node.js (necessário para o Playwright)
- Um navegador compatível (e.g., Chromium, Firefox ou WebKit)

Execute o comando abaixo para inicializar a biblioteca Browser:

```bash
rfbrowser init
```

## Estrutura do Projeto

```
challenge-final-compass/
├── resources/
│   └── base.resource        # Recursos e palavras-chave comuns
├── tests/
│   └── reservations.robot   # Casos de teste do módulo de reservas
├── logs/
│   └── output.xml          # Saída da execução dos testes
├── README.md               # Documentação do projeto
```

## Instruções de Configuração

1. **Clonar o Repositório**:

   ```bash
   git clone https://github.com/izadorasantos922/challenge-final-compass.git
   cd challenge-final-compass
   ```

2. **Instalar Dependências**:

   ```bash
   pip install -r requirements.txt
   ```

   **Nota**: Crie um arquivo `requirements.txt` com o seguinte conteúdo, se ainda não existir:

   ```
   robotframework
   robotframework-browser
   ```

3. **Inicializar a Biblioteca Browser**:

   ```bash
   rfbrowser init
   ```

4. **Configurar a Aplicação**:

   - Certifique-se de que a aplicação web testada está acessível (e.g., rodando localmente ou em um servidor de teste).
   - Atualize as configurações necessárias em `resources/base.resource` (e.g., URL base, credenciais).

## Executando os Testes

Para executar a suíte de testes, use:

```bash
robot tests/reservations.robot
```

**Saída**: Resultados e logs são salvos no diretório `logs/` (`output.xml`, `log.html`, etc.).

### Exemplo de Caso de Teste

- Navega para a página "Minhas Reservas".
- Extrai um código de reserva de 8 dígitos (e.g., de "Reserva #68646df3").
- Valida se o código aparece nos detalhes da reserva.

## Detalhes dos Testes

A suíte de testes (`reservations.robot`) inclui os seguintes componentes principais:

### Palavras-chave

- **Ir para página de minhas reservas**: Navega para a página "Minhas Reservas" e verifica o título.
- **Extrair código da primeira reserva**: Extrai um código de 8 dígitos do texto da reserva.
- **Confirmar se a reserva está correta**: Valida o código extraído na interface.

### Seletores

- Utiliza seletores XPath e CSS para localizar elementos como botões e cabeçalhos.

### Comportamento Esperado

- O título da página "Minhas Reservas" é exibido.
- O código de reserva (e.g., "68646df3") é extraído e validado corretamente.

## Solução de Problemas

- **Erro: No keyword with name 'Get Index From String' found**:

  - Certifique-se de incluir a biblioteca String no script (`Library String`).
  - O script de teste fornecido foi corrigido para usar `Split String` na extração do código.

- **Problemas com a Biblioteca Browser**:

  - Execute `rfbrowser init` para garantir que as dependências do Playwright estejam instaladas.
  - Verifique se o navegador é compatível e está instalado.

- **Elemento Não Encontrado**:

  - Confirme se os seletores (e.g., `${reservation_page_h3}`) correspondem ao DOM da aplicação.
  - Use `Log To Console` para depurar o texto ou a visibilidade dos elementos.

## Contribuições

Este projeto faz parte de um desafio de bolsa e não está aberto para contribuições públicas no momento. Para feedback ou problemas, entre em contato com o proprietário do repositório.

## Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## Agradecimentos

- **Compass UOL**: Pelo programa de bolsas e desafio proposto.
- **Comunidade Robot Framework**: Pela excelente documentação e ferramentas.