Feature: Transacciones bancarias

  Background:
    Given el sistema bancario está configurado
    And el límite diario es de $10000.00

  Scenario: Flujo feliz - Transacción aprobada
    Given el número de tarjeta es 1234567890123456
    And la cuenta bancaria es 1234567890
    And el RFC del cliente es ABCD123456EFG
    And el monto de la transacción es $500.00
    When se realiza la transacción
    Then la respuesta es "Transacción aprobada"

  Scenario: Caso de borde - Máximo monto permitido
    Given el número de tarjeta es 1234567890123456
    And la cuenta bancaria es 1234567890
    And el RFC del cliente es ABCD123456EFG
    And el monto de la transacción es $10000.00
    When se realiza la transacción
    Then la respuesta es "Transacción aprobada"

  Scenario: Caso de borde - Mínimo monto permitido
    Given el número de tarjeta es 1234567890123456
    And la cuenta bancaria es 1234567890
    And el RFC del cliente es ABCD123456EFG
    And el monto de la transacción es $0.01
    When se realiza la transacción
    Then la respuesta es "Transacción aprobada"

  Scenario: Caso de error - Monto inválido (negativo)
    Given el número de tarjeta es 1234567890123456
    And la cuenta bancaria es 1234567890
    And el RFC del cliente es ABCD123456EFG
    And el monto de la transacción es -$100.00
    When se realiza la transacción
    Then la respuesta es "Transacción rechazada: monto inválido"

  Scenario: Caso de error - Monto inválido (superior al límite diario)
    Given el número de tarjeta es 1234567890123456
    And la cuenta bancaria es 1234567890
    And el RFC del cliente es ABCD123456EFG
    And el monto de la transacción es $15000.00
    When se realiza la transacción
    Then la respuesta es "Transacción rechazada: excede límite diario"

  Scenario Outline: Escenarios de negocio complejos
    Given el número de tarjeta es <tarjeta>
    And la cuenta bancaria es <cuenta>
    And el RFC del cliente es <rfc>
    And el monto de la transacción es <monto>
    When se realiza la transacción
    Then la respuesta es <respuesta>

    Examples:
      | tarjeta          | cuenta       | rfc          | monto    | respuesta                         |
      | 1234567890123456 | 1234567890   | ABCD123456EFG | $500.00  | Transacción aprobada              |
      | 9876543210987654 | 9876543210   | EFGH987654IJK | $10000.00 | Transacción aprobada              |
      | 1234567890123456 | 1234567890   | ABCD123456EFG | -$100.00  | Transacción rechazada: monto inválido |
      | 9876543210987654 | 9876543210   | EFGH987654IJK | $15000.00 | Transacción rechazada: excede límite diario |