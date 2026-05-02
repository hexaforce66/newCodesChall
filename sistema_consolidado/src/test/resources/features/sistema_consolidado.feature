Característica: Procesamiento de pagos diarios

  Escenario: Flujo feliz de pago aprobado
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente y la cuenta están activos
    Y el pago no excede el límite diario
    Y el pago no excede el saldo de la cuenta
    Y el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos aprobados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago aprobado
    Y se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por riesgo
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente y la cuenta están activos
    Y el pago no excede el límite diario
    Y el pago no excede el saldo de la cuenta
    Y el riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por saldo insuficiente
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente y la cuenta están activos
    Y el pago excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por límite diario excedido
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente y la cuenta están activos
    Y el pago excede el límite diario
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por cliente o cuenta no activos
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por KYC incompleto
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente tiene KYC incompleto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por riesgo y saldo insuficiente
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente y la cuenta están activos
    Y el pago excede el saldo de la cuenta
    Y el riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por límite diario excedido y riesgo
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente y la cuenta están activos
    Y el pago excede el límite diario
    Y el riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por cliente o cuenta no activos y riesgo
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por KYC incompleto y riesgo
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente tiene KYC incompleto
    Y el riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por saldo insuficiente y KYC incompleto
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente tiene KYC incompleto
    Y el pago excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por límite diario excedido y KYC incompleto
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente tiene KYC incompleto
    Y el pago excede el límite diario
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por cliente o cuenta no activos y KYC incompleto
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el cliente tiene KYC incompleto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por saldo insuficiente y cliente o cuenta no activos
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el pago excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por límite diario excedido y cliente o cuenta no activos
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el pago excede el límite diario
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por saldo insuficiente y límite diario excedido
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el pago excede el saldo de la cuenta
    Y el pago excede el límite diario
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por cliente o cuenta no activos y límite diario excedido
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el pago excede el límite diario
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por KYC incompleto y límite diario excedido
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente tiene KYC incompleto
    Y el pago excede el límite diario
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por saldo insuficiente y KYC incompleto y límite diario excedido
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente tiene KYC incompleto
    Y el pago excede el saldo de la cuenta
    Y el pago excede el límite diario
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por cliente o cuenta no activos y KYC incompleto y límite diario excedido
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el cliente tiene KYC incompleto
    Y el pago excede el límite diario
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por saldo insuficiente y cliente o cuenta no activos y límite diario excedido
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el pago excede el saldo de la cuenta
    Y el pago excede el límite diario
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por saldo insuficiente y KYC incompleto y cliente o cuenta no activos
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el cliente tiene KYC incompleto
    Y el pago excede el saldo de la cuenta
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por saldo insuficiente y KYC incompleto y cliente o cuenta no activos y límite diario excedido
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el cliente tiene KYC incompleto
    Y el pago excede el saldo de la cuenta
    Y el pago excede el límite diario
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por saldo insuficiente y KYC incompleto y cliente o cuenta no activos y límite diario excedido y riesgo
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el cliente tiene KYC incompleto
    Y el pago excede el saldo de la cuenta
    Y el pago excede el límite diario
    Y el riesgo es alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por saldo insuficiente y KYC incompleto y cliente o cuenta no activos y límite diario excedido y riesgo y cliente o cuenta no activos
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el cliente tiene KYC incompleto
    Y el pago excede el saldo de la cuenta
    Y el pago excede el límite diario
    Y el riesgo es alto
    Y el cliente o la cuenta no están activos
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por saldo insuficiente y KYC incompleto y cliente o cuenta no activos y límite diario excedido y riesgo y cliente o cuenta no activos y KYC incompleto
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el cliente tiene KYC incompleto
    Y el pago excede el saldo de la cuenta
    Y el pago excede el límite diario
    Y el riesgo es alto
    Y el cliente o la cuenta no están activos
    Y el cliente tiene KYC incompleto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por saldo insuficiente y KYC incompleto y cliente o cuenta no activos y límite diario excedido y riesgo y cliente o cuenta no activos y KYC incompleto y límite diario excedido
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el cliente tiene KYC incompleto
    Y el pago excede el saldo de la cuenta
    Y el pago excede el límite diario
    Y el riesgo es alto
    Y el cliente o la cuenta no están activos
    Y el cliente tiene KYC incompleto
    Y el pago excede el límite diario
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de salida de pagos rechazados con el registro de pago
    Y se genera un archivo de auditoría con el registro de pago rechazado
    Y no se actualiza el saldo de la cuenta

  Escenario: Flujo feliz de pago rechazado por saldo insuficiente y KYC incompleto y cliente o cuenta no activos y límite diario excedido y riesgo y cliente o cuenta no activos y KYC incompleto y límite diario excedido y riesgo
    Dado un archivo de entrada de pagos diarios con un registro de pago válido
    Y el cliente o la cuenta no están activos
    Y el cliente tiene KYC incompleto
    Y el pago excede el saldo de la cuenta
    Y el pago excede el