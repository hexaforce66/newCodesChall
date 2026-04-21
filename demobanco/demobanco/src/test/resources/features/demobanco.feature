Característica: Realizar transacciones bancarias

Escenario: Ingresar número de tarjeta válido
  Dado que el número de tarjeta es "1234567890123456"
  Entonces el número de tarjeta es válido

Escenario: Ingresar cuenta bancaria válida
  Dado que la cuenta bancaria es "1234567890"
  Entonces la cuenta bancaria es válida

Escenario: Ingresar RFC del cliente válido
  Dado que el RFC del cliente es "ABC123456ABC1"
  Entonces el RFC del cliente es válido

Escenario: Ingresar monto de transacción válido
  Dado que el monto de la transacción es "1000.00"
  Entonces el monto de la transacción es válido

Escenario: Ingresar límite diario válido
  Dado que el límite diario es "10000.00"
  Entonces el límite diario es válido

Escenario: Transacción rechazada por exceder límite diario
  Dado que el monto de la transacción es "15000.00"
  Y el límite diario es "10000.00"
  Cuando se realiza la transacción
  Entonces la transacción es rechazada
  Y se muestra el mensaje "Transacción rechazada: monto excede el límite diario"

Escenario: Transacción aprobada por no exceder límite diario
  Dado que el monto de la transacción es "5000.00"
  Y el límite diario es "10000.00"
  Cuando se realiza la transacción
  Entonces la transacción es aprobada
  Y se muestra el mensaje "Transacción aprobada"