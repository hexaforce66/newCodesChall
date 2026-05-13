Característica: Procesamiento de pagos diarios
  Como usuario del sistema de pagos
  Quiero que el sistema procese las instrucciones de pago diarias
  Para generar archivos de pago aprobados, rechazados y auditoría

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago válida
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente válida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago aprobado BBVA.PAYMENTS.APPROVED con la instrucción de pago aprobada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago aprobada

  Escenario: Caso de borde - pago rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con saldo insuficiente
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente válida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de cliente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de cliente
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente inválida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de cuenta
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de cuenta
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente válida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta inválida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de riesgo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de riesgo
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente válida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de pago
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de pago
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente válida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de pago y riesgo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de pago y riesgo
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente válida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de pago, riesgo y cliente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de pago, riesgo y cliente
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente inválida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de pago, riesgo y cuenta
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de pago, riesgo y cuenta
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente válida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta inválida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de pago, riesgo, cliente y cuenta
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de pago, riesgo, cliente y cuenta
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente inválida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta inválida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de pago y cliente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de pago y cliente
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente inválida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de pago y cuenta
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de pago y cuenta
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente válida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta inválida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de pago, cliente y cuenta
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de pago, cliente y cuenta
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente inválida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta inválida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de riesgo y cliente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de riesgo y cliente
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente inválida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de riesgo y cuenta
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de riesgo y cuenta
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente válida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta inválida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de riesgo, cliente y cuenta
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de riesgo, cliente y cuenta
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente inválida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta inválida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de pago, riesgo, cliente y cuenta
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de pago, riesgo, cliente y cuenta
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente inválida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta inválida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de pago y cliente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de pago y cliente
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente inválida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de pago y cuenta
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de pago y cuenta
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente válida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta inválida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de pago, cliente y cuenta
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de pago, cliente y cuenta
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente inválida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta inválida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de riesgo y cliente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de riesgo y cliente
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente inválida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de riesgo y cuenta
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de riesgo y cuenta
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente válida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta inválida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado BBVA.PAYMENTS.REJECTED con la instrucción de pago rechazada
    Y se genera un archivo de auditoría BBVA.PAYMENTS.AUDIT.LOG con la instrucción de pago rechazada

  Escenario: Caso de error - pago rechazado por error de validación de riesgo, cliente y cuenta
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene una instrucción de pago con error de validación de riesgo, cliente y cuenta
    Y el archivo maestro de clientes BBVA.CUSTOMER.MASTER contiene información de cliente inválida
    Y el archivo maestro de cuentas BBVA.ACCOUNT.MASTER contiene información de cuenta inválida
    Cuando se ejecuta el programa PAYMAIN