# 🚀 Reporte: BANCO
## 🧠 Resumen del código
**Documentación del Proceso de Banco**

**Resumen**

Este documento describe el proceso de actualización de saldos en una base de datos de cuentas bancarias. El proceso lee transacciones de un archivo de texto, consulta el saldo actual de la cuenta correspondiente, suma el monto de la transacción y actualiza el saldo en la base de datos.

**Requisitos previos**

* El archivo de transacciones "transacciones.txt" debe estar en el mismo directorio que el programa.
* La base de datos de cuentas bancarias debe estar configurada y accesible.

**Estructura del archivo de transacciones**

El archivo de transacciones tiene el siguiente formato:

* Cada línea representa una transacción.
* Cada transacción tiene un identificador único de 5 dígitos (TR-ID).
* Cada transacción tiene un monto de 8 dígitos con dos decimales (TR-MONTO).

**Proceso de actualización de saldos**

1. **Abrir el archivo de transacciones**: El programa abre el archivo de transacciones en modo de lectura.
2. **Leer transacciones**: El programa lee cada línea del archivo de transacciones y procesa la transacción correspondiente.
3. **Consulta saldo actual**: El programa consulta el saldo actual de la cuenta correspondiente en la base de datos.
4. **Sumar monto**: El programa suma el monto de la transacción al saldo actual.
5. **Actualizar base de datos**: El programa actualiza el saldo en la base de datos.
6. **Cerrar el archivo de transacciones**: El programa cierra el archivo de transacciones.

**Variables utilizadas**

* `TR-ID`: Identificador único de la transacción (5 dígitos).
* `TR-MONTO`: Monto de la transacción (8 dígitos con dos decimales).
* `DB-SALDO`: Saldo actual de la cuenta en la base de datos.
* `ID-BUSCAR`: Identificador de la cuenta a buscar en la base de datos.

**Sentencias SQL**

* `SELECT SALDO INTO :DB-SALDO FROM CUENTAS WHERE ID = :ID-BUSCAR`: Consulta el saldo actual de la cuenta correspondiente.
* `UPDATE CUENTAS SET SALDO = :DB-SALDO WHERE ID = :ID-BUSCAR`: Actualiza el saldo en la base de datos.

**Notas**

* El programa utiliza un lenguaje de programación COBOL y sentencias SQL para interactuar con la base de datos.
* El programa asume que la base de datos de cuentas bancarias está configurada y accesible.
## 📋 Reglas de negocio identificadas
| Regla | Descripción | Condición | Acción |
| --- | --- | --- | --- |
| 1 | Actualizar saldo de cuenta | Se ha leído una transacción desde el archivo de transacciones | Sumar el monto de la transacción al saldo actual de la cuenta |
| 2 | Consultar saldo actual de cuenta | Se ha leído una transacción desde el archivo de transacciones | Consultar el saldo actual de la cuenta en la base de datos |
| 3 | Actualizar base de datos con nuevo saldo | Se ha actualizado el saldo de la cuenta | Actualizar el saldo de la cuenta en la base de datos |
## 📖 Diccionario de datos bancarios
| Término | Definición | Explicación |
| --- | --- | --- |
| **Cuenta** | Una cuenta es un registro financiero que almacena información sobre las transacciones de un cliente o entidad. | En el contexto bancario, una cuenta puede ser de ahorro, corriente, de crédito, etc. |
| **Saldo** | El saldo es el monto total de dinero que se encuentra en una cuenta en un momento determinado. | El saldo puede ser positivo (crédito) o negativo (débito). |
| **Transacción** | Una transacción es un movimiento de dinero entre cuentas o entidades. | Las transacciones pueden ser de diferentes tipos, como depósitos, retiros, transferencias, etc. |
| **Débito** | Un débito es una transacción que reduce el saldo de una cuenta. | Un ejemplo de débito es un retiro de efectivo o un pago con tarjeta de débito. |
| **Crédito** | Un crédito es una transacción que aumenta el saldo de una cuenta. | Un ejemplo de crédito es un depósito de efectivo o un pago con tarjeta de crédito. |
| **ID de transacción** | El ID de transacción es un código único que identifica una transacción específica. | En el ejemplo de código, el ID de transacción se almacena en la variable `TR-ID`. |
| **Monto de transacción** | El monto de transacción es el valor de la transacción. | En el ejemplo de código, el monto de transacción se almacena en la variable `TR-MONTO`. |
| **Consulta de saldo** | Una consulta de saldo es una operación que obtiene el saldo actual de una cuenta. | En el ejemplo de código, se realiza una consulta de saldo mediante la sentencia SQL `SELECT SALDO INTO :DB-SALDO FROM CUENTAS WHERE ID = :ID-BUSCAR`. |
| **Actualización de saldo** | Una actualización de saldo es una operación que modifica el saldo de una cuenta. | En el ejemplo de código, se actualiza el saldo mediante la sentencia SQL `UPDATE CUENTAS SET SALDO = :DB-SALDO WHERE ID = :ID-BUSCAR`. |
| **Archivo de transacciones** | Un archivo de transacciones es un archivo que almacena información sobre las transacciones realizadas. | En el ejemplo de código, el archivo de transacciones se llama `transacciones.txt`. |
| **Base de datos** | Una base de datos es un sistema que almacena y gestiona datos. | En el ejemplo de código, se utiliza una base de datos para almacenar información sobre las cuentas y transacciones. |
##  🔄 Flujo BPMN
```mermaid
graph TD
A[Abre archivo de transacciones] --> B[Lee transacción]
    B --> C[Consulta saldo actual]
    C --> D[Suma monto]
    D --> E[Actualiza saldo en BD]
    E --> F[Lee siguiente transacción]
    F --> B
    B --> G[Fin del archivo]
    G --> H[Cierra archivo de transacciones]