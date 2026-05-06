Característica: Procesamiento de pagos diarios

  Antecedentes:
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de cuentas BBVA.ACCOUNT.MASTER existe
    Y el programa PAYMAIN está disponible en BBVA.LEGO.LOADLIB
    Y los archivos de salida BBVA.PAYMENTS.APPROVED, BBVA.PAYMENTS.REJECTED y BBVA.PAYMENTS.AUDIT.LOG están disponibles

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Caso de borde - pago rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene un pago con saldo insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Caso de error - pago rechazado por error de validación de cliente
    Dado que el archivo de entrada de pagos diarios contiene un pago con error de validación de cliente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cliente rechaza la operación
    Dado que el archivo de entrada de pagos diarios contiene un pago con cliente no válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Escenario batch de entrada y salida
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene los pagos aprobados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos aprobados

  Escenario: Escenario batch de entrada y salida con errores
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida con validaciones de cliente rechazadas
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con clientes no válidos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida con riesgo rechazado
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con riesgo rechazado
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida con riesgo en revisión
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con riesgo en revisión
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida con errores de validación de cuenta
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores de validación de cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida con errores de validación de pago
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores de validación de pago
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados