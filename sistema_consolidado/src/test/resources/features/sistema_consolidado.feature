Característica: Procesamiento de pagos diarios
  Como un sistema de procesamiento de pagos
  Quiero validar y procesar instrucciones de pago
  Para generar archivos de pago aprobados, rechazados y auditoría

Escenario de fondo: Configuración del sistema
  Dado que el sistema está configurado con los siguientes parámetros:
    | Parámetro         | Valor         |
    | PAYMAIN           | PAYMAIN       |
    | BALCHK            | BALCHK        |
    | CUSTVAL           | CUSTVAL       |
    | RISKSCOR          | RISKSCOR      |
    | TXNLOG            | TXNLOG        |
    | ACCOUNT           | ACCOUNT       |
    | CUSTOMER          | CUSTOMER      |
    | PAYMENT           | PAYMENT       |
    | RETURN_CODES      | RETURN_CODES  |
    | BBVA.ACCOUNT.MASTER | BBVA.ACCOUNT.MASTER |
    | BBVA.CUSTOMER.MASTER | BBVA.CUSTOMER.MASTER |
    | BBVA.LEGO.LOADLIB | BBVA.LEGO.LOADLIB |
    | BBVA.PAYMENTS.APPROVED | BBVA.PAYMENTS.APPROVED |
    | BBVA.PAYMENTS.REJECTED | BBVA.PAYMENTS.REJECTED |
    | BBVA.PAYMENTS.AUDIT.LOG | BBVA.PAYMENTS.AUDIT.LOG |
    | BBVA.PAYMENTS.DAILY.INPUT | BBVA.PAYMENTS.DAILY.INPUT |

Escenario: Flujo feliz
  Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago válida
  Cuando se ejecuta el programa PAYMAIN
  Entonces se genera un archivo de pago aprobado con la instrucción de pago
  Y se genera un archivo de auditoría con la instrucción de pago
  Y el archivo de rechazados está vacío

Escenario: Caso de borde - Instrucción de pago con monto máximo permitido
  Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con monto máximo permitido
  Cuando se ejecuta el programa PAYMAIN
  Entonces se genera un archivo de auditoría con la instrucción de pago
  Y el archivo de rechazados está vacío

Escenario: Caso de error - Instrucción de pago con monto superior al máximo permitido
  Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con monto superior al máximo permitido
  Cuando se ejecuta el programa PAYMAIN
  Entonces se genera un archivo de rechazados con la instrucción de pago
  Y el archivo de auditoría contiene la instrucción de pago con un mensaje de error

Escenario: Caso de error - Instrucción de pago con cuenta bloqueada
  Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con cuenta bloqueada
  Cuando se ejecuta el programa PAYMAIN
  Entonces se genera un archivo de rechazados con la instrucción de pago
  Y el archivo de auditoría contiene la instrucción de pago con un mensaje de error

Escenario: Caso de error - Instrucción de pago con cliente no activo
  Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con cliente no activo
  Cuando se ejecuta el programa PAYMAIN
  Entonces se genera un archivo de rechazados con la instrucción de pago
  Y el archivo de auditoría contiene la instrucción de pago con un mensaje de error

Escenario: Caso de error - Instrucción de pago con KYC incompleto
  Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con KYC incompleto
  Cuando se ejecuta el programa PAYMAIN
  Entonces se genera un archivo de rechazados con la instrucción de pago
  Y el archivo de auditoría contiene la instrucción de pago con un mensaje de error

Escenario: Caso de error - Instrucción de pago con riesgo alto
  Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con riesgo alto
  Cuando se ejecuta el programa PAYMAIN
  Entonces se genera un archivo de rechazados con la instrucción de pago
  Y el archivo de auditoría contiene la instrucción de pago con un mensaje de error

Escenario: Caso de error - Instrucción de pago con archivo de entrada vacío
  Dado que el archivo de entrada de pagos diarios está vacío
  Cuando se ejecuta el programa PAYMAIN
  Entonces no se genera ningún archivo de salida

Ejemplos:
  | Instrucción de pago | Resultado esperado |
  | PAY-001;100;EUR;1234567890;2022-01-01 | Aprobado |
  | PAY-002;1000;EUR;1234567890;2022-01-01 | Aprobado |
  | PAY-003;10000;EUR;1234567890;2022-01-01 | Rechazado |
  | PAY-004;100;EUR;9876543210;2022-01-01 | Rechazado |
  | PAY-005;100;EUR;1234567890;2022-01-01 | Rechazado |
  | PAY-006;100;EUR;1234567890;2022-01-01 | Rechazado |
  | PAY-007;100;EUR;1234567890;2022-01-01 | Rechazado |
  | PAY-008;100;EUR;1234567890;2022-01-01 | Rechazado |
  | PAY-009;100;EUR;1234567890;2022-01-01 | Rechazado |
  | PAY-010;100;EUR;1234567890;2022-01-01 | Rechazado |