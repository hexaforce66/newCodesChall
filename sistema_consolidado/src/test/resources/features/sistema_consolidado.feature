Característica: Procesamiento de pagos diarios
  Como usuario del sistema de pagos
  Quiero que el sistema procese los pagos diarios de manera correcta
  Para garantizar la integridad de las transacciones

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de cuentas BBVA.ACCOUNT.MASTER existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de pagos aprobados BBVA.PAYMENTS.APPROVED se genera correctamente
    Y el archivo de pagos rechazados BBVA.PAYMENTS.REJECTED no se genera
    Y el archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG se genera correctamente

  Escenario: Caso de borde - pago rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de cuentas BBVA.ACCOUNT.MASTER existe
    Y el pago tiene un monto mayor que el saldo disponible
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de pagos aprobados BBVA.PAYMENTS.APPROVED no se genera
    Y el archivo de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG se genera correctamente

  Escenario: Caso de error - archivo de entrada no existe
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado
    Y el archivo de pagos aprobados BBVA.PAYMENTS.APPROVED no se genera
    Y el archivo de pagos rechazados BBVA.PAYMENTS.REJECTED no se genera
    Y el archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG no se genera

  Escenario: Validación de cliente - cliente no activo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de clientes BBVA.CUSTOMER.MASTER existe
    Y el cliente no está activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de pagos aprobados BBVA.PAYMENTS.APPROVED no se genera
    Y el archivo de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG se genera correctamente

  Escenario: Validación de cuenta - cuenta no existe
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de cuentas BBVA.ACCOUNT.MASTER no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado
    Y el archivo de pagos aprobados BBVA.PAYMENTS.APPROVED no se genera
    Y el archivo de pagos rechazados BBVA.PAYMENTS.REJECTED no se genera
    Y el archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG no se genera

  Escenario: Escenario batch de entrada y salida
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de cuentas BBVA.ACCOUNT.MASTER existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de pagos aprobados BBVA.PAYMENTS.APPROVED se genera correctamente
    Y el archivo de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG se genera correctamente

  Escenario: Escenario de validación de riesgo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de cuentas BBVA.ACCOUNT.MASTER existe
    Y el pago tiene un riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de pagos aprobados BBVA.PAYMENTS.APPROVED no se genera
    Y el archivo de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG se genera correctamente