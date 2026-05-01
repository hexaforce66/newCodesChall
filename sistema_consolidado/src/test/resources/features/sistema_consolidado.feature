# Característica: Procesamiento de transacciones bancarias
# Como usuario del sistema bancario
# Quiero que el sistema procese transacciones de manera segura y eficiente
# Para garantizar la integridad de los datos y la satisfacción del cliente

Fondo:
  Dado que el sistema bancario está configurado correctamente
  Y el archivo de transacciones "transacciones.txt" existe
  Y el archivo de transacciones contiene registros válidos

Escenario: Flujo feliz - Transacción exitosa
  Dado que la cuenta con ID "12345" existe en la base de datos
  Y el saldo actual de la cuenta es de $100,00
  Y el monto de la transacción es de $50,00
  Cuando se procesa la transacción
  Entonces el saldo actualizado de la cuenta es de $150,00
  Y el resultado de la transacción es "OK"

Escenario: Flujo feliz - Transacción exitosa con varios registros
  Dado que el archivo de transacciones contiene los siguientes registros:
    | ID | Monto |
    | 12345 | 50,00 |
    | 67890 | 20,00 |
  Cuando se procesan las transacciones
  Entonces el saldo actualizado de la cuenta "12345" es de $150,00
  Y el saldo actualizado de la cuenta "67890" es de $120,00
  Y el resultado de la transacción es "OK"

Escenario: Caso de borde - Saldo mínimo
  Dado que la cuenta con ID "12345" existe en la base de datos
  Y el saldo actual de la cuenta es de $0,00
  Y el monto de la transacción es de $50,00
  Cuando se procesa la transacción
  Entonces el saldo actualizado de la cuenta es de $50,00
  Y el resultado de la transacción es "OK"

Escenario: Caso de borde - Monto máximo
  Dado que la cuenta con ID "12345" existe en la base de datos
  Y el saldo actual de la cuenta es de $100,00
  Y el monto de la transacción es de $1000,00
  Cuando se procesa la transacción
  Entonces el saldo actualizado de la cuenta es de $1100,00
  Y el resultado de la transacción es "OK"

Escenario: Caso de error - Cuenta no existe
  Dado que la cuenta con ID "12345" no existe en la base de datos
  Y el monto de la transacción es de $50,00
  Cuando se procesa la transacción
  Entonces se muestra un mensaje de error "La cuenta no existe"
  Y el resultado de la transacción es "ER"

Escenario: Caso de error - Error de comunicación
  Dado que el sistema bancario no puede conectarse a la base de datos
  Y el monto de la transacción es de $50,00
  Cuando se procesa la transacción
  Entonces se muestra un mensaje de error "Error de comunicación"
  Y el resultado de la transacción es "ER"

Escenario: Motor de reglas rechaza la operación
  Dado que la cuenta con ID "12345" existe en la base de datos
  Y el saldo actual de la cuenta es de $100,00
  Y el monto de la transacción es de -$50,00
  Cuando se procesa la transacción
  Entonces el motor de reglas rechaza la operación
  Y se muestra un mensaje de error "Monto inválido"
  Y el resultado de la transacción es "ER"

Ejemplos:
  | ID | Monto |
  | 12345 | 50,00 |
  | 67890 | 20,00 |
  | 11111 | -50,00 |