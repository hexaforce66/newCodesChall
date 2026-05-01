Característica: Procesamiento de transacciones bancarias

  Antecedentes:
    Dado que el sistema bancario está configurado
    Y el archivo de transacciones "transacciones.txt" existe
    Y el archivo de transacciones contiene registros válidos

  Escenario: Flujo feliz - Transacción exitosa
    Dado que el registro de transacción tiene un ID válido
    Y el registro de transacción tiene un monto positivo
    Cuando se procesa la transacción
    Entonces el sistema actualiza el saldo de la cuenta
    Y el sistema registra la transacción con éxito

  Escenario: Caso de borde - Saldo mínimo
    Dado que el registro de transacción tiene un ID válido
    Y el registro de transacción tiene un monto que deja el saldo en cero
    Cuando se procesa la transacción
    Entonces el sistema actualiza el saldo de la cuenta
    Y el sistema registra la transacción con éxito

  Escenario: Caso de borde - Monto máximo
    Dado que el registro de transacción tiene un ID válido
    Y el registro de transacción tiene un monto máximo permitido
    Cuando se procesa la transacción
    Entonces el sistema actualiza el saldo de la cuenta
    Y el sistema registra la transacción con éxito

  Escenario: Caso de error - Cuenta no existe
    Dado que el registro de transacción tiene un ID no válido
    Cuando se procesa la transacción
    Entonces el sistema muestra un error de cuenta no existente
    Y el sistema no actualiza el saldo de la cuenta

  Escenario: Caso de error - Error de comunicación
    Dado que el registro de transacción tiene un ID válido
    Y el sistema de comunicación está caído
    Cuando se procesa la transacción
    Entonces el sistema muestra un error de comunicación
    Y el sistema no actualiza el saldo de la cuenta

  Escenario: Motor de reglas rechaza la operación
    Dado que el registro de transacción tiene un ID válido
    Y el registro de transacción tiene un monto que viola las reglas del motor
    Cuando se procesa la transacción
    Entonces el sistema muestra un error de motor de reglas
    Y el sistema no actualiza el saldo de la cuenta

  Esquema del escenario: Procesamiento de transacciones con diferentes montos
    Dado que el registro de transacción tiene un ID válido
    Y el registro de transacción tiene un monto de <monto>
    Cuando se procesa la transacción
    Entonces el sistema actualiza el saldo de la cuenta
    Y el sistema registra la transacción con <resultado>

    Ejemplos:
      | monto | resultado |
      | 100   | éxito     |
      | 0     | error     |
      | -100  | error     |
      | 1000  | éxito     |