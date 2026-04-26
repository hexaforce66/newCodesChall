Feature: Transacciones bancarias
  Background: Configuración inicial
    Given el límite diario es $10000.00

  Scenario: Flujo feliz - Transacción aprobada
    Given el número de tarjeta es "1234567890123456"
    And la cuenta bancaria es "1234567890"
    And el RFC del cliente es "RFC123456789"
    And el monto de la transacción es $500.00
    When se realiza la transacción
    Then la respuesta es "Transacción aprobada"

  Scenario: Caso de borde - Máximo monto permitido
    Given el número de tarjeta es "1234567890123456"
    And la cuenta bancaria es "1234567890"
    And el RFC del cliente es "RFC123456789"
    And el monto de la transacción es $10000.00
    When se realiza la transacción
    Then la respuesta es "Transacción aprobada"

  Scenario: Caso de borde - Mínimo monto permitido
    Given el número de tarjeta es "1234567890123456"
    And la cuenta bancaria es "1234567890"
    And el RFC del cliente es "RFC123456789"
    And el monto de la transacción es $0.01
    When se realiza la transacción
    Then la respuesta es "Transacción aprobada"

  Scenario: Caso de error - Monto excede límite diario
    Given el número de tarjeta es "1234567890123456"
    And la cuenta bancaria es "1234567890"
    And el RFC del cliente es "RFC123456789"
    And el monto de la transacción es $10001.00
    When se realiza la transacción
    Then la respuesta es "Transacción rechazada: excede límite diario"

  Scenario: Caso de error - Número de tarjeta inválido
    Given el número de tarjeta es "123456789012345"
    And la cuenta bancaria es "1234567890"
    And el RFC del cliente es "RFC123456789"
    And el monto de la transacción es $500.00
    When se realiza la transacción
    Then la respuesta es "Transacción rechazada: número de tarjeta inválido"

  Scenario: Caso de error - Cuenta bancaria inválida
    Given el número de tarjeta es "1234567890123456"
    And la cuenta bancaria es "123456789"
    And el RFC del cliente es "RFC123456789"
    And el monto de la transacción es $500.00
    When se realiza la transacción
    Then la respuesta es "Transacción rechazada: cuenta bancaria inválida"

  Scenario: Caso de error - RFC del cliente inválido
    Given el número de tarjeta es "1234567890123456"
    And la cuenta bancaria es "1234567890"
    And el RFC del cliente es "RFC12345678"
    And el monto de la transacción es $500.00
    When se realiza la transacción
    Then la respuesta es "Transacción rechazada: RFC del cliente inválido"

  Scenario Outline: Escenarios de negocio complejos
    Given el número de tarjeta es "<tarjeta>"
    And la cuenta bancaria es "<cuenta>"
    And el RFC del cliente es "<rfc>"
    And el monto de la transacción es "<monto>"
    When se realiza la transacción
    Then la respuesta es "<respuesta>"

    Examples:
      | tarjeta          | cuenta       | rfc           | monto   | respuesta                                |
      | 1234567890123456 | 1234567890   | RFC123456789  | 500.00  | Transacción aprobada                     |
      | 1234567890123456 | 1234567890   | RFC123456789  | 10001.00| Transacción rechazada: excede límite diario|
      | 123456789012345  | 1234567890   | RFC123456789  | 500.00  | Transacción rechazada: número de tarjeta inválido|
      | 1234567890123456 | 123456789    | RFC123456789  | 500.00  | Transacción rechazada: cuenta bancaria inválida|
      | 1234567890123456 | 1234567890   | RFC12345678   | 500.00  | Transacción rechazada: RFC del cliente inválido|