Característica: Procesamiento de pagos diarios
  Como usuario del sistema de pagos
  Quiero que el sistema procese las instrucciones de pago diarias
  Para generar archivos de pago aprobados, rechazados y auditoría

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago válida
    Y el cliente y la cuenta están activos
    Y el saldo es suficiente
    Y el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago aprobado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Caso de borde - pago rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con saldo insuficiente
    Y el cliente y la cuenta están activos
    Y el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Caso de error - pago rechazado por riesgo alto
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con riesgo alto
    Y el cliente y la cuenta están activos
    Y el saldo es suficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Validación de cliente - cliente no activo
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con cliente no activo
    Y la cuenta está activa
    Y el saldo es suficiente
    Y el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Validación - cuenta no activa
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con cuenta no activa
    Y el cliente está activo
    Y el saldo es suficiente
    Y el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Validación - saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con saldo insuficiente
    Y el cliente y la cuenta están activos
    Y el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Validación - riesgo alto
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con riesgo alto
    Y el cliente y la cuenta están activos
    Y el saldo es suficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Procesamiento de pago - archivo de entrada vacío
    Dado que el archivo de entrada de pagos diarios está vacío
    Cuando se ejecuta el programa PAYMAIN
    Entonces no se genera ningún archivo de pago
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Procesamiento de pago - archivo de entrada con errores
    Dado que el archivo de entrada de pagos diarios contiene errores
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Procesamiento de pago - archivo de entrada con instrucciones de pago válidas
    Dado que el archivo de entrada de pagos diarios contiene instrucciones de pago válidas
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago aprobado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Procesamiento de pago - archivo de entrada con instrucciones de pago rechazadas
    Dado que el archivo de entrada de pagos diarios contiene instrucciones de pago rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Procesamiento de pago - archivo de entrada con instrucciones de pago en revisión
    Dado que el archivo de entrada de pagos diarios contiene instrucciones de pago en revisión
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago en revisión
    Y se genera un archivo de auditoría con el resultado del pago