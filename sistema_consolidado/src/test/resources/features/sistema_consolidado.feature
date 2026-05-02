Característica: Procesamiento de pagos diarios

  Escenario: Flujo feliz de pago aprobado
    Dado un archivo de entrada de pagos diarios con un pago válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago aprobado con el pago procesado
    Y se genera un archivo de auditoría con el pago aprobado
    Y se muestra un resumen con el número de pagos aprobados

  Escenario: Flujo feliz de pago rechazado
    Dado un archivo de entrada de pagos diarios con un pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado con el pago rechazado
    Y se genera un archivo de auditoría con el pago rechazado
    Y se muestra un resumen con el número de pagos rechazados

  Escenario: Caso de borde - pago con monto máximo permitido
    Dado un archivo de entrada de pagos diarios con un pago con monto máximo permitido
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago aprobado con el pago procesado
    Y se genera un archivo de auditoría con el pago aprobado
    Y se muestra un resumen con el número de pagos aprobados

  Escenario: Caso de error - archivo de entrada vacío
    Dado un archivo de entrada de pagos diarios vacío
    Cuando se ejecuta el programa PAYMAIN
    Entonces se muestra un mensaje de error indicando que el archivo de entrada está vacío
    Y no se generan archivos de pago aprobado ni rechazado
    Y no se muestra un resumen

  Escenario: Caso de error - archivo de entrada con formato incorrecto
    Dado un archivo de entrada de pagos diarios con formato incorrecto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se muestra un mensaje de error indicando que el archivo de entrada tiene formato incorrecto
    Y no se generan archivos de pago aprobado ni rechazado
    Y no se muestra un resumen

  Escenario: Validación de cliente - cliente activo
    Dado un archivo de entrada de pagos diarios con un cliente activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago aprobado con el pago procesado
    Y se genera un archivo de auditoría con el pago aprobado
    Y se muestra un resumen con el número de pagos aprobados

  Escenario: Caso de cliente - cliente bloqueado
    Dado un archivo de entrada de pagos diarios con un cliente bloqueado
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado con el pago rechazado
    Y se genera un archivo de auditoría con el pago rechazado
    Y se muestra un resumen con el número de pagos rechazados

  Escenario: Caso de cuenta - cuenta abierta
    Dado un archivo de entrada de pagos diarios con una cuenta abierta
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago aprobado con el pago procesado
    Y se genera un archivo de auditoría con el pago aprobado
    Y se muestra un resumen con el número de pagos aprobados

  Escenario: Caso de cuenta - cuenta bloqueada
    Dado un archivo de entrada de pagos diarios con una cuenta bloqueada
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado con el pago rechazado
    Y se genera un archivo de auditoría con el pago rechazado
    Y se muestra un resumen con el número de pagos rechazados

  Escenario: Caso de riesgo - riesgo bajo
    Dado un archivo de entrada de pagos diarios con un riesgo bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago aprobado con el pago procesado
    Y se genera un archivo de auditoría con el pago aprobado
    Y se muestra un resumen con el número de pagos aprobados

  Escenario: Caso de riesgo - riesgo alto
    Dado un archivo de entrada de pagos diarios con un riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado con el pago rechazado
    Y se genera un archivo de auditoría con el pago rechazado
    Y se muestra un resumen con el número de pagos rechazados

  Escenario: Caso de validación - validación aprobada
    Dado un archivo de entrada de pagos diarios con una validación aprobada
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago aprobado con el pago procesado
    Y se genera un archivo de auditoría con el pago aprobado
    Y se muestra un resumen con el número de pagos aprobados

  Escenario: Caso de validación - validación rechazada
    Dado un archivo de entrada de pagos diarios con una validación rechazada
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado con el pago rechazado
    Y se genera un archivo de auditoría con el pago rechazado
    Y se muestra un resumen con el número de pagos rechazados

  Escenario: Caso de auditoría - auditoría exitosa
    Dado un archivo de entrada de pagos diarios con una auditoría exitosa
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago aprobado con el pago procesado
    Y se genera un archivo de auditoría con el pago aprobado
    Y se muestra un resumen con el número de pagos aprobados

  Escenario: Caso de auditoría - auditoría fallida
    Dado un archivo de entrada de pagos diarios con una auditoría fallida
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado con el pago rechazado
    Y se genera un archivo de auditoría con el pago rechazado
    Y se muestra un resumen con el número de pagos rechazados

  Escenario: Caso de resumen - resumen exitoso
    Dado un archivo de entrada de pagos diarios con un resumen exitoso
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago aprobado con el pago procesado
    Y se genera un archivo de auditoría con el pago aprobado
    Y se muestra un resumen con el número de pagos aprobados

  Escenario: Caso de resumen - resumen fallido
    Dado un archivo de entrada de pagos diarios con un resumen fallido
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado con el pago rechazado
    Y se genera un archivo de auditoría con el pago rechazado
    Y se muestra un resumen con el número de pagos rechazados