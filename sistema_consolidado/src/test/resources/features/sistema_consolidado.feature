Característica: Procesamiento de pagos diarios
  Como usuario del sistema de pagos
  Quiero que el sistema procese los pagos diarios de manera correcta
  Para garantizar la integridad de las transacciones

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Y el cliente y la cuenta están activos
    Y el pago no excede el límite diario
    Y el pago no excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago se aprueba y se escribe en el archivo de pagos aprobados
    Y se escribe un registro de auditoría con el resultado del pago

  Escenario: Caso de borde - pago rechazado por límite diario
    Dado que el archivo de entrada de pagos diarios contiene un pago que excede el límite diario
    Y el cliente y la cuenta están activos
    Y el pago no excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago se rechaza y se escribe en el archivo de pagos rechazados
    Y se escribe un registro de auditoría con el resultado del pago

  Escenario: Caso de error - pago rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene un pago que excede el saldo de la cuenta
    Y el cliente y la cuenta están activos
    Y el pago no excede el límite diario
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago se rechaza y se escribe en el archivo de pagos rechazados
    Y se escribe un registro de auditoría con el resultado del pago

  Escenario: Validación de cliente - cliente no activo
    Dado que el archivo de entrada de pagos diarios contiene un pago con un cliente no activo
    Y la cuenta está activa
    Y el pago no excede el límite diario
    Y el pago no excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago se rechaza y se escribe en el archivo de pagos rechazados
    Y se escribe un registro de auditoría con el resultado del pago

  Escenario: Validación de cuenta - cuenta no activa
    Dado que el archivo de entrada de pagos diarios contiene un pago con una cuenta no activa
    Y el cliente está activo
    Y el pago no excede el límite diario
    Y el pago no excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago se rechaza y se escribe en el archivo de pagos rechazados
    Y se escribe un registro de auditoría con el resultado del pago

  Escenario: Escenario batch de entrada y salida
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos
    Y los clientes y cuentas están activos
    Y los pagos no exceden los límites diarios
    Y los pagos no exceden los saldos de las cuentas
    Cuando se ejecuta el programa PAYMAIN
    Entonces los pagos se aprueban y se escriben en el archivo de pagos aprobados
    Y se escriben registros de auditoría con los resultados de los pagos

  Escenario: Escenario de validación de riesgo - pago aprobado
    Dado que el archivo de entrada de pagos diarios contiene un pago con un riesgo bajo
    Y el cliente y la cuenta están activos
    Y el pago no excede el límite diario
    Y el pago no excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago se aprueba y se escribe en el archivo de pagos aprobados
    Y se escribe un registro de auditoría con el resultado del pago

  Escenario: Escenario de validación de riesgo - pago rechazado por riesgo
    Dado que el archivo de entrada de pagos diarios contiene un pago con un riesgo alto
    Y el cliente y la cuenta están activos
    Y el pago no excede el límite diario
    Y el pago no excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago se rechaza y se escribe en el archivo de pagos rechazados
    Y se escribe un registro de auditoría con el resultado del pago

  Escenario: Escenario de validación de riesgo - pago en revisión
    Dado que el archivo de entrada de pagos diarios contiene un pago con un riesgo medio
    Y el cliente y la cuenta están activos
    Y el pago no excede el límite diario
    Y el pago no excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago se pone en revisión y se escribe en el archivo de pagos en revisión
    Y se escribe un registro de auditoría con el resultado del pago