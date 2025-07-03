*** Settings ***
Resource         ../../resources/base.resource
Suite Setup      Start Session 

*** Test Cases ***
Deve Exibir Banner Com Informações do Cinema
    Acessar página inicial
    Validar seção de destaques visível

Deve Exibir Seção De Filmes Em Cartaz Com Pôsteres
    Acessar página inicial
    Validar seção de filmes em cartaz
    Validar que há pôsteres de filmes

Deve Ser Responsivo Em Diferentes Tamanhos
    Acessar página inicial
    Validar header em resolução desktop
    Validar header em resolução tablet
    Validar header em resolução mobile

Deve Exibir Links Rápidos Para Principais Áreas
    Acessar página inicial
    Validar links principais visíveis

Deve Ter Navegação Principal No Cabeçalho
    Acessar página inicial
    Validar navegação principal visível

Usuário Autenticado Deve Ver Menu Personalizado
    Fazer login com credenciais válidas
    Validar menu personalizado após login

Deve Exibir Informações Detalhadas de um Filme
    Acessar página inicial
    Acessar detalhes de um filme em cartaz
    Validar informações detalhadas do filme
