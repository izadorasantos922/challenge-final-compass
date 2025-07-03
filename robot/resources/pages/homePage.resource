*** Settings ***
Library           Browser
Resource          LoginPage.resource  
Resource          ../../resources/base.resource

*** Keywords ***
Acessar página inicial
    New Page    ${BASE_URL}

Validar seção de destaques visível
    Wait For Elements State    css=.features-section    visible    5

Validar seção de filmes em cartaz
    Wait For Elements State    css=.featured-movies    visible    10  

Validar que há pôsteres de filmes
    ${posters}=    Get Elements    css=.featured-movies img
    ${length}=     Get Length      ${posters}
    Should Be True    ${length} > 0    No posters found!

Validar header em resolução desktop
    Set Viewport Size    1920    1080
    Wait For Elements State    css=header    visible    5

Validar header em resolução tablet
    Set Viewport Size    768    1024
    Wait For Elements State    css=header    visible    5

Validar header em resolução mobile
    Set Viewport Size    375    667
    Wait For Elements State    css=header    visible    5

Validar links principais visíveis
    Wait For Elements State    css=nav a[href="/movies"]    visible    5  
    Wait For Elements State    css=nav a[href="/login"]    visible    5   
    Wait For Elements State    css=nav a[href="/register"]    visible    5  

Validar navegação principal visível
    Wait For Elements State    css=nav    visible    5  

Fazer login com credenciais válidas
    Abrir página de login
    Preencher login    ${LOGIN_USER_EMAIL}    ${LOGIN_SENHA_USER}
    Enviar login
    Verificar login com sucesso

Validar menu personalizado após login
    Wait For Elements State    css=nav a[href="/profile"]    visible    5  
    Wait For Elements State    css=button.btn-logout    visible    5
    Wait For Elements State    css=nav a[href="/reservations"]    visible    5  

Acessar detalhes de um filme em cartaz
    Wait For Elements State    css=.featured-movies    visible    10
    Click    css=.movie-card a[href="/movies/686412a30b46c0776345ea06"]

Validar informações detalhadas do filme
    Wait For Elements State    css=.movie-info    visible    5 
    Wait For Elements State    css=.movie-synopsis p    visible    5 
    Wait For Elements State    css=.movie-meta span:nth-child(2)    visible    5  
    Wait For Elements State    css=.movie-meta span:nth-child(3)    visible    5  
    Wait For Elements State    css=.movie-director    visible    5 
