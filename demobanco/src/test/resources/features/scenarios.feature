Feature: Transacciones bancarias
  Como usuario del sistema bancario
  Quiero realizar transacciones bancarias
  Para gestionar mis finanzas de manera efectiva

  Escenario: Transacción aprobada
    Dado que el número de tarjeta es "1234567890123456"
    Y la cuenta bancaria es "1234567890"
    Y el RFC del cliente es "RFC123456789"
    Y el monto de la transacción es "5000.00"
    Cuando se realiza la transacción
    Entonces la respuesta es "Transacción aprobada"

  Escenario: Transacción rechazada por exceder límite diario
    Dado que el número de tarjeta es "1234567890123456"
    Y la cuenta bancaria es "1234567890"
    Y el RFC del cliente es "RFC123456789"
    Y el monto de la transacción es "15000.00"
    Cuando se realiza la transacción
    Entonces la respuesta es "Transacción rechazada: excede límite diario"