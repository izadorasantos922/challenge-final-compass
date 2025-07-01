*** Settings ***
Library           Browser
Resource          ../pages/LoginPage.resource  
Resource          ../../resources/base.resource
Suite Setup       Start Session

*** Variables ***
${EMAIL}          user@example.com
${SENHA}          password123

*** Test Cases ***
Deve Exibir Banner Com Informações do Cinema
    New Page    ${BASE_URL}
    Wait For Elements State    css=.features-section    visible    5

Deve Exibir Seção De Filmes Em Cartaz Com Pôsteres
    New Page    ${BASE_URL}
    Wait For Elements State    css=.featured-movies    visible    10  
    Wait For Elements State    css=.featured-movies img    visible    10

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
    Preencher login    ${EMAIL}    ${SENHA}
    Enviar login
    Verificar login com sucesso
    Wait For Elements State    css=nav a[href="/profile"]    visible    5  
    Wait For Elements State    css=button.btn-logout    visible    5
    Wait For Elements State    css=nav a[href="/reservations"]    visible    5  

# Deve Exibir Informações Detalhadas de um Filme
#     New Page    ${BASE_URL}
#     Wait For Elements State    css=.featured-movies    visible    10
#     Click    css=.movie-card a[href="/movies/686412a30b46c0776345ea06"]  # Click "Ver Detalhes" for Inception
#     Wait For Elements State    css=.movie-info    visible    5  # Verify movie info section
#     Wait For Elements State    css=.movie-synopsis p    visible    5  # Verify synopsis
#     Wait For Elements State    css=.movie-meta span:nth-child(2)    visible    5  # Verify duration (148 min)
#     Wait For Elements State    css=.movie-meta span:nth-child(3)    visible    5  # Verify release date (15 de julho de 2010)
#     Wait For Elements State    css=.movie-director    visible    5  # Verify director
#     # TODO: Verify cast information once implemented (missing in provided HTML)
#     # TODO: Verify poster once confirmed in HTML (missing in provided HTML)
#     Wait For Elements State    css=.sessions-container h2    visible    5  # Verify sessions section
#     Wait For Elements State    css=.session-date h3:has-text("01/07/2025")    visible    5  # Verify date
#     Wait For Elements State    css=.session-times .session-card .session-time:has-text("12:00")    visible    5  # Verify session time
#     Wait For Elements State    css=.session-times .session-card .session-theater:has-text("Theater 1 - standard")    visible    5  # Verify theater
#     Wait For Elements State    css=.session-times .session-card .session-price:has-text("Inteira: R$ 15.00 | Meia: R$ 7.50")    visible    5  # Verify price
#     Click    css=.session-date-group h3:has-text("01/07/2025") ~ .session-times a.session-button[href="/sessions/686412a30b46c0776345ea0e"]  # Click specific session button (12:00, Theater 1 - standard)
#     Wait For Navigation    url=${BASE_URL}/sessions/686412a30b46c0776345ea0e  # Verify navigation to session page