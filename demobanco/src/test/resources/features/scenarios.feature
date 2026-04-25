Aquí tienes algunos escenarios Gherkin para el programa COBOL que has proporcionado:

**Escenario 1: Transacción aprobada**

* Dado que el límite diario es de 10000.00
* Cuando el usuario introduce un número de tarjeta válido
* Y la cuenta bancaria es válida
* Y el RFC del cliente es válido
* Y el monto de la transacción es menor o igual a 10000.00
* Entonces la transacción es aprobada

**Escenario 2: Transacción rechazada por exceder límite diario**

* Dado que el límite diario es de 10000.00
* Cuando el usuario introduce un número de tarjeta válido
* Y la cuenta bancaria es válida
* Y el RFC del cliente es válido
* Y el monto de la transacción es mayor a 10000.00
* Entonces la transacción es rechazada

**Escenario 3: Número de tarjeta inválido**

* Dado que el límite diario es de 10000.00
* Cuando el usuario introduce un número de tarjeta inválido
* Entonces se muestra un mensaje de error

**Escenario 4: Cuenta bancaria inválida**

* Dado que el límite diario es de 10000.00
* Cuando el usuario introduce una cuenta bancaria inválida
* Entonces se muestra un mensaje de error

**Escenario 5: RFC del cliente inválido**

* Dado que el límite diario es de 10000.00
* Cuando el usuario introduce un RFC del cliente inválido
* Entonces se muestra un mensaje de error

**Escenario 6: Monto de transacción inválido**

* Dado que el límite diario es de 10000.00
* Cuando el usuario introduce un monto de transacción inválido
* Entonces se muestra un mensaje de error

Estos escenarios cubren diferentes casos de uso y validaciones que se realizan en el programa COBOL. Pueden ser utilizados como base para crear pruebas automatizadas.