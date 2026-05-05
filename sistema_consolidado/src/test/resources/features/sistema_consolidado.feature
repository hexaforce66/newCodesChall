Característica: Procesamiento de pagos diarios

  Antecedentes:
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de cuentas BBVA.ACCOUNT.MASTER existe
    Y el programa PAYMAIN está disponible en BBVA.LEGO.LOADLIB
    Y los archivos de salida BBVA.PAYMENTS.APPROVED, BBVA.PAYMENTS.REJECTED y BBVA.PAYMENTS.AUDIT.LOG no existen

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Flujo feliz - pago rechazado
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Caso de borde - pago con monto máximo permitido
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con monto máximo permitido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Caso de error - archivo de entrada no existe
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado

  Escenario: Caso de error - archivo de clientes no existe
    Dado que el archivo de clientes BBVA.CUSTOMER.MASTER no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado

  Escenario: Caso de error - archivo de cuentas no existe
    Dado que el archivo de cuentas BBVA.ACCOUNT.MASTER no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado

  Escenario: Caso de error - programa PAYMAIN no está disponible
    Dado que el programa PAYMAIN no está disponible en BBVA.LEGO.LOADLIB
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de programa no encontrado

  Escenario: Validación de cliente - cliente no existe
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con un cliente no existente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cliente - cliente bloqueado
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con un cliente bloqueado
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cuenta - cuenta no existe
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con una cuenta no existente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cuenta - cuenta bloqueada
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con una cuenta bloqueada
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de saldo - saldo insuficiente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con un saldo insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de riesgo - riesgo alto
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con un riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de riesgo - riesgo medio
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con un riesgo medio
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Validación de riesgo - riesgo bajo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con un riesgo bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Procesamiento de pago - pago aprobado
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Procesamiento de pago - pago rechazado
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Procesamiento de pago - pago en revisión
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago en revisión
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Procesamiento de pago - pago con error
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de procesamiento de pago

  Escenario: Procesamiento de pago - pago con warning
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con warning
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Procesamiento de pago - pago con información adicional
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con información adicional
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Procesamiento de pago - pago con error de validación
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de validación
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de validación de pago

  Escenario: Procesamiento de pago - pago con error de procesamiento
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de procesamiento
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de procesamiento de pago

  Escenario: Procesamiento de pago - pago con error de salida
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de salida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de salida de pago

  Escenario: Procesamiento de pago - pago con error de auditoría
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de auditoría
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de auditoría de pago

  Escenario: Procesamiento de pago - pago con error de seguridad
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de seguridad
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de seguridad de pago

  Escenario: Procesamiento de pago - pago con error de integridad
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de integridad
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de integridad de pago

  Escenario: Procesamiento de pago - pago con error de consistencia
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de consistencia
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de consistencia de pago

  Escenario: Procesamiento de pago - pago con error de disponibilidad
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de disponibilidad
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de disponibilidad de pago

  Escenario: Procesamiento de pago - pago con error de escalabilidad
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de escalabilidad
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de escalabilidad de pago

  Escenario: Procesamiento de pago - pago con error de rendimiento
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de rendimiento
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de rendimiento de pago

  Escenario: Procesamiento de pago - pago con error de seguridad de datos
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de seguridad de datos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de seguridad de datos de pago

  Escenario: Procesamiento de pago - pago con error de privacidad
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de privacidad
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de privacidad de pago

  Escenario: Procesamiento de pago - pago con error de cumplimiento
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de cumplimiento
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de cumplimiento de pago

  Escenario: Procesamiento de pago - pago con error de gestión de riesgos
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de riesgos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de gestión de riesgos de pago

  Escenario: Procesamiento de pago - pago con error de gestión de calidad
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de calidad
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de gestión de calidad de pago

  Escenario: Procesamiento de pago - pago con error de gestión de cambios
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de cambios
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de gestión de cambios de pago

  Escenario: Procesamiento de pago - pago con error de gestión de configuración
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de configuración
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de gestión de configuración de pago

  Escenario: Procesamiento de pago - pago con error de gestión de documentación
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de documentación
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de gestión de documentación de pago

  Escenario: Procesamiento de pago - pago con error de gestión de infraestructura
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de infraestructura
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de gestión de infraestructura de pago

  Escenario: Procesamiento de pago - pago con error de gestión de seguridad
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de seguridad
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de gestión de seguridad de pago

  Escenario: Procesamiento de pago - pago con error de gestión de cumplimiento
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de cumplimiento
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de gestión de cumplimiento de pago

  Escenario: Procesamiento de pago - pago con error de gestión de riesgos de seguridad
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de riesgos de seguridad
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de gestión de riesgos de seguridad de pago

  Escenario: Procesamiento de pago - pago con error de gestión de calidad de seguridad
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de calidad de seguridad
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de gestión de calidad de seguridad de pago

  Escenario: Procesamiento de pago - pago con error de gestión de cambios de seguridad
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de cambios de seguridad
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de gestión de cambios de seguridad de pago

  Escenario: Procesamiento de pago - pago con error de gestión de configuración de seguridad
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de configuración de seguridad
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de gestión de configuración de seguridad de pago

  Escenario: Procesamiento de pago - pago con error de gestión de documentación de seguridad
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de documentación de seguridad
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de gestión de documentación de seguridad de pago

  Escenario: Procesamiento de pago - pago con error de gestión de infraestructura de seguridad
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con error de gestión de infraestructura de seguridad
    Cuando se ejecuta el programa PAYMAIN