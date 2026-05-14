Característica: Procesamiento de pagos diarios
  Como usuario del sistema de pagos
  Quiero que el sistema procese los pagos diarios de manera correcta
  Para garantizar que los pagos sean validados y procesados de acuerdo con las reglas de negocio

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Y el cliente y la cuenta están activos
    Y el pago no excede el límite diario
    Y el pago no excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es aprobado
    Y se genera un archivo de salida de pagos aprobados
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Caso de borde - pago rechazado por límite diario
    Dado que el archivo de entrada de pagos diarios contiene un pago que excede el límite diario
    Y el cliente y la cuenta están activos
    Y el pago no excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y se genera un archivo de salida de pagos rechazados
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Caso de error - pago rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene un pago que excede el saldo de la cuenta
    Y el cliente y la cuenta están activos
    Y el pago no excede el límite diario
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y se genera un archivo de salida de pagos rechazados
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Validación de cliente - cliente no activo
    Dado que el archivo de entrada de pagos diarios contiene un pago con un cliente no activo
    Y la cuenta está activa
    Y el pago no excede el límite diario
    Y el pago no excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y se genera un archivo de salida de pagos rechazados
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Validación de cuenta - cuenta no activa
    Dado que el archivo de entrada de pagos diarios contiene un pago con una cuenta no activa
    Y el cliente está activo
    Y el pago no excede el límite diario
    Y el pago no excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y se genera un archivo de salida de pagos rechazados
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Escenario de revisión - pago que requiere revisión
    Dado que el archivo de entrada de pagos diarios contiene un pago que requiere revisión
    Y el cliente y la cuenta están activos
    Y el pago no excede el límite diario
    Y el pago no excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es marcado para revisión
    Y se genera un archivo de salida de pagos rechazados
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Escenario de auditoría - pago aprobado con auditoría
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Y el cliente y la cuenta están activos
    Y el pago no excede el límite diario
    Y el pago no excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es aprobado
    Y se genera un archivo de salida de pagos aprobados
    Y se genera un archivo de auditoría con el resultado del pago
    Y el archivo de auditoría contiene la información del pago

  Escenario: Escenario de resumen - resumen de pagos
    Dado que el archivo de entrada de pagos diarios contiene varios pagos
    Y el cliente y la cuenta están activos
    Y los pagos no exceden el límite diario
    Y los pagos no exceden el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un resumen de pagos
    Y el resumen de pagos contiene la información de los pagos procesados