Característica: Procesamiento de pagos diarios
  Como usuario del sistema de pagos
  Quiero que el sistema procese los pagos diarios de manera correcta
  Para garantizar la integridad de las transacciones

  Antecedentes:
    Dado que el sistema de pagos está configurado correctamente
    Y que los archivos de entrada están disponibles
    Y que los programas COBOL están compilados correctamente

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Y que el cliente y la cuenta están activos
    Y que el saldo es suficiente
    Y que el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es aprobado
    Y se genera un archivo de salida de pagos aprobados
    Y se actualiza el archivo de auditoría

  Escenario: Flujo feliz - pago rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Y que el cliente y la cuenta están activos
    Y que el saldo es insuficiente
    Y que el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y se genera un archivo de salida de pagos rechazados
    Y se actualiza el archivo de auditoría

  Escenario: Flujo feliz - pago rechazado por riesgo alto
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Y que el cliente y la cuenta están activos
    Y que el saldo es suficiente
    Y que el riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y se genera un archivo de salida de pagos rechazados
    Y se actualiza el archivo de auditoría

  Escenario: Caso de borde - pago con saldo igual al límite diario
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Y que el cliente y la cuenta están activos
    Y que el saldo es igual al límite diario
    Y que el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es aprobado
    Y se genera un archivo de salida de pagos aprobados
    Y se actualiza el archivo de auditoría

  Escenario: Caso de error - archivo de entrada no encontrado
    Dado que el archivo de entrada de pagos diarios no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error
    Y se genera un mensaje de error

  Escenario: Caso de error - programa COBOL no compilado
    Dado que el programa COBOL no está compilado correctamente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error
    Y se genera un mensaje de error

  Escenario: Validación de cliente - cliente no activo
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Y que el cliente no está activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y se genera un archivo de salida de pagos rechazados
    Y se actualiza el archivo de auditoría

  Escenario: Validación de cuenta - cuenta no activa
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Y que la cuenta no está activa
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y se genera un archivo de salida de pagos rechazados
    Y se actualiza el archivo de auditoría

  Escenario: Validación de saldo - saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Y que el saldo es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y se genera un archivo de salida de pagos rechazados
    Y se actualiza el archivo de auditoría

  Escenario: Validación de riesgo - riesgo alto
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Y que el riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y se genera un archivo de salida de pagos rechazados
    Y se actualiza el archivo de auditoría

  Escenario: Escenario batch - procesamiento de varios pagos
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se procesan todos los pagos
    Y se generan archivos de salida de pagos aprobados y rechazados
    Y se actualiza el archivo de auditoría