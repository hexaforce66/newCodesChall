Característica: Procesamiento de pagos diarios
  Como un sistema de pago
  Quiero procesar pagos diarios de manera eficiente y segura
  Para garantizar la integridad de las transacciones y cumplir con los requisitos de riesgo

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
    Y se genera un archivo de pago aprobado con el ID del pago y el mensaje "Aprobado"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Aprobado"

  Escenario: Flujo feliz - pago rechazado por riesgo
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido y está abierta
    Y el monto del pago es válido y no excede el límite diario
    Y el riesgo del pago es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por riesgo
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Rechazado por riesgo"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Rechazado por riesgo"

  Escenario: Flujo feliz - pago rechazado por saldo insuficiente
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido y está abierta
    Y el monto del pago es válido pero excede el saldo disponible
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por saldo insuficiente
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Saldo insuficiente"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Saldo insuficiente"

  Escenario: Flujo feliz - pago rechazado por cuenta bloqueada
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido y está activo
    Y la cuenta tiene un ID válido pero está bloqueada
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por cuenta bloqueada
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Cuenta bloqueada"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Cuenta bloqueada"

  Escenario: Flujo feliz - pago rechazado por cliente no activo
    Dado que el pago tiene un ID válido
    Y el cliente tiene un ID válido pero no está activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por cliente no activo
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Cliente no activo"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Cliente no activo"

  Escenario: Flujo feliz - pago rechazado por ID de pago inválido
    Dado que el pago tiene un ID inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por ID de pago inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "ID de pago inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "ID de pago inválido"

  Escenario: Flujo feliz - pago rechazado por ID de cliente inválido
    Dado que el pago tiene un ID de cliente inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por ID de cliente inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "ID de cliente inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "ID de cliente inválido"

  Escenario: Flujo feliz - pago rechazado por ID de cuenta inválido
    Dado que el pago tiene un ID de cuenta inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por ID de cuenta inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "ID de cuenta inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "ID de cuenta inválido"

  Escenario: Flujo feliz - pago rechazado por monto de pago inválido
    Dado que el pago tiene un monto de pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por monto de pago inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Monto de pago inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Monto de pago inválido"

  Escenario: Flujo feliz - pago rechazado por riesgo de pago inválido
    Dado que el pago tiene un riesgo de pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por riesgo de pago inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Riesgo de pago inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Riesgo de pago inválido"

  Escenario: Flujo feliz - pago rechazado por saldo disponible insuficiente
    Dado que el pago tiene un saldo disponible insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por saldo disponible insuficiente
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Saldo disponible insuficiente"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Saldo disponible insuficiente"

  Escenario: Flujo feliz - pago rechazado por cuenta no abierta
    Dado que el pago tiene una cuenta no abierta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por cuenta no abierta
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Cuenta no abierta"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Cuenta no abierta"

  Escenario: Flujo feliz - pago rechazado por cliente no activo
    Dado que el pago tiene un cliente no activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por cliente no activo
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Cliente no activo"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Cliente no activo"

  Escenario: Flujo feliz - pago rechazado por ID de pago inválido
    Dado que el pago tiene un ID de pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por ID de pago inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "ID de pago inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "ID de pago inválido"

  Escenario: Flujo feliz - pago rechazado por ID de cliente inválido
    Dado que el pago tiene un ID de cliente inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por ID de cliente inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "ID de cliente inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "ID de cliente inválido"

  Escenario: Flujo feliz - pago rechazado por ID de cuenta inválido
    Dado que el pago tiene un ID de cuenta inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por ID de cuenta inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "ID de cuenta inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "ID de cuenta inválido"

  Escenario: Flujo feliz - pago rechazado por monto de pago inválido
    Dado que el pago tiene un monto de pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por monto de pago inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Monto de pago inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Monto de pago inválido"

  Escenario: Flujo feliz - pago rechazado por riesgo de pago inválido
    Dado que el pago tiene un riesgo de pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por riesgo de pago inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Riesgo de pago inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Riesgo de pago inválido"

  Escenario: Flujo feliz - pago rechazado por saldo disponible insuficiente
    Dado que el pago tiene un saldo disponible insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por saldo disponible insuficiente
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Saldo disponible insuficiente"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Saldo disponible insuficiente"

  Escenario: Flujo feliz - pago rechazado por cuenta no abierta
    Dado que el pago tiene una cuenta no abierta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por cuenta no abierta
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Cuenta no abierta"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Cuenta no abierta"

  Escenario: Flujo feliz - pago rechazado por cliente no activo
    Dado que el pago tiene un cliente no activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por cliente no activo
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Cliente no activo"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Cliente no activo"

  Escenario: Flujo feliz - pago rechazado por ID de pago inválido
    Dado que el pago tiene un ID de pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por ID de pago inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "ID de pago inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "ID de pago inválido"

  Escenario: Flujo feliz - pago rechazado por ID de cliente inválido
    Dado que el pago tiene un ID de cliente inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por ID de cliente inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "ID de cliente inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "ID de cliente inválido"

  Escenario: Flujo feliz - pago rechazado por ID de cuenta inválido
    Dado que el pago tiene un ID de cuenta inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por ID de cuenta inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "ID de cuenta inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "ID de cuenta inválido"

  Escenario: Flujo feliz - pago rechazado por monto de pago inválido
    Dado que el pago tiene un monto de pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por monto de pago inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Monto de pago inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Monto de pago inválido"

  Escenario: Flujo feliz - pago rechazado por riesgo de pago inválido
    Dado que el pago tiene un riesgo de pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por riesgo de pago inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Riesgo de pago inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Riesgo de pago inválido"

  Escenario: Flujo feliz - pago rechazado por saldo disponible insuficiente
    Dado que el pago tiene un saldo disponible insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por saldo disponible insuficiente
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Saldo disponible insuficiente"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Saldo disponible insuficiente"

  Escenario: Flujo feliz - pago rechazado por cuenta no abierta
    Dado que el pago tiene una cuenta no abierta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por cuenta no abierta
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Cuenta no abierta"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Cuenta no abierta"

  Escenario: Flujo feliz - pago rechazado por cliente no activo
    Dado que el pago tiene un cliente no activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por cliente no activo
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Cliente no activo"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Cliente no activo"

  Escenario: Flujo feliz - pago rechazado por ID de pago inválido
    Dado que el pago tiene un ID de pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por ID de pago inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "ID de pago inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "ID de pago inválido"

  Escenario: Flujo feliz - pago rechazado por ID de cliente inválido
    Dado que el pago tiene un ID de cliente inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por ID de cliente inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "ID de cliente inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "ID de cliente inválido"

  Escenario: Flujo feliz - pago rechazado por ID de cuenta inválido
    Dado que el pago tiene un ID de cuenta inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por ID de cuenta inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "ID de cuenta inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "ID de cuenta inválido"

  Escenario: Flujo feliz - pago rechazado por monto de pago inválido
    Dado que el pago tiene un monto de pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por monto de pago inválido
    Y se genera un archivo de pago rechazado con el ID del pago y el mensaje "Monto de pago inválido"
    Y se actualiza el archivo de auditoría con el ID del pago y el mensaje "Monto de pago inválido"

  Escenario: Flujo feliz - pago rechazado por riesgo de pago inválido
    Dado que el pago tiene un riesgo de pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado por riesgo de pago inválido
    Y se genera un archivo