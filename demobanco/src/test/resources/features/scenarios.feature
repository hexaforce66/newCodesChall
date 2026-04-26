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

  Scenario: Flujo feliz - Transacción rechazada por límite diario
    Given el número de tarjeta es 1234567890123456
    And la cuenta bancaria es 1234567890
    And el RFC del cliente es ABCD123456EFG
    And el monto de la transacción es $15000.00
    When se realiza la transacción
    Then la respuesta es "Transacción rechazada: excede límite diario"

  Scenario Outline: Casos de borde - Valores mínimos
    Given el número de tarjeta es <tarjeta>
    And la cuenta bancaria es <cuenta>
    And el RFC del cliente es <rfc>
    And el monto de la transacción es <monto>
    When se realiza la transacción
    Then la respuesta es <respuesta>

    Examples:
      | tarjeta        | cuenta      | rfc          | monto  | respuesta                |
      | 0000000000000000 | 0000000000 |              | 0.00   | Transacción aprobada     |
      | 1234567890123456 | 1234567890 | ABCD123456EFG | 0.01   | Transacción aprobada     |

  Scenario Outline: Casos de borde - Valores máximos
    Given el número de tarjeta es <tarjeta>
    And la cuenta bancaria es <cuenta>
    And el RFC del cliente es <rfc>
    And el monto de la transacción es <monto>
    When se realiza la transacción
    Then la respuesta es <respuesta>

    Examples:
      | tarjeta        | cuenta      | rfc          | monto    | respuesta                |
      | 9999999999999999 | 9999999999 | ABCD123456EFG | 99999.99 | Transacción rechazada: excede límite diario |

  Scenario Outline: Casos de error - Datos inválidos
    Given el número de tarjeta es <tarjeta>
    And la cuenta bancaria es <cuenta>
    And el RFC del cliente es <rfc>
    And el monto de la transacción es <monto>
    When se realiza la transacción
    Then la respuesta es <respuesta>

    Examples:
      | tarjeta        | cuenta      | rfc          | monto  | respuesta                |
      |                | 1234567890 | ABCD123456EFG | 500.00 | Transacción rechazada    |
      | 1234567890123456 |             | ABCD123456EFG | 500.00 | Transacción rechazada    |
      | 1234567890123456 | 1234567890 |              | 500.00 | Transacción rechazada    |
      | 1234567890123456 | 1234567890 | ABCD123456EFG |        | Transacción rechazada    |

  Scenario: Escenario de negocio complejo - Transacciones múltiples
    Given el número de tarjeta es 1234567890123456
    And la cuenta bancaria es 1234567890
    And el RFC del cliente es ABCD123456EFG
    And el monto de la transacción es $5000.00
    When se realizan 3 transacciones
    Then la respuesta es "Transacción aprobada" para las primeras 2 transacciones
    And la respuesta es "Transacción rechazada: excede límite diario" para la tercera transacción