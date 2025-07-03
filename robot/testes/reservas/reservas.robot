# *** Settings ***
# Library           Browser
# Resource          ../../resources/pages/LoginPage.resource  
# Resource          ../../resources/base.resource
# Suite Setup       Start Session
# Suite Teardown    Close Browser

# *** Variables ***
# ${FILME_ID}       686412a30b46c0776345ea08
# ${SESSAO_ID}      686412a30b46c0776345ea0e
# ${BROWSER_TIMEOUT}  20s  # Increased timeout for slow-loading pages

# *** Test Cases ***
# Reserva Completa De Assento E Verificação
#     Open Browser And Login
#     Clicar em Minhas Reservas
#     Clicar Em Ver Filmes Em Cartaz
#     Clicar Em Detalhes Do Filme
#     Selecionar Sessao Para Reservar Assentos
#     Selecionar Um Assento Disponivel
#     Clicar Em Continuar Para Pagamento
#     Selecionar Metodo De Pagamento
#     Finalizar Compra
#     Validar Reserva Confirmada
#     Visualizar Minhas Reservas

# *** Keywords ***
# Open Browser And Login
#     Set Browser Timeout    ${BROWSER_TIMEOUT}  # Increase timeout globally
#     Abrir página de login
#     Preencher login    ${LOGIN_USER_EMAIL}    ${LOGIN_SENHA_USER}
#     Enviar login
#     Verificar login com sucesso
#     Log To Console    Login completed successfully

# Clicar em Minhas Reservas
#     Wait For Elements State    text=Minhas Reservas    visible    ${BROWSER_TIMEOUT}
#     Click    text=Minhas Reservas
#     # Log To Console    Clicked on 'Minhas Reservas'

# Clicar Em Ver Filmes Em Cartaz
#     Wait For Elements State    text=Ver filmes em cartaz    visible    ${BROWSER_TIMEOUT}
#     Click    text=Ver filmes em cartaz
#     Wait For Elements State    a[href="/movies/${FILME_ID}"]    visible    ${BROWSER_TIMEOUT}
#     Log To Console    Navigated to 'Ver filmes em cartaz'

# Clicar Em Detalhes Do Filme
#     # Verify the movie link exists
#     ${movie_link_exists}=    Evaluate    len($browser.get_elements('a[href="/movies/${FILME_ID}"]')) > 0
#     Run Keyword If    ${movie_link_exists}    Click    a[href="/movies/${FILME_ID}"]
#     ...    ELSE    Fail    Movie link with ID ${FILME_ID} not found
#     # Wait for session button to appear
#     Wait For Elements State    css=a.session-button[href*="/sessions/${SESSAO_ID}"]    visible    ${BROWSER_TIMEOUT}
#     # Log the page source for debugging if needed
#     ${page_source}=    Get Page Source
#     Log To Console    Page source after movie selection: ${page_source}
#     Click    css=a.session-button[href*="/sessions/${SESSAO_ID}"]
#     Log To Console    Clicked on session button for session ${SESSAO_ID}

# Selecionar Sessao Para Reservar Assentos
#     Wait For Elements State    css=button.seat.available    visible    ${BROWSER_TIMEOUT}
#     Log To Console    Session page loaded, available seats visible

# Selecionar Um Assento Disponivel
#     # Clica no primeiro assento disponível
#     Click    css=button.seat.available >> nth=0
#     Log To Console    Selected first available seat

# Clicar Em Continuar Para Pagamento
#     Wait For Elements State    css=button.checkout-button    visible    ${BROWSER_TIMEOUT}
#     Click    css=button.checkout-button
#     Log To Console    Clicked on 'Continuar para Pagamento'

# Selecionar Metodo De Pagamento
#     Wait For Elements State    css=div.payment-method >> text=Cartão de Débito    visible    ${BROWSER_TIMEOUT}
#     Click    css=div.payment-method >> text=Cartão de Débito
#     Log To Console    Selected 'Cartão de Débito' as payment method

# Finalizar Compra
#     Wait For Elements State    css=button.btn-checkout    visible    ${BROWSER_TIMEOUT}
#     Click    css=button.btn-checkout
#     Log To Console    Clicked on 'Finalizar Compra'

# Validar Reserva Confirmada
#     Wait For Elements State    h1 >> text=Reserva Confirmada!    visible    ${BROWSER_TIMEOUT}
#     Log To Console    Reservation confirmed successfully

# Visualizar Minhas Reservas
#     Wait For Elements State    text=Visualizar Minhas Reservas    visible    ${BROWSER_TIMEOUT}
#     Click    text=Visualizar Minhas Reservas
#     Wait For URL    **/reservations    timeout=${BROWSER_TIMEOUT}
#     Wait For Elements State    css=.card    visible    ${BROWSER_TIMEOUT}
#     ${reservation_text}=    Get Text    css=.card >> nth=0
#     Should Contain    ${reservation_text}    Assento
#     Log To Console    Reservation details verified: ${reservation_text}