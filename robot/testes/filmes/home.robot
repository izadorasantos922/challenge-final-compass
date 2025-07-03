*** Settings ***
Resource         ../../resources/base.resource
Suite Setup      Start Session 

*** Test Cases ***
Deve Exibir Banner Com Informações do Cinema
    [Tags]    Banner com informações
    Acessar página inicial
    Validar seção de destaques visível

Deve Exibir Seção De Filmes Em Cartaz Com Pôsteres
    [Tags]    seção de filmes
    Acessar página inicial
    Validar seção de filmes em cartaz
    Validar que há pôsteres de filmes

Deve Ser Responsivo Em Diferentes Tamanhos
    [Tags]    responsividade
    Acessar página inicial
    Validar header em resolução desktop
    Validar header em resolução tablet
    Validar header em resolução mobile

Deve Exibir Links Rápidos Para Principais Áreas
    [Tags]    links rápidos
    Acessar página inicial
    Validar links principais visíveis

Deve Ter Navegação Principal No Cabeçalho
    [Tags]    navegação visitante
    Acessar página inicial
    Validar navegação principal visível

Usuário Autenticado Deve Ver Menu Personalizado
    [Tags]    menu de usuario
    Fazer login com credenciais válidas
    Validar menu personalizado após login

Deve Exibir Informações Detalhadas de um Filme
    [Tags]    informações de um filme
    Acessar página inicial
    Acessar detalhes de um filme em cartaz
    Validar informações detalhadas do filme
