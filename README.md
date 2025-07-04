# Cinema App 

## Apresentação Pessoal
**Nome:** Izadora Santos  
**Idade:** 19 anos  
**Curso:** Análise e desenvolvimento de sistemas  
**Semestre:** 5° semestre          
**Cidade:** Jacundá/Pará  
---

## Sobre o Projeto

Este projeto foi desenvolvido como parte do **Challenge Final do PB AWS & AI for QE** da Compass UOL. Trata-se de uma suíte completa de automação de testes para uma aplicação de cinema, abrangendo tanto o front-end quanto validações funcionais da API.

### Objetivo
Implementar testes automatizados utilizando **Robot Framework** para validar as funcionalidades principais da aplicação Cinema App, incluindo:
- Autenticação de usuários
- Cadastro de novos usuários  
- Gerenciamento de sessões de filmes
- Sistema de reservas
- Navegação e interface do usuário

---

##  Arquitetura do Projeto

```
challengefinal/
├── mapa_mental/
│   └── Cinema App API.png           # Mapa mental da análise
├──  projeto/
│   ├── cinema-challenge-back/         # API Backend
│   └── cinema-challenge-front/        # Frontend 
├──  robot/
│   ├── logs/                       # Relatórios e logs de execução
│   ├── resources/                  # Recursos reutilizáveis
│   │   ├── pages/                     # Page Objects
│   │   ├── base.resource              # Configurações base
│   │   └── env.resource               # Variáveis de ambiente
│   ├── testes/                     # Casos de teste organizados
│   │   ├── autenticação/              # Testes de login/cadastro
│   │   ├── filmes/                    # Testes de filmes
│   │   ├── reservas/                  # Testes de reservas
│   │   └── sessões/                   # Testes de sessões
│   └── requirements.txt               # Dependências Python
├──  Cinema App.postman_collection2.json  # Collection Postman
└── README.md                          # Este arquivo
```

---

##  Tecnologias Utilizadas

### Automação de Testes
- **Robot Framework 7.0.0** - Framework principal de automação
- **Browser Library 18.6.3** - Interação com navegadores via Playwright
- **Faker Library 5.0.0** - Geração de dados dinâmicos para testes
- **JSON Library 0.5** - Manipulação de dados JSON
- **Requests Library 0.9.6** - Testes de API

### Aplicação Testada
- **Backend:** Node.js com Express e MongoDB
- **Frontend:** React com Vite
- **Banco de Dados:** MongoDB
- **Autenticação:** JWT

---

##  Pré-requisitos

### Software Necessário
- **Python 3.8+**
- **Node.js 16+**
- **MongoDB**
- **Git**

### Instalação das Dependências

1. **Clone o repositório:**
```bash
git clone https://github.com/izadorasantos922/challenge-final-compass.git
cd challenge-final-compass
```

2. **Configure o ambiente Python:**
```bash
cd robot
pip install -r requirements.txt
rfbrowser init
```

3. **Configure o Backend:**
```bash
cd projeto/cinema-challenge-back
npm install
cp .env.example .env  # Configure as variáveis de ambiente
npm start
```

4. **Configure o Frontend:**
```bash
cd projeto/cinema-challenge-front
npm install
npm run dev
```

---

##  Como Executar os Testes

### Execução Completa da Suíte
```bash
cd robot
robot testes/
```

### Execução por Módulo
```bash
# Testes de Autenticação
robot testes/autenticação/

# Testes de Reservas
robot testes/reservas/

# Testes de Filmes
robot testes/filmes/

# Testes de Sessões
robot testes/sessões/
```

### Execução com Tags Específicas
```bash
# Apenas testes de login
robot --include "login*" testes/

# Apenas testes de cadastro
robot --include "cadastro*" testes/
```

### Relatórios
Após a execução, os relatórios são gerados em:
- `robot/logs/report.html` - Relatório visual
- `robot/logs/log.html` - Log detalhado
- `robot/logs/output.xml` - Saída XML

---

## Cenários de Teste Implementados

###  Autenticação
-  Login com usuário administrador
-  Login com usuário comum
-  Login com credenciais inválidas
-  Cadastro de novo usuário
-  Cadastro com email já existente
-  Logout do sistema
-  Visualização e edição de perfil

### Filmes
-  Visualização da página inicial
-  Listagem de filmes disponíveis
-  Detalhes de filmes específicos

###  Reservas
-  Navegação para "Minhas Reservas"
-  Extração de códigos de reserva
-  Validação de reservas existentes

###  Sessões
-  Visualização de sessões disponíveis
-  Seleção de assentos
-  Processo de checkout

---

##  Padrões e Boas Práticas Aplicadas

### Page Object Model
- Separação clara entre lógica de teste e elementos da página
- Reutilização de código através de resources
- Manutenibilidade aprimorada

### Estrutura Modular
- **base.resource:** Configurações globais e keywords comuns
- **env.resource:** Variáveis de ambiente centralizadas
- **pages/:** Page Objects específicos para cada tela

### Geração de Dados Dinâmicos
- Utilização da FakerLibrary para dados realistas
- Prevenção de conflitos em execuções paralelas
- Testes independentes e isolados


---


### Bugs Encontrados
- [ ] Validação de campos obrigatórios no cadastro
- [ ] Tratamento de erro em sessões expiradas
- [ ] Responsividade em dispositivos móveis

---

## Inovações Implementadas

### Uso de IA Generativa
Foi usado o Chat gpt para consulta sobre a linguagem do robot, para melhorar e limpar o código do robot, para sugerir casos de testes, para fazer este README e ajudar no calculo da cobertura de testes.

##  Cobertura de Testes

(37/42)×100≈88,1%

---

## Agradecimentos

- **Compass UOL** pelo programa de bolsas e oportunidade de crescimento
- **Instrutores** pela orientação técnica e mentoria
- **Colegas de squad** pela colaboração e troca de conhecimentos 

---

##  Contato

Para dúvidas, sugestões ou colaborações:
- **GitHub:** izadorasantos922
- **LinkedIn:** (https://www.linkedin.com/in/izadora-santos-de-sousa/)
- **Email:** izadorasantosdesousa@gmail.com

---

## Repo original:
- **Backend** https://github.com/juniorschmitz/cinema-challenge-back
- **Frontend** https://github.com/juniorschmitz/cinema-challenge-front
