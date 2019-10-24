*** Settings ***
Documentation   Suite description
Library     SeleniumLibrary
Library     StringFormat

*** Keywords ***
navigate to QA playground
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

select 3 items and add them to the cart
    Get List Items  ${shop.add_to_cart}
    Click Link  ${shop.add_to_cart}

verify the selected items are in the cart

verify that entering coupon displays an error
    [Arguments]  ${coupon}
    Input Text  ${cart.coupon_field} ${coupon}
    Click Button    ${cart.coupon_button_submit}

delete item from cart

verify item was removed from cart