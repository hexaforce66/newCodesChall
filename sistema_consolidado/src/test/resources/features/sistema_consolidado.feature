# Flujo feliz (Transacción exitosa)
Escenario: Transacción exitosa
    Dado que el saldo actual es 1000,00
    Y el monto de la transacción es 500,00
    Cuando se realiza la transacción
    Entonces el nuevo saldo es 1500,00
    Y el resultado es OK

# Casos de borde (Saldos mínimos, montos máximos)
Escenario: Saldo mínimo
    Dado que el saldo actual es 0,00
    Y el monto de la transacción es 500,00
    Cuando se realiza la transacción
    Entonces el nuevo saldo es 500,00
    Y el resultado es OK

Escenario: Monto máximo
    Dado que el saldo actual es 1000,00
    Y el monto de la transacción es 1000,00
    Cuando se realiza la transacción
    Entonces el nuevo saldo es 2000,00
    Y el resultado es OK

# Casos de error (Cuenta no existe, error de comunicación)
Escenario: Cuenta no existe
    Dado que la cuenta no existe
    Y el monto de la transacción es 500,00
    Cuando se realiza la transacción
    Entonces se muestra un mensaje de error "La cuenta no existe"
    Y el resultado es ER

Escenario: Error de comunicación
    Dado que hay un error de comunicación
    Y el monto de la transacción es 500,00
    Cuando se realiza la transacción
    Entonces se muestra un mensaje de error "Error de comunicación"
    Y el resultado es ER

# Escenarios donde el Motor de Reglas rechaza la operación
Escenario: Motor de Reglas rechaza la operación
    Dado que el saldo actual es 1000,00
    Y el monto de la transacción es -500,00
    Cuando se realiza la transacción
    Entonces se muestra un mensaje de error "Monto inválido"
    Y el resultado es ER

Escenario: Motor de Reglas rechaza la operación por sobregiro
    Dado que el saldo actual es 1000,00
    Y el monto de la transacción es 1500,00
    Cuando se realiza la transacción
    Entonces se muestra un mensaje de error "Sobregiro no permitido"
    Y el resultado es ER

Ejemplos:
    | Saldo actual | Monto de la transacción | Nuevo saldo | Resultado |
    | 1000,00      | 500,00                  | 1500,00     | OK        |
    | 0,00         | 500,00                  | 500,00      | OK        |
    | 1000,00      | 1000,00                 | 2000,00     | OK        |
    | -            | 500,00                  | -           | ER        |
    | 1000,00      | -500,00                 | -           | ER        |
    | 1000,00      | 1500,00                 | -           | ER        |