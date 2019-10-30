*** Settings ***
Documentation   Suite description
Library     SeleniumLibrary
Library     StringFormat

*** Keywords ***
navigate to QA playground
    ${options}=     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver
    Call Method     ${options}  add_argument    --headless
    Call Method     ${options}  add_argument    --no-sandbox
    Call Method     ${options}  add_argument    --disable-dev-shm-usage
    Create WebDriver    Chrome  chrome_options=${options}
    Open Browser    http://34.205.174.166/  Chrome
    Maximize Browser Window
    Set Selenium Speed  0.25

is QA Playground displayed
    Wait Until Element Is Visible   id:masthead   10

Search For Hoodie
    [Documentation]     this is a test
    [Arguments]     ${hoodie_name}
    Input Text  ${home_page.search_field}     ${hoodie_name}
    Press Keys  ${home_page.search_field}    ENTER

is your hoodie displayed?
    [Arguments]     ${hoodie_name}
    ${hoodie}=  format string   ${result_page.item_result}     ${hoodie_name}
    Wait Until Element Is Visible   ${hoodie}   10

visit shop tab
    Go To   http://34.205.174.166/shop

visit cart page
    Go To   http://34.205.174.166/cart

verify cart is empty
    Go To   http://34.205.174.166/cart
    Wait Until Element Is Visible   ${cart_page.cart_empty}
    Element Should Be Visible   ${cart_page.cart_empty}

verify cart is not empty
    Go To   http://34.205.174.166/cart
    Element Should Not Be Visible   ${cart_page.cart_empty}

select 3 items and add them to the cart
    Click Link  ${shop_page.add_to_cart}

select item to add to cart
    Click Link  ${shop_page.add_to_cart}

verify the selected items are in the cart

verify that entering coupon displays an error
    [Arguments]  ${coupon}
    Input Text  ${cart_page.coupon_field}   ${coupon}
    Click Button    ${cart_page.coupon_button_submit}

delete item from cart
    Click Element   ${cart_page.remove}