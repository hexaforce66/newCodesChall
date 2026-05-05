Característica: Procesamiento de pagos diarios
  Como un sistema de pago
  Quiero procesar los pagos diarios de manera eficiente y segura
  Para garantizar la integridad de las transacciones y cumplir con los requisitos de seguridad

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED
    Y se genera el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de salida de pagos aprobados contiene el pago aprobado
    Y el archivo de salida de pagos rechazados no contiene el pago
    Y el archivo de salida de auditoría contiene el registro de auditoría del pago

  Escenario: Caso de borde - pago rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el saldo de la cuenta es insuficiente para el pago
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y el archivo de salida de pagos rechazados contiene el pago rechazado
    Y el archivo de salida de pagos aprobados no contiene el pago
    Y el archivo de salida de auditoría contiene el registro de auditoría del pago

  Escenario: Caso de error - archivo de entrada de pagos diarios no existe
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado
    Y no se generan archivos de salida

  Escenario: Caso de error - archivo de entrada de clientes no existe
    Dado que el archivo de entrada de clientes BBVA.CUSTOMER.MASTER no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado
    Y no se generan archivos de salida

  Escenario: Caso de error - archivo de entrada de cuentas no existe
    Dado que el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado
    Y no se generan archivos de salida

  Escenario: Validación de cliente - cliente no activo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el cliente no está activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y el archivo de salida de pagos rechazados contiene el pago rechazado
    Y el archivo de salida de pagos aprobados no contiene el pago
    Y el archivo de salida de auditoría contiene el registro de auditoría del pago

  Escenario: Validación de cuenta - cuenta no existe
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y la cuenta no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y el archivo de salida de pagos rechazados contiene el pago rechazado
    Y el archivo de salida de pagos aprobados no contiene el pago
    Y el archivo de salida de auditoría contiene el registro de auditoría del pago

  Escenario: Validación de pago - pago rechazado por riesgo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el pago es rechazado por riesgo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y el archivo de salida de pagos rechazados contiene el pago rechazado
    Y el archivo de salida de pagos aprobados no contiene el pago
    Y el archivo de salida de auditoría contiene el registro de auditoría del pago

  Escenario: Escenario batch de entrada y salida
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se generan los archivos de salida de pagos aprobados BBVA.PAYMENTS.APPROVED
    Y se generan los archivos de salida de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se generan los archivos de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y los archivos de salida de pagos aprobados contienen los pagos aprobados
    Y los archivos de salida de pagos rechazados contienen los pagos rechazados
    Y los archivos de salida de auditoría contienen los registros de auditoría de los pagos