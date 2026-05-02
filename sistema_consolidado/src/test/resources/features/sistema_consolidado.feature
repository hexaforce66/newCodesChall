Característica: Proceso de transacción bancaria integrado
  Como un sistema bancario
  Quiero procesar transacciones de manera segura y eficiente
  Para garantizar la integridad de las cuentas de los clientes

Antecedentes:
  Dado que el sistema bancario está configurado correctamente
  Y el motor de reglas está funcionando correctamente
  Y la base de datos está disponible

Escenario: Flujo feliz - Transacción exitosa
  Dado que la cuenta del cliente tiene un saldo de $1000
  Y el monto de la transacción es de $500
  Cuando se procesa la transacción
  Entonces el saldo de la cuenta del cliente se actualiza a $1500
  Y se registra la transacción en la base de datos

Escenario: Caso de borde - Saldo mínimo
  Dado que la cuenta del cliente tiene un saldo de $100
  Y el monto de la transacción es de $50
  Cuando se procesa la transacción
  Entonces el saldo de la cuenta del cliente se actualiza a $150
  Y se registra la transacción en la base de datos

Escenario: Caso de borde - Monto máximo
  Dado que la cuenta del cliente tiene un saldo de $1000
  Y el monto de la transacción es de $10000
  Cuando se procesa la transacción
  Entonces el motor de reglas rechaza la transacción
  Y se registra un error en el log de errores bancarios

Escenario: Caso de error - Cuenta no existe
  Dado que la cuenta del cliente no existe
  Y el monto de la transacción es de $500
  Cuando se procesa la transacción
  Entonces el sistema bancario devuelve un error
  Y se registra un error en el log de errores bancarios

Escenario: Caso de error - Error de comunicación
  Dado que la base de datos no está disponible
  Y el monto de la transacción es de $500
  Cuando se procesa la transacción
  Entonces el sistema bancario devuelve un error
  Y se registra un error en el log de errores bancarios

Escenario: Motor de reglas rechaza la operación
  Dado que la cuenta del cliente tiene un saldo de $1000
  Y el monto de la transacción es de -$500
  Cuando se procesa la transacción
  Entonces el motor de reglas rechaza la transacción
  Y se registra un error en el log de errores bancarios

Ejemplos:
  | Saldo inicial | Monto de transacción | Resultado esperado |
  | $1000        | $500                | $1500             |
  | $100         | $50                 | $150              |
  | $1000        | $10000              | Error             |
  | $0           | $500                | Error             |
  | $1000        | -$500               | Error             |