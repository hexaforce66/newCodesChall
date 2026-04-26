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

  Scenario: Caso de error - Monto inválido (cero)
    Given el número de tarjeta es 1234567890123456
    And la cuenta bancaria es 1234567890
    And el RFC del cliente es ABCD123456EFG
    And el monto de la transacción es $0.00
    When se realiza la transacción
    Then la respuesta es "Transacción rechazada: monto inválido"

  Scenario: Caso de error - Número de tarjeta inválido
    Given el número de tarjeta es 123456789012345
    And la cuenta bancaria es 1234567890
    And el RFC del cliente es ABCD123456EFG
    And el monto de la transacción es $500.00
    When se realiza la transacción
    Then la respuesta es "Transacción rechazada: número de tarjeta inválido"

  Scenario: Caso de error - Cuenta bancaria inválida
    Given el número de tarjeta es 1234567890123456
    And la cuenta bancaria es 123456789
    And el RFC del cliente es ABCD123456EFG
    And el monto de la transacción es $500.00
    When se realiza la transacción
    Then la respuesta es "Transacción rechazada: cuenta bancaria inválida"

  Scenario: Caso de error - RFC del cliente inválido
    Given el número de tarjeta es 1234567890123456
    And la cuenta bancaria es 1234567890
    And el RFC del cliente es ABCD123456EF
    And el monto de la transacción es $500.00
    When se realiza la transacción
    Then la respuesta es "Transacción rechazada: RFC del cliente inválido"

  Scenario Outline: Transacciones con diferentes montos
    Given el número de tarjeta es 1234567890123456
    And la cuenta bancaria es 1234567890
    And el RFC del cliente es ABCD123456EFG
    And el monto de la transacción es <monto>
    When se realiza la transacción
    Then la respuesta es <respuesta>

    Examples:
      | monto    | respuesta                  |
      | $500.00  | Transacción aprobada       |
      | $10000.00| Transacción aprobada       |
      | $0.01    | Transacción aprobada       |
      | -$100.00 | Transacción rechazada: monto inválido |
      | $0.00    | Transacción rechazada: monto inválido |