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

  Escenario: Flujo feliz - pago rechazado
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Caso de borde - pago con monto máximo permitido
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con monto máximo permitido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Caso de error - archivo de entrada de pagos diarios no existe
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado

  Escenario: Caso de error - archivo de clientes no existe
    Dado que el archivo de clientes BBVA.CUSTOMER.MASTER no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado

  Escenario: Caso de error - archivo de cuentas no existe
    Dado que el archivo de cuentas BBVA.ACCOUNT.MASTER no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado

  Escenario: Caso de error - programa PAYMAIN no está disponible
    Dado que el programa PAYMAIN no está disponible en BBVA.LEGO.LOADLIB
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de programa no encontrado

  Escenario: Validación de cliente - cliente no activo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con cliente no activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cliente - cliente con KYC incompleto
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con cliente con KYC incompleto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cuenta - cuenta no existe
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con cuenta no existente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cuenta - cuenta bloqueada
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con cuenta bloqueada
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cuenta - cuenta cerrada
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con cuenta cerrada
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de saldo - saldo insuficiente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con saldo insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de riesgo - riesgo alto
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de riesgo - riesgo medio
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con riesgo medio
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Validación de riesgo - riesgo bajo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con riesgo bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Escenario batch de entrada y salida
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene varios pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED contiene los pagos aprobados
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos