*** Settings ***
Documentation   Suite description
Library  SeleniumLibrary
Library  StringFormat
Resource  ../resources/example_resources.robot
Variables  ../locators/example_locators.yaml

*** Variables ***
${COUPON}   Auto2019

*** Test Cases ***
Verify cart is empty
    [Tags]  test
    navigate to QA Playground
    verify cart is empty

Verify cart is not empty after adding an item
    [Tags]  test
    navigate to QA Playground
    visit shop tab
    select item to add to cart
    verify cart is not empty

Verify cart is empty after deleting an item
    [Tags]  test
    navigate to QA Playground
    visit shop tab
    select item to add to cart
    verify cart is not empty
    delete item from cart
    verify cart is empty

Navigate to shop and add 3 items
    [Tags]  test
    navigate to QA Playground
    visit shop tab
    select 3 items and add them to the cart
    verify cart is not empty
    verify that entering coupon displays an error   ${COUPON}
    delete item from cart
