Característica: Procesamiento de pagos diarios
  Como usuario del sistema de pagos
  Quiero que el sistema procese los pagos diarios de manera correcta
  Para asegurarme de que los pagos sean validados y procesados correctamente

  Antecedentes:
    Dado que el sistema de pagos está configurado correctamente
    Y que los archivos de entrada y salida están disponibles

  Escenario: Flujo feliz - pago aprobado
    Dado que el pago tiene un ID válido
    Y que el cliente tiene un ID válido
    Y que la cuenta tiene un ID válido
    Y que el monto del pago es válido
    Y que la moneda del pago es válida
    Y que el canal de pago es válido
    Y que la fecha de solicitud del pago es válida
    Cuando el sistema procesa el pago
    Entonces el pago es aprobado
    Y el archivo de salida de pagos aprobados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Flujo feliz - pago rechazado
    Dado que el pago tiene un ID válido
    Y que el cliente tiene un ID válido
    Y que la cuenta tiene un ID válido
    Y que el monto del pago es válido
    Y que la moneda del pago es válida
    Y que el canal de pago es válido
    Y que la fecha de solicitud del pago es válida
    Pero que el pago no cumple con las políticas de riesgo
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Caso de borde - pago con monto máximo permitido
    Dado que el pago tiene un ID válido
    Y que el cliente tiene un ID válido
    Y que la cuenta tiene un ID válido
    Y que el monto del pago es el máximo permitido
    Y que la moneda del pago es válida
    Y que el canal de pago es válido
    Y que la fecha de solicitud del pago es válida
    Cuando el sistema procesa el pago
    Entonces el pago es aprobado
    Y el archivo de salida de pagos aprobados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Caso de error - pago con ID inválido
    Dado que el pago tiene un ID inválido
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Caso de error - pago con cliente inválido
    Dado que el pago tiene un cliente inválido
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Caso de error - pago con cuenta inválida
    Dado que el pago tiene una cuenta inválida
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Caso de error - pago con monto inválido
    Dado que el pago tiene un monto inválido
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Caso de error - pago con moneda inválida
    Dado que el pago tiene una moneda inválida
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Caso de error - pago con canal de pago inválido
    Dado que el pago tiene un canal de pago inválido
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Caso de error - pago con fecha de solicitud inválida
    Dado que el pago tiene una fecha de solicitud inválida
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Validación de cliente - cliente bloqueado
    Dado que el cliente tiene un ID válido
    Pero que el cliente está bloqueado
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Validación de cliente - cliente cerrado
    Dado que el cliente tiene un ID válido
    Pero que el cliente está cerrado
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Validación de cliente - cliente sin KYC
    Dado que el cliente tiene un ID válido
    Pero que el cliente no tiene KYC
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Validación de cuenta - cuenta bloqueada
    Dado que la cuenta tiene un ID válido
    Pero que la cuenta está bloqueada
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Validación de cuenta - cuenta cerrada
    Dado que la cuenta tiene un ID válido
    Pero que la cuenta está cerrada
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Validación de cuenta - cuenta con saldo insuficiente
    Dado que la cuenta tiene un ID válido
    Pero que la cuenta tiene saldo insuficiente
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Validación de riesgo - pago con riesgo alto
    Dado que el pago tiene un ID válido
    Y que el pago tiene un riesgo alto
    Cuando el sistema procesa el pago
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Validación de riesgo - pago con riesgo medio
    Dado que el pago tiene un ID válido
    Y que el pago tiene un riesgo medio
    Cuando el sistema procesa el pago
    Entonces el pago es aprobado
    Y el archivo de salida de pagos aprobados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Validación de riesgo - pago con riesgo bajo
    Dado que el pago tiene un ID válido
    Y que el pago tiene un riesgo bajo
    Cuando el sistema procesa el pago
    Entonces el pago es aprobado
    Y el archivo de salida de pagos aprobados contiene el pago
    Y el archivo de auditoría contiene el pago

  Escenario: Escenario batch de entrada y salida
    Dado que el sistema de pagos está configurado correctamente
    Y que los archivos de entrada y salida están disponibles
    Cuando el sistema procesa el pago
    Entonces el pago es procesado correctamente
    Y el archivo de salida de pagos aprobados contiene el pago
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de auditoría contiene el pago