Característica: Procesamiento de pagos diarios

  Escenario: Flujo feliz de pago aprobado
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED se genera correctamente
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED no contiene registros
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos aprobados

  Escenario: Flujo feliz de pago rechazado por validación de cliente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el cliente tiene un estado bloqueado o cerrado
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Flujo feliz de pago rechazado por validación de cuenta
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y la cuenta tiene un estado bloqueado o cerrado
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Flujo feliz de pago rechazado por validación de saldo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el saldo de la cuenta es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Flujo feliz de pago rechazado por validación de riesgo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el puntaje de riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Caso de borde - pago con monto máximo permitido
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el monto del pago es igual al máximo permitido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED se genera correctamente
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED no contiene registros
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos aprobados

  Escenario: Caso de error - archivo de entrada de pagos no existe
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado

  Escenario: Caso de error - archivo de entrada de clientes no existe
    Dado que el archivo de entrada de clientes BBVA.CUSTOMER.MASTER no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado

  Escenario: Caso de error - archivo de entrada de cuentas no existe
    Dado que el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado

  Escenario: Escenario de validación - pago con cliente no activo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el cliente no está activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Escenario de validación - pago con cuenta no activa
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y la cuenta no está activa
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Escenario de validación - pago con saldo insuficiente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el saldo de la cuenta es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Escenario de validación - pago con puntaje de riesgo alto
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el puntaje de riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Escenario de validación - pago con monto máximo permitido
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el monto del pago es igual al máximo permitido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED se genera correctamente
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED no contiene registros
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos aprobados

  Escenario: Escenario de validación - pago con cliente no activo y cuenta no activa
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el cliente no está activo
    Y la cuenta no está activa
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Escenario de validación - pago con saldo insuficiente y puntaje de riesgo alto
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el saldo de la cuenta es insuficiente
    Y el puntaje de riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Escenario de validación - pago con monto máximo permitido y puntaje de riesgo alto
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el monto del pago es igual al máximo permitido
    Y el puntaje de riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Escenario de validación - pago con cliente no activo, cuenta no activa y saldo insuficiente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el cliente no está activo
    Y la cuenta no está activa
    Y el saldo de la cuenta es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Escenario de validación - pago con cliente no activo, cuenta no activa, saldo insuficiente y puntaje de riesgo alto
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el cliente no está activo
    Y la cuenta no está activa
    Y el saldo de la cuenta es insuficiente
    Y el puntaje de riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Escenario de validación - pago con monto máximo permitido, puntaje de riesgo alto y cliente no activo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el monto del pago es igual al máximo permitido
    Y el puntaje de riesgo es alto
    Y el cliente no está activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Escenario de validación - pago con monto máximo permitido, puntaje de riesgo alto, cliente no activo y cuenta no activa
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el monto del pago es igual al máximo permitido
    Y el puntaje de riesgo es alto
    Y el cliente no está activo
    Y la cuenta no está activa
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados

  Escenario: Escenario de validación - pago con monto máximo permitido, puntaje de riesgo alto, cliente no activo, cuenta no activa y saldo insuficiente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de entrada de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de entrada de cuentas BBVA.ACCOUNT.MASTER existe
    Y el monto del pago es igual al máximo permitido
    Y el puntaje de riesgo es alto
    Y el cliente no está activo
    Y la cuenta no está activa
    Y el saldo de la cuenta es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no contiene registros
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED se genera correctamente
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene registros de pagos rechazados