# *** Settings ***
# Library           Browser
# Library           Collections
# Resource          ../../resources/base.resource
# Suite Setup       Start Session

# *** Test Cases ***
# Verify Movie Sessions
#     New Page    ${BASE_URL}
#     Wait For Elements State    css=.featured-movies    visible    10
#     Click    css=.movie-card a[href="/movies/686412a30b46c0776345ea06"]

#     # Verifica se o container de sessões está visível
#     Wait For Elements State    css=.sessions-container h2    visible    5

#     # Verifica se a data 01/07/2025 está presente
#     Wait For Elements State    css=.session-date-group:has(h3:has-text("01/07/2025"))    visible    5

#     # Dentro dessa data, verifica a sessão de 12:00
#     Wait For Elements State    css=.session-date-group:has(h3:has-text("01/07/2025")) .session-card:has(.session-time:has-text("12:00"))    visible    5

#     # Verifica o teatro correto
#     Wait For Elements State    css=.session-date-group:has(h3:has-text("01/07/2025")) .session-card:has(.session-time:has-text("12:00")) .session-theater:has-text("Theater 1 - standard")    visible    5

#     # Verifica o preço
#     Wait For Elements State    css=.session-date-group:has(h3:has-text("01/07/2025")) .session-card:has(.session-time:has-text("12:00")) .session-price:has-text("Inteira: R$ 15.00 | Meia: R$ 7.50")    visible    5

#     # Clica no botão da sessão correta
#     Click    css=.session-date-group:has(h3:has-text("01/07/2025")) .session-card:has(.session-time:has-text("12:00")) a.session-button

#     # Verifica se foi redirecionado para a URL correta
#     Wait For Navigation    url=${BASE_URL}/sessions/686412a30b46c0776345ea0e
