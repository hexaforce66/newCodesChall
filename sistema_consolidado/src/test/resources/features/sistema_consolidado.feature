Característica: Procesamiento de pagos diarios
  Como usuario del sistema de pagos
  Quiero que el sistema procese los pagos diarios de manera correcta
  Para garantizar la integridad de las transacciones

  Antecedentes:
    Dado que el sistema de pagos está configurado correctamente
    Y que los archivos de entrada y salida están disponibles

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados contiene el pago
    Y el archivo de auditoría contiene el registro de la transacción

  Escenario: Caso de borde - pago rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene un pago con saldo insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el registro de la transacción

  Escenario: Caso de error - pago rechazado por error de validación
    Dado que el archivo de entrada de pagos diarios contiene un pago con error de validación
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el registro de la transacción

  Escenario: Validación de cliente - cliente no activo
    Dado que el archivo de entrada de pagos diarios contiene un pago de un cliente no activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el registro de la transacción

  Escenario: Validación de cuenta - cuenta no existente
    Dado que el archivo de entrada de pagos diarios contiene un pago de una cuenta no existente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el registro de la transacción

  Escenario: Validación de riesgo - pago requiere revisión manual
    Dado que el archivo de entrada de pagos diarios contiene un pago que requiere revisión manual
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el registro de la transacción

  Escenario: Procesamiento de varios pagos
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados contiene todos los pagos
    Y el archivo de auditoría contiene los registros de las transacciones

  Escenario: Procesamiento de pagos con errores
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados contiene todos los pagos
    Y el archivo de auditoría contiene los registros de las transacciones

  Escenario: Procesamiento de pagos con validaciones
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con validaciones
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados contiene los pagos válidos
    Y el archivo de salida de pagos rechazados contiene los pagos no válidos
    Y el archivo de auditoría contiene los registros de las transacciones

  Escenario: Procesamiento de pagos con riesgo
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con riesgo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados contiene los pagos con riesgo bajo
    Y el archivo de salida de pagos rechazados contiene los pagos con riesgo alto
    Y el archivo de auditoría contiene los registros de las transacciones

  Escenario: Procesamiento de pagos con resumen
    Dado que el archivo de entrada de pagos diarios contiene varios pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados contiene los pagos
    Y el archivo de salida de pagos rechazados contiene los pagos no válidos
    Y el archivo de auditoría contiene los registros de las transacciones
    Y el archivo de resumen contiene el resumen de las transacciones