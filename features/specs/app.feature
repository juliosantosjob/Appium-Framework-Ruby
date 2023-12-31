#language:pt

    Feature: Home

    Scenario: Validated home
        Given the access user home
        When he selects an option show value
        Then displays its value: "R$ 5.500.00"
