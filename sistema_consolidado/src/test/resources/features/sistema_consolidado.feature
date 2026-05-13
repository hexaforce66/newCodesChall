Característica: Procesamiento de pagos diarios

  Escenario: Flujo feliz de pago
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se generan los archivos de salida BBVA.PAYMENTS.APPROVED, BBVA.PAYMENTS.REJECTED y BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo BBVA.PAYMENTS.APPROVED contiene registros de pago aprobados
    Y el archivo BBVA.PAYMENTS.REJECTED contiene registros de pago rechazados
    Y el archivo BBVA.PAYMENTS.AUDIT.LOG contiene registros de auditoría de pagos

  Escenario: Caso de borde - pago con monto máximo permitido
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el monto del pago es igual al límite diario máximo permitido
    Cuando se ejecuta el programa PAYMAIN
    Entonces se generan los archivos de salida BBVA.PAYMENTS.APPROVED, BBVA.PAYMENTS.REJECTED y BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo BBVA.PAYMENTS.APPROVED contiene registros de pago aprobados
    Y el archivo BBVA.PAYMENTS.REJECTED contiene registros de pago rechazados
    Y el archivo BBVA.PAYMENTS.AUDIT.LOG contiene registros de auditoría de pagos

  Escenario: Caso de error - pago con monto superior al límite diario máximo permitido
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el monto del pago es superior al límite diario máximo permitido
    Cuando se ejecuta el programa PAYMAIN
    Entonces se generan los archivos de salida BBVA.PAYMENTS.APPROVED, BBVA.PAYMENTS.REJECTED y BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo BBVA.PAYMENTS.REJECTED contiene registros de pago rechazados
    Y el archivo BBVA.PAYMENTS.AUDIT.LOG contiene registros de auditoría de pagos

  Escenario: Caso de error - pago con cuenta bloqueada
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y la cuenta del pago está bloqueada
    Cuando se ejecuta el programa PAYMAIN
    Entonces se generan los archivos de salida BBVA.PAYMENTS.APPROVED, BBVA.PAYMENTS.REJECTED y BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo BBVA.PAYMENTS.REJECTED contiene registros de pago rechazados
    Y el archivo BBVA.PAYMENTS.AUDIT.LOG contiene registros de auditoría de pagos

  Escenario: Caso de error - pago con cliente no activo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el cliente del pago no está activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se generan los archivos de salida BBVA.PAYMENTS.APPROVED, BBVA.PAYMENTS.REJECTED y BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo BBVA.PAYMENTS.REJECTED contiene registros de pago rechazados
    Y el archivo BBVA.PAYMENTS.AUDIT.LOG contiene registros de auditoría de pagos

  Escenario: Caso de error - pago con KYC incompleto
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el KYC del cliente del pago es incompleto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se generan los archivos de salida BBVA.PAYMENTS.APPROVED, BBVA.PAYMENTS.REJECTED y BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo BBVA.PAYMENTS.REJECTED contiene registros de pago rechazados
    Y el archivo BBVA.PAYMENTS.AUDIT.LOG contiene registros de auditoría de pagos

  Escenario: Caso de error - pago con riesgo alto
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el riesgo del pago es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se generan los archivos de salida BBVA.PAYMENTS.APPROVED, BBVA.PAYMENTS.REJECTED y BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo BBVA.PAYMENTS.REJECTED contiene registros de pago rechazados
    Y el archivo BBVA.PAYMENTS.AUDIT.LOG contiene registros de auditoría de pagos

  Escenario: Caso de error - pago con archivo de entrada de pagos diarios no existente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de ejecución

  Escenario: Caso de error - pago con archivo de entrada de clientes no existente
    Dado que el archivo de entrada de clientes BBVA.CUSTOMER.MASTER no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de ejecución

  Escenario: Caso de error - pago con archivo de entrada de cuentas no existente
    Dado que el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de ejecución