Característica: Procesamiento de pagos diarios
  Como usuario del sistema de pagos
  Quiero que el sistema procese los pagos diarios de manera correcta
  Para garantizar la integridad de las transacciones

  Antecedentes:
    Dado que el sistema de pagos está configurado correctamente
    Y que los archivos de entrada y salida están disponibles
    Y que los programas y subprogramas están compilados correctamente

  Escenario: Flujo feliz - pago aprobado
    Dado que el pago tiene un ID válido
    Y que el cliente tiene un ID válido
    Y que la cuenta tiene un ID válido
    Y que el monto del pago es válido
    Y que la moneda del pago es válida
    Y que el canal de pago es válido
    Y que la fecha de solicitud del pago es válida
    Y que el cliente está activo
    Y que la cuenta está abierta
    Y que el saldo de la cuenta es suficiente
    Y que el límite diario de la cuenta no es excedido
    Y que el riesgo del pago es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es aprobado
    Y se genera un archivo de pago aprobado
    Y se genera un archivo de auditoría

  Escenario: Flujo feliz - pago rechazado
    Dado que el pago tiene un ID válido
    Y que el cliente tiene un ID válido
    Y que la cuenta tiene un ID válido
    Y que el monto del pago es válido
    Y que la moneda del pago es válida
    Y que el canal de pago es válido
    Y que la fecha de solicitud del pago es válida
    Y que el cliente está activo
    Y que la cuenta está abierta
    Y que el saldo de la cuenta es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Flujo feliz - pago en revisión
    Dado que el pago tiene un ID válido
    Y que el cliente tiene un ID válido
    Y que la cuenta tiene un ID válido
    Y que el monto del pago es válido
    Y que la moneda del pago es válida
    Y que el canal de pago es válido
    Y que la fecha de solicitud del pago es válida
    Y que el cliente está activo
    Y que la cuenta está abierta
    Y que el saldo de la cuenta es suficiente
    Y que el límite diario de la cuenta es excedido
    Y que el riesgo del pago es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago está en revisión
    Y se genera un archivo de pago en revisión
    Y se genera un archivo de auditoría

  Escenario: Caso de borde - pago con monto cero
    Dado que el pago tiene un ID válido
    Y que el cliente tiene un ID válido
    Y que la cuenta tiene un ID válido
    Y que el monto del pago es cero
    Y que la moneda del pago es válida
    Y que el canal de pago es válido
    Y que la fecha de solicitud del pago es válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con ID inválido
    Dado que el pago tiene un ID inválido
    Y que el cliente tiene un ID válido
    Y que la cuenta tiene un ID válido
    Y que el monto del pago es válido
    Y que la moneda del pago es válida
    Y que el canal de pago es válido
    Y que la fecha de solicitud del pago es válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error
    Y se genera un archivo de error
    Y se genera un archivo de auditoría

  Escenario: Caso de error - cliente no activo
    Dado que el pago tiene un ID válido
    Y que el cliente no está activo
    Y que la cuenta tiene un ID válido
    Y que el monto del pago es válido
    Y que la moneda del pago es válida
    Y que el canal de pago es válido
    Y que la fecha de solicitud del pago es válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error
    Y se genera un archivo de error
    Y se genera un archivo de auditoría

  Escenario: Caso de error - cuenta no abierta
    Dado que el pago tiene un ID válido
    Y que el cliente tiene un ID válido
    Y que la cuenta no está abierta
    Y que el monto del pago es válido
    Y que la moneda del pago es válida
    Y que el canal de pago es válido
    Y que la fecha de solicitud del pago es válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error
    Y se genera un archivo de error
    Y se genera un archivo de auditoría

  Escenario: Caso de error - saldo insuficiente
    Dado que el pago tiene un ID válido
    Y que el cliente tiene un ID válido
    Y que la cuenta tiene un ID válido
    Y que el monto del pago es válido
    Y que la moneda del pago es válida
    Y que el canal de pago es válido
    Y que la fecha de solicitud del pago es válida
    Y que el saldo de la cuenta es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error
    Y se genera un archivo de error
    Y se genera un archivo de auditoría

  Escenario: Caso de error - límite diario excedido
    Dado que el pago tiene un ID válido
    Y que el cliente tiene un ID válido
    Y que la cuenta tiene un ID válido
    Y que el monto del pago es válido
    Y que la moneda del pago es válida
    Y que el canal de pago es válido
    Y que la fecha de solicitud del pago es válida
    Y que el límite diario de la cuenta es excedido
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error
    Y se genera un archivo de error
    Y se genera un archivo de auditoría

  Escenario: Caso de error - riesgo alto
    Dado que el pago tiene un ID válido
    Y que el cliente tiene un ID válido
    Y que la cuenta tiene un ID válido
    Y que el monto del pago es válido
    Y que la moneda del pago es válida
    Y que el canal de pago es válido
    Y que la fecha de solicitud del pago es válida
    Y que el riesgo del pago es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error
    Y se genera un archivo de error
    Y se genera un archivo de auditoría

  Escenario: Caso de error - archivo de entrada no encontrado
    Dado que el archivo de entrada no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error
    Y se genera un archivo de error
    Y se genera un archivo de auditoría

  Escenario: Caso de error - archivo de salida no encontrado
    Dado que el archivo de salida no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error
    Y se genera un archivo de error
    Y se genera un archivo de auditoría

  Escenario: Caso de error - error de lectura del archivo de entrada
    Dado que el archivo de entrada no puede ser leído
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error
    Y se genera un archivo de error
    Y se genera un archivo de auditoría

  Escenario: Caso de error - error de escritura del archivo de salida
    Dado que el archivo de salida no puede ser escrito
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error
    Y se genera un archivo de error
    Y se genera un archivo de auditoría