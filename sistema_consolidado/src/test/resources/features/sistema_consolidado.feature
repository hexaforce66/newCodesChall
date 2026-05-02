Característica: Proceso de transacciones bancarias integrado
  Como un sistema de gestión bancaria
  Quiero procesar transacciones de manera segura y eficiente
  Para garantizar la integridad de los datos y la satisfacción del cliente

  Antecedentes:
    Dado que el sistema está configurado para procesar transacciones
    Y el archivo de transacciones "transacciones.txt" existe

  Esquema del escenario: Flujo feliz de transacciones
    Dado que el archivo de transacciones contiene una transacción válida
      | ID | Monto |
      | <ID> | <Monto> |
    Cuando el sistema procesa la transacción
    Entonces el saldo actualizado se refleja en la base de datos
    Y el resultado de la transacción es "OK"

    Ejemplos:
      | ID | Monto |
      | 123 | 100.00 |
      | 456 | 200.00 |

  Escenario: Caso de borde - transacción con monto cero
    Dado que el archivo de transacciones contiene una transacción con monto cero
      | ID | Monto |
      | 123 | 0.00 |
    Cuando el sistema procesa la transacción
    Entonces el saldo no se actualiza
    Y el resultado de la transacción es "ER"

  Escenario: Caso de error - transacción con monto negativo
    Dado que el archivo de transacciones contiene una transacción con monto negativo
      | ID | Monto |
      | 123 | -100.00 |
    Cuando el sistema procesa la transacción
    Entonces el saldo no se actualiza
    Y el resultado de la transacción es "ER"

  Escenario: Motor de reglas rechaza la operación
    Dado que el motor de reglas rechaza la transacción
    Cuando el sistema procesa la transacción
    Entonces el saldo no se actualiza
    Y el resultado de la transacción es "ER"
    Y se registra un error en el log de errores bancarios

  Escenario: Fallo en la consulta de saldo en DB
    Dado que la consulta de saldo en DB falla
    Cuando el sistema procesa la transacción
    Entonces el saldo no se actualiza
    Y el resultado de la transacción es "ER"
    Y se registra un error en el log de errores bancarios

  Escenario: Fallo en la actualización de saldo en DB
    Dado que la actualización de saldo en DB falla
    Cuando el sistema procesa la transacción
    Entonces el saldo no se actualiza
    Y el resultado de la transacción es "ER"
    Y se registra un error en el log de errores bancarios