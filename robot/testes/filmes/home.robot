*** Settings ***
Library           Browser
Resource          ../../resources/pages/LoginPage.resource  
Resource          ../../resources/base.resource
Suite Setup       Start Session

*** Test Cases ***
Deve Exibir Banner Com Informações do Cinema
    New Page    ${BASE_URL}
    Wait For Elements State    css=.features-section    visible    5

Deve Exibir Seção De Filmes Em Cartaz Com Pôsteres
    New Page    ${BASE_URL}
    Wait For Elements State    css=.featured-movies    visible    10  
    ${posters}=    Get Elements    css=.featured-movies img
    ${length}=     Get Length      ${posters}
    Should Be True    ${length} > 0    No posters found!

Deve Ser Responsivo Em Diferentes Tamanhos
    New Page    ${BASE_URL}
    Set Viewport Size    1920    1080
    Wait For Elements State    css=header    visible    5
    Set Viewport Size    768    1024
    Wait For Elements State    css=header    visible    5
    Set Viewport Size    375    667
    Wait For Elements State    css=header    visible    5

Deve Exibir Links Rápidos Para Principais Áreas
    New Page    ${BASE_URL}
    Wait For Elements State    css=nav a[href="/movies"]    visible    5  
    Wait For Elements State    css=nav a[href="/login"]    visible    5   
    Wait For Elements State    css=nav a[href="/register"]    visible    5  

Deve Ter Navegação Principal No Cabeçalho
    New Page    ${BASE_URL}
    Wait For Elements State    css=nav    visible    5  

Usuário Autenticado Deve Ver Menu Personalizado
    Abrir página de login
    Preencher login    ${LOGIN_USER_EMAIL}    ${LOGIN_SENHA_USER}
    Enviar login
    Verificar login com sucesso
    Wait For Elements State    css=nav a[href="/profile"]    visible    5  
    Wait For Elements State    css=button.btn-logout    visible    5
    Wait For Elements State    css=nav a[href="/reservations"]    visible    5  

Deve Exibir Informações Detalhadas de um Filme
    New Page    ${BASE_URL}
    Wait For Elements State    css=.featured-movies    visible    10
    Click    css=.movie-card a[href="/movies/686412a30b46c0776345ea06"] 
    Wait For Elements State    css=.movie-info    visible    5 
    Wait For Elements State    css=.movie-synopsis p    visible    5 
    Wait For Elements State    css=.movie-meta span:nth-child(2)    visible    5  
    Wait For Elements State    css=.movie-meta span:nth-child(3)    visible    5  
    Wait For Elements State    css=.movie-director    visible    5 

