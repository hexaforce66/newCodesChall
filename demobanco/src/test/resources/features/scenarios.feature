Feature: Transacciones bancarias

  Background:
    Given el sistema bancario está configurado
    And el límite diario es de $10000.00

  Scenario Outline: Flujo feliz
    Given el número de tarjeta es <NUMERO-TARJETA>
    And la cuenta bancaria es <CUENTA-BANCARIA>
    And el RFC del cliente es <RFC-CLIENTE>
    And el monto de la transacción es <MONTO-TRANSACCION>
    When se realiza la transacción
    Then la respuesta es "Transacción aprobada"

    Examples:
      | NUMERO-TARJETA | CUENTA-BANCARIA | RFC-CLIENTE | MONTO-TRANSACCION |
      | 1234567890123456 | 1234567890    | ABCD123456E01 | 500.00          |
      | 9876543210987654 | 9876543210    | EFGH987654A01 | 1000.00         |

  Scenario Outline: Casos de borde (valores mínimos/máximos)
    Given el número de tarjeta es <NUMERO-TARJETA>
    And la cuenta bancaria es <CUENTA-BANCARIA>
    And el RFC del cliente es <RFC-CLIENTE>
    And el monto de la transacción es <MONTO-TRANSACCION>
    When se realiza la transacción
    Then la respuesta es "Transacción aprobada"

    Examples:
      | NUMERO-TARJETA | CUENTA-BANCARIA | RFC-CLIENTE | MONTO-TRANSACCION |
      | 1000000000000000 | 1000000000    | ABCD123456E01 | 0.01            |
      | 9999999999999999 | 9999999999    | EFGH987654A01 | 9999.99         |

  Scenario Outline: Casos de error (datos inválidos)
    Given el número de tarjeta es <NUMERO-TARJETA>
    And la cuenta bancaria es <CUENTA-BANCARIA>
    And el RFC del cliente es <RFC-CLIENTE>
    And el monto de la transacción es <MONTO-TRANSACCION>
    When se realiza la transacción
    Then la respuesta es "Transacción rechazada: excede límite diario"

    Examples:
      | NUMERO-TARJETA | CUENTA-BANCARIA | RFC-CLIENTE | MONTO-TRANSACCION |
      | 1234567890123456 | 1234567890    | ABCD123456E01 | 10001.00        |
      | 9876543210987654 | 9876543210    | EFGH987654A01 | 15000.00        |

  Scenario Outline: Escenarios de negocio complejos
    Given el número de tarjeta es <NUMERO-TARJETA>
    And la cuenta bancaria es <CUENTA-BANCARIA>
    And el RFC del cliente es <RFC-CLIENTE>
    And el monto de la transacción es <MONTO-TRANSACCION>
    And se han realizado <NUM-TRANSACCIONES> transacciones previas
    When se realiza la transacción
    Then la respuesta es <RESPUESTA>

    Examples:
      | NUMERO-TARJETA | CUENTA-BANCARIA | RFC-CLIENTE | MONTO-TRANSACCION | NUM-TRANSACCIONES | RESPUESTA |
      | 1234567890123456 | 1234567890    | ABCD123456E01 | 500.00          | 2                | "Transacción aprobada" |
      | 9876543210987654 | 9876543210    | EFGH987654A01 | 1000.00         | 3                | "Transacción rechazada: excede límite diario" |