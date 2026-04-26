# Características
       Funcionalidad: Realizar transacciones bancarias

       # Escenario: Flujo feliz
       Escenario: Transacción aprobada
         Dado que el número de tarjeta es 1234567890123456
         Y la cuenta bancaria es 1234567890
         Y el RFC del cliente es ABCD123456EFG
         Y el monto de la transacción es 5000.00
         Cuando se realiza la transacción
         Entonces la respuesta es "Transacción aprobada"

       # Escenario: Caso de borde (valor mínimo)
       Escenario: Transacción aprobada con monto mínimo
         Dado que el número de tarjeta es 1234567890123456
         Y la cuenta bancaria es 1234567890
         Y el RFC del cliente es ABCD123456EFG
         Y el monto de la transacción es 0.01
         Cuando se realiza la transacción
         Entonces la respuesta es "Transacción aprobada"

       # Escenario: Caso de borde (valor máximo)
       Escenario: Transacción rechazada por exceder límite diario
         Dado que el número de tarjeta es 1234567890123456
         Y la cuenta bancaria es 1234567890
         Y el RFC del cliente es ABCD123456EFG
         Y el monto de la transacción es 10000.01
         Cuando se realiza la transacción
         Entonces la respuesta es "Transacción rechazada: excede límite diario"

       # Escenario: Caso de error (dato inválido)
       Escenario: Transacción rechazada por RFC inválido
         Dado que el número de tarjeta es 1234567890123456
         Y la cuenta bancaria es 1234567890
         Y el RFC del cliente es ABCD123456
         Y el monto de la transacción es 5000.00
         Cuando se realiza la transacción
         Entonces la respuesta es "Transacción rechazada: RFC inválido"

       # Escenario: Caso de error (dato inválido)
       Escenario: Transacción rechazada por monto inválido
         Dado que el número de tarjeta es 1234567890123456
         Y la cuenta bancaria es 1234567890
         Y el RFC del cliente es ABCD123456EFG
         Y el monto de la transacción es -5000.00
         Cuando se realiza la transacción
         Entonces la respuesta es "Transacción rechazada: monto inválido"

       # Escenario de negocio complejo
       Escenario: Transacción aprobada con varios montos
         Dado que el número de tarjeta es 1234567890123456
         Y la cuenta bancaria es 1234567890
         Y el RFC del cliente es ABCD123456EFG
         Y el monto de la transacción es <monto>
         Cuando se realiza la transacción
         Entonces la respuesta es <respuesta>

         Ejemplos:
           | monto   | respuesta                  |
           | 5000.00 | Transacción aprobada       |
           | 10000.01| Transacción rechazada: excede límite diario |
           | 0.01    | Transacción aprobada       |