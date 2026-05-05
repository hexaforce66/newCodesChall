Característica: Procesamiento de pagos diarios
  Como un sistema de pago
  Quiero procesar pagos diarios de manera segura y eficiente
  Para garantizar la integridad de las transacciones y cumplir con los requisitos de seguridad

  Antecedentes:
    Dado que el sistema de pago está configurado correctamente
    Y los archivos de entrada y salida están disponibles
    Y los programas COBOL y JCL están compilados y vinculados correctamente

  Escenario: Flujo feliz - pago aprobado
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido y está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el riesgo del pago es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es aprobado
    Y se genera un archivo de pago aprobado con el ID del pago y el mensaje "APPROVED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "APPROVED"

  Escenario: Flujo feliz - pago rechazado por riesgo
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido y está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el riesgo del pago es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por riesgo
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Flujo feliz - pago rechazado por saldo insuficiente
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido y está abierta
    Y el monto del pago es válido pero excede el saldo disponible
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por saldo insuficiente
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Caso de borde - pago con monto máximo permitido
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido y está abierta
    Y el monto del pago es el máximo permitido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es aprobado
    Y se genera un archivo de pago aprobado con el ID del pago y el mensaje "APPROVED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "APPROVED"

  Escenario: Caso de error - pago con ID inválido
    Dado que el pago tiene un ID inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Caso de error - cliente no activo
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido pero no está activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Caso de error - cuenta no abierta
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido pero no está abierta
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con riesgo bajo
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido y está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el riesgo del pago es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es aprobado
    Y se genera un archivo de pago aprobado con el ID del pago y el mensaje "APPROVED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "APPROVED"

  Escenario: Escenario de validación - pago con riesgo alto
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido y está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el riesgo del pago es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por riesgo
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con saldo insuficiente
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido y está abierta
    Y el monto del pago es válido pero excede el saldo disponible
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por saldo insuficiente
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con ID inválido
    Dado que el pago tiene un ID inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - cliente no activo
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido pero no está activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - cuenta no abierta
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido pero no está abierta
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con riesgo bajo y saldo insuficiente
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido y está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el riesgo del pago es bajo
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por saldo insuficiente
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con riesgo alto y saldo insuficiente
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido y está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el riesgo del pago es alto
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por riesgo y saldo insuficiente
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con ID inválido y saldo insuficiente
    Dado que el pago tiene un ID inválido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido y está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - cliente no activo y saldo insuficiente
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido pero no está activo
    Y la cuenta tiene un ID válido y está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - cuenta no abierta y saldo insuficiente
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido pero no está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con riesgo bajo y saldo insuficiente y cuenta no abierta
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido pero no está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el riesgo del pago es bajo
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con riesgo alto y saldo insuficiente y cuenta no abierta
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido pero no está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el riesgo del pago es alto
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con ID inválido y saldo insuficiente y cuenta no abierta
    Dado que el pago tiene un ID inválido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido pero no está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - cliente no activo y saldo insuficiente y cuenta no abierta
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido pero no está activo
    Y la cuenta tiene un ID válido pero no está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con riesgo bajo y saldo insuficiente y cuenta no abierta y cliente no activo
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido pero no está activo
    Y la cuenta tiene un ID válido pero no está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el riesgo del pago es bajo
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con riesgo alto y saldo insuficiente y cuenta no abierta y cliente no activo
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido pero no está activo
    Y la cuenta tiene un ID válido pero no está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el riesgo del pago es alto
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con ID inválido y saldo insuficiente y cuenta no abierta y cliente no activo
    Dado que el pago tiene un ID inválido
    Y el cliente tiene un ID válido pero no está activo
    Y la cuenta tiene un ID válido pero no está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con riesgo bajo y saldo insuficiente y cuenta no abierta y cliente no activo y ID inválido
    Dado que el pago tiene un ID inválido
    Y el cliente tiene un ID válido pero no está activo
    Y la cuenta tiene un ID válido pero no está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el riesgo del pago es bajo
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "REJECTED"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "REJECTED"

  Escenario: Escenario de validación - pago con riesgo alto y saldo insuficiente y cuenta no abierta y cliente no activo y ID inválido
    Dado que el pago tiene un ID inválido
    Y el cliente tiene un ID válido pero no está activo
    Y la cuenta tiene un ID válido pero no está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el riesgo del pago es alto
    Y el saldo disponible es insuficiente
    Cuando se ejecuta el programa