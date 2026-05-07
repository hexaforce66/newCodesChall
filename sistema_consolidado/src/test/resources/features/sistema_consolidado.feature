Característica: Procesamiento de pagos diarios

  Antecedentes:
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER existe
    Y el programa PAYMAIN está disponible en la biblioteca BBVA.LEGO.LOADLIB

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos aprobados BBVA.PAYMENTS.APPROVED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene el pago aprobado

  Escenario: Caso de borde - pago rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene un pago con saldo insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene el pago rechazado

  Escenario: Caso de error - pago rechazado por error de validación de cliente
    Dado que el archivo de entrada de pagos diarios contiene un pago con error de validación de cliente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene el pago rechazado

  Escenario: Validación de cliente rechaza la operación
    Dado que el archivo de entrada de pagos diarios contiene un pago con cliente no válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene el pago rechazado

  Escenario: Escenario batch de entrada y salida
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos aprobados BBVA.PAYMENTS.APPROVED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene todos los pagos aprobados

  Escenario: Escenario batch de entrada y salida con pagos rechazados
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos y rechazados
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos aprobados BBVA.PAYMENTS.APPROVED
    Y se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene todos los pagos aprobados y rechazados

  Escenario: Escenario batch de entrada y salida con error de validación de cliente
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con error de validación de cliente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene todos los pagos rechazados

  Escenario: Escenario batch de entrada y salida con saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con saldo insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene todos los pagos rechazados

  Escenario: Escenario batch de entrada y salida con pago rechazado por riesgo
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene todos los pagos rechazados

  Escenario: Escenario batch de entrada y salida con pago aprobado y rechazado
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos y rechazados
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos aprobados BBVA.PAYMENTS.APPROVED
    Y se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene todos los pagos aprobados y rechazados

  Escenario: Escenario batch de entrada y salida con pago aprobado y rechazado por riesgo
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos y rechazados por riesgo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos aprobados BBVA.PAYMENTS.APPROVED
    Y se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene todos los pagos aprobados y rechazados

  Escenario: Escenario batch de entrada y salida con pago aprobado y rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos y rechazados por saldo insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos aprobados BBVA.PAYMENTS.APPROVED
    Y se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene todos los pagos aprobados y rechazados

  Escenario: Escenario batch de entrada y salida con pago aprobado y rechazado por error de validación de cliente
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos y rechazados por error de validación de cliente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos aprobados BBVA.PAYMENTS.APPROVED
    Y se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene todos los pagos aprobados y rechazados

  Escenario: Escenario batch de entrada y salida con pago aprobado y rechazado por riesgo y saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos y rechazados por riesgo y saldo insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos aprobados BBVA.PAYMENTS.APPROVED
    Y se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene todos los pagos aprobados y rechazados

  Escenario: Escenario batch de entrada y salida con pago aprobado y rechazado por riesgo y error de validación de cliente
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos y rechazados por riesgo y error de validación de cliente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos aprobados BBVA.PAYMENTS.APPROVED
    Y se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene todos los pagos aprobados y rechazados

  Escenario: Escenario batch de entrada y salida con pago aprobado y rechazado por saldo insuficiente y error de validación de cliente
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos y rechazados por saldo insuficiente y error de validación de cliente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos aprobados BBVA.PAYMENTS.APPROVED
    Y se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene todos los pagos aprobados y rechazados

  Escenario: Escenario batch de entrada y salida con pago aprobado y rechazado por riesgo, saldo insuficiente y error de validación de cliente
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos y rechazados por riesgo, saldo insuficiente y error de validación de cliente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pagos aprobados BBVA.PAYMENTS.APPROVED
    Y se genera un archivo de pagos rechazados BBVA.PAYMENTS.REJECTED
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG
    Y el archivo de auditoría contiene todos los pagos aprobados y rechazados