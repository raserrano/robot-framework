*** Settings ***
Documentation   Suite description
Library  SeleniumLibrary
Library  StringFormat
Resource  ../resources/example_resources.robot
Variables  ../locators/example_locators.yaml

*** Variables ***
${COUPON}   Auto2019

*** Test Cases ***
Navigate to shop and add 3 items
    [Tags]  test
    navigate to QA Playground
    visit shop tab
    select 3 items and add them to the cart
    verify the selected items are in the cart
    verify that entering coupon displays an error   ${COUPON}
    delete item from cart
    verify item was removed from cart
