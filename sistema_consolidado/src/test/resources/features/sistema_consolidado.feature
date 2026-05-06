Característica: Procesamiento de pagos diarios

  Antecedentes:
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de cuentas BBVA.ACCOUNT.MASTER existe
    Y el programa PAYMAIN está disponible en BBVA.LEGO.LOADLIB
    Y los archivos de salida BBVA.PAYMENTS.APPROVED, BBVA.PAYMENTS.REJECTED y BBVA.PAYMENTS.AUDIT.LOG no existen

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Caso de borde - pago rechazado por insuficiente saldo
    Dado que el archivo de entrada de pagos diarios contiene un pago con insuficiente saldo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Caso de error - pago rechazado por cliente no activo
    Dado que el archivo de entrada de pagos diarios contiene un pago de un cliente no activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación rechaza la operación - pago rechazado por riesgo
    Dado que el archivo de entrada de pagos diarios contiene un pago con riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Escenario batch de entrada y salida - varios pagos
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene los pagos aprobados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos aprobados

  Escenario: Escenario batch de entrada y salida - varios pagos con errores
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con validaciones rechazadas
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con validaciones rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con riesgo alto
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con insuficiente saldo
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con insuficiente saldo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos de clientes no activos
    Dado que el archivo de entrada de pagos diarios contiene varios pagos de clientes no activos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con errores y validaciones rechazadas
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores y validaciones rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con riesgo alto y validaciones rechazadas
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con riesgo alto y validaciones rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con insuficiente saldo y validaciones rechazadas
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con insuficiente saldo y validaciones rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos de clientes no activos y validaciones rechazadas
    Dado que el archivo de entrada de pagos diarios contiene varios pagos de clientes no activos y validaciones rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con errores, validaciones rechazadas y riesgo alto
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores, validaciones rechazadas y riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con errores, validaciones rechazadas, riesgo alto y insuficiente saldo
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores, validaciones rechazadas, riesgo alto y insuficiente saldo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con errores, validaciones rechazadas, riesgo alto, insuficiente saldo y clientes no activos
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores, validaciones rechazadas, riesgo alto, insuficiente saldo y clientes no activos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Esquema del escenario: Escenario batch de entrada y salida - varios pagos con diferentes combinaciones de errores y validaciones rechazadas
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con diferentes combinaciones de errores y validaciones rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

    Ejemplos:
      | Errores y validaciones rechazadas |
      | Errores y validaciones rechazadas y riesgo alto |
      | Errores y validaciones rechazadas y riesgo alto y insuficiente saldo |
      | Errores y validaciones rechazadas y riesgo alto y insuficiente saldo y clientes no activos |