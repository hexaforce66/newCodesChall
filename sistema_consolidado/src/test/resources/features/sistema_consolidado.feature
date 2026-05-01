Característica: Proceso de transacción bancaria integrado

Antecedentes:
  Dado que el sistema bancario está configurado correctamente
  Y el archivo de transacciones "transacciones.txt" existe

Escenario: Flujo feliz - Transacción exitosa
  Dado que el archivo de transacciones contiene una transacción válida
    | ID | Monto  |
    | 1  | 100.00 |
  Cuando se procesa la transacción
  Entonces el saldo de la cuenta se actualiza correctamente
  Y se registra la transacción en el log de auditoría

Escenario: Caso de borde - Saldo mínimo
  Dado que el archivo de transacciones contiene una transacción con saldo mínimo
    | ID | Monto  |
    | 1  | 0.01   |
  Cuando se procesa la transacción
  Entonces el saldo de la cuenta se actualiza correctamente
  Y se registra la transacción en el log de auditoría

Escenario: Caso de borde - Monto máximo
  Dado que el archivo de transacciones contiene una transacción con monto máximo
    | ID | Monto  |
    | 1  | 99999.99 |
  Cuando se procesa la transacción
  Entonces el saldo de la cuenta se actualiza correctamente
  Y se registra la transacción en el log de auditoría

Escenario: Caso de error - Cuenta no existe
  Dado que el archivo de transacciones contiene una transacción con cuenta no existente
    | ID | Monto  |
    | 99 | 100.00 |
  Cuando se procesa la transacción
  Entonces se registra un error en el log de auditoría
  Y el saldo de la cuenta no se actualiza

Escenario: Caso de error - Error de comunicación
  Dado que el archivo de transacciones contiene una transacción con error de comunicación
    | ID | Monto  |
    | 1  | 100.00 |
  Y el sistema de comunicación está caído
  Cuando se procesa la transacción
  Entonces se registra un error en el log de auditoría
  Y el saldo de la cuenta no se actualiza

Escenario: Motor de reglas rechaza la operación
  Dado que el archivo de transacciones contiene una transacción con monto negativo
    | ID | Monto  |
    | 1  | -100.00 |
  Cuando se procesa la transacción
  Entonces el motor de reglas rechaza la operación
  Y se registra un error en el log de auditoría

Ejemplos:
  | ID | Monto  |
  | 1  | 100.00 |
  | 2  | 200.00 |
  | 3  | 300.00 |