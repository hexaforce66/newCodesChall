Característica: Procesamiento de pagos diarios

  Antecedentes:
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de cuentas BBVA.ACCOUNT.MASTER existe
    Y el programa PAYMAIN está disponible en BBVA.LEGO.LOADLIB
    Y el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no existe
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED no existe
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG no existe

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Caso de borde - pago rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con saldo insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Caso de error - pago rechazado por cliente no activo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago de un cliente no activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cliente - pago rechazado por cliente no válido
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago de un cliente no válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cuenta - pago rechazado por cuenta no válida
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago de una cuenta no válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de riesgo - pago rechazado por riesgo alto
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Procesamiento de lotes - varios pagos aprobados y rechazados
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene varios pagos válidos y no válidos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED contiene los pagos aprobados
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos aprobados y rechazados

  Escenario: Procesamiento de lotes - varios pagos con errores
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene varios pagos con errores
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados