Característica: Procesamiento de pagos diarios

  Antecedentes:
    Dado que el archivo de entrada de pagos diarios está disponible
    Y el archivo maestro de clientes está disponible
    Y el archivo maestro de cuentas está disponible
    Y el programa PAYMAIN está disponible en la biblioteca de carga
    Y el archivo de salida de pagos aprobados está configurado
    Y el archivo de salida de pagos rechazados está configurado
    Y el archivo de registro de auditoría está configurado

  Escenario: Flujo feliz - pago aprobado
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es aprobado
    Y el archivo de salida de pagos aprobados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Caso de borde - pago rechazado por falta de fondos
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago supera el límite diario de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Caso de error - pago rechazado por error de validación
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago tiene un error de validación
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago tiene un puntaje de riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago aprobado con revisión de riesgo
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Y el pago tiene un puntaje de riesgo moderado
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es aprobado con revisión de riesgo
    Y el archivo de salida de pagos aprobados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de cliente
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el cliente no está activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de cuenta
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero la cuenta no está abierta
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de KYC
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el cliente no tiene un KYC válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de cliente
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el cliente tiene un riesgo de crédito alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de cuenta
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero la cuenta tiene un riesgo de crédito alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de pago
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago tiene un riesgo de fraude alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de transacción
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero la transacción tiene un riesgo de fraude alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de sistema
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el sistema tiene un riesgo de seguridad alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de infraestructura
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero la infraestructura tiene un riesgo de disponibilidad alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de cumplimiento
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago no cumple con las regulaciones
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de reputación
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago afecta la reputación de la empresa
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de estrategia
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago no se ajusta a la estrategia de la empresa
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de operación
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago no se puede procesar debido a una falla operativa
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de tecnología
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago no se puede procesar debido a una falla tecnológica
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de datos
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago no se puede procesar debido a una falla en los datos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de seguridad
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago no se puede procesar debido a una falla en la seguridad
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de cumplimiento normativo
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago no cumple con las normas regulatorias
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de reputación de la empresa
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago afecta la reputación de la empresa
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de estrategia de la empresa
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago no se ajusta a la estrategia de la empresa
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de operación de la empresa
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago no se puede procesar debido a una falla operativa de la empresa
    Cuando se ejecuta el programa PAYMAIN
    Entonces el pago es rechazado
    Y el archivo de salida de pagos rechazados contiene el pago
    Y el archivo de registro de auditoría contiene el pago

  Escenario: Escenario de validación - pago rechazado por validación de riesgo de tecnología de la empresa
    Dado que el pago tiene un ID de cliente válido
    Y el pago tiene un ID de cuenta válido
    Y el pago tiene un monto válido
    Y el pago tiene una divisa válida
    Y el pago tiene un canal válido
    Y el pago tiene una fecha de solicitud válida
    Pero el pago no se puede procesar debido a una falla tecnológica