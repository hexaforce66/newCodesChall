Característica: Procesamiento de pagos diarios

  Antecedentes:
    Dado que el archivo de entrada de pagos diarios está disponible
    Y el archivo de clientes está disponible
    Y el archivo de cuentas está disponible
    Y el programa PAYMAIN está configurado correctamente
    Y el entorno de ejecución está configurado correctamente

  Escenario: Flujo feliz - pago aprobado
    Dado que el pago tiene un ID válido
    Y el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Y el cliente está activo
    Y la cuenta está abierta
    Y el saldo es suficiente
    Y el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es aprobado
    Y se genera un archivo de pago aprobado
    Y se genera un archivo de auditoría

  Escenario: Flujo feliz - pago rechazado
    Dado que el pago tiene un ID válido
    Y el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Y el cliente está bloqueado
    Y la cuenta está cerrada
    Y el saldo es insuficiente
    Y el riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de borde - pago con monto máximo
    Dado que el pago tiene un ID válido
    Y el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto máximo válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Y el cliente está activo
    Y la cuenta está abierta
    Y el saldo es suficiente
    Y el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es aprobado
    Y se genera un archivo de pago aprobado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con ID de cliente inválido
    Dado que el pago tiene un ID válido
    Y el pago tiene un ID de cliente inválido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación de cliente
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con ID de cuenta inválido
    Dado que el pago tiene un ID válido
    Y el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta inválido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación de cuenta
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con monto inválido
    Dado que el pago tiene un ID válido
    Y el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto inválido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación de monto
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con divisa inválida
    Dado que el pago tiene un ID válido
    Y el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa inválida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación de divisa
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con canal inválido
    Dado que el pago tiene un ID válido
    Y el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal inválido
    Y el pago tiene una fecha de solicitud válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación de canal
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con fecha de solicitud inválida
    Dado que el pago tiene un ID válido
    Y el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud inválida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación de fecha de solicitud
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con riesgo alto
    Dado que el pago tiene un ID válido
    Y el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Y el riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación de riesgo
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con saldo insuficiente
    Dado que el pago tiene un ID válido
    Y el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Y el saldo es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación de saldo
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con cuenta cerrada
    Dado que el pago tiene un ID válido
    Y el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Y la cuenta está cerrada
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación de cuenta
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con cliente bloqueado
    Dado que el pago tiene un ID válido
    Y el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Y el cliente está bloqueado
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación de cliente
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con archivo de entrada inválido
    Dado que el archivo de entrada de pagos diarios no está disponible
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo de entrada
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con archivo de clientes inválido
    Dado que el archivo de clientes no está disponible
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo de clientes
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con archivo de cuentas inválido
    Dado que el archivo de cuentas no está disponible
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo de cuentas
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con programa PAYMAIN no configurado
    Dado que el programa PAYMAIN no está configurado correctamente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de configuración
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría

  Escenario: Caso de error - pago con entorno de ejecución no configurado
    Dado que el entorno de ejecución no está configurado correctamente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de entorno de ejecución
    Y se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría