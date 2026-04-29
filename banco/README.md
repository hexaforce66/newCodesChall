# 🚀 Reporte: BANCO
## 🧠 Resumen del código
**Proceso de Actualización de Saldo en Cuentas Bancarias**

**Resumen**

Este documento describe el proceso de actualización de saldo en cuentas bancarias utilizando un programa en COBOL que interactúa con una base de datos. El proceso lee transacciones de un archivo de texto, consulta el saldo actual de la cuenta correspondiente, suma el monto de la transacción y actualiza el saldo en la base de datos.

**Requisitos previos**

* Un archivo de texto llamado "transacciones.txt" que contiene las transacciones a procesar, con el formato:
 + ID de transacción (5 dígitos)
 + Monto de la transacción (8 dígitos con 2 decimales)
* Una base de datos con una tabla llamada "CUENTAS" que contiene los saldos actuales de las cuentas, con los campos:
 + ID (5 dígitos)
 + SALDO (10 dígitos con 2 decimales)

**Proceso**

1. **Apertura del archivo de transacciones**: El programa abre el archivo "transacciones.txt" en modo de lectura.
2. **Lectura de transacciones**: El programa lee cada transacción del archivo y la procesa de la siguiente manera:
	* **Consulta de saldo actual**: El programa consulta el saldo actual de la cuenta correspondiente a la transacción en la base de datos.
	* **Suma de monto**: El programa suma el monto de la transacción al saldo actual.
	* **Actualización de saldo**: El programa actualiza el saldo en la base de datos con el nuevo valor.
3. **Cierre del archivo de transacciones**: El programa cierra el archivo "transacciones.txt" después de procesar todas las transacciones.

**Estructura del programa**

El programa está estructurado de la siguiente manera:

* **IDENTIFICATION DIVISION**: Se define el nombre del programa y su propósito.
* **ENVIRONMENT DIVISION**: Se define la configuración del entorno, incluyendo la asignación del archivo de transacciones.
* **DATA DIVISION**: Se definen las variables y estructuras de datos utilizadas en el programa.
* **PROCEDURE DIVISION**: Se define el flujo de ejecución del programa, incluyendo la lectura de transacciones, la consulta de saldo actual, la suma de monto y la actualización de saldo.

**Notas**

* El programa utiliza sentencias SQL para interactuar con la base de datos.
* El programa utiliza variables y estructuras de datos definidas en la sección **DATA DIVISION** para almacenar y manipular los datos.
* El programa utiliza la sección **PROCEDURE DIVISION** para definir el flujo de ejecución del programa.
## 📋 Reglas de negocio identificadas
| Regla | Descripción | Condición | Acción |
| --- | --- | --- | --- |
| 1 | Actualizar saldo de cuenta | Se ha leído una transacción desde el archivo de transacciones | Sumar el monto de la transacción al saldo actual de la cuenta |
| 2 | Consultar saldo actual | Se ha leído una transacción desde el archivo de transacciones | Consultar el saldo actual de la cuenta en la base de datos |
| 3 | Actualizar base de datos | Se ha actualizado el saldo de la cuenta | Actualizar el saldo de la cuenta en la base de datos |
## 📖 Diccionario de datos bancarios
| Término | Definición | Explicación |
| --- | --- | --- |
| **Cuenta** | Una cuenta es un registro financiero que almacena información sobre las transacciones de un cliente o entidad. | En el contexto bancario, una cuenta puede ser de ahorro, corriente, de crédito, etc. |
| **Saldo** | El saldo es el monto total de dinero que se encuentra en una cuenta en un momento determinado. | El saldo puede ser positivo (crédito) o negativo (débito). |
| **Transacción** | Una transacción es un movimiento de dinero entre cuentas, ya sea entrada (ingreso) o salida (egreso). | Las transacciones pueden ser de diferentes tipos, como depósitos, retiros, transferencias, etc. |
| **Débito** | Un débito es una transacción que reduce el saldo de una cuenta. | Un ejemplo de débito es un retiro de efectivo o un pago con tarjeta de débito. |
| **Crédito** | Un crédito es una transacción que aumenta el saldo de una cuenta. | Un ejemplo de crédito es un depósito de efectivo o un pago con tarjeta de crédito. |
| **ID de transacción** | El ID de transacción es un código único que identifica una transacción específica. | En el ejemplo de código, el ID de transacción se almacena en la variable `TR-ID`. |
| **Monto de transacción** | El monto de transacción es el valor de la transacción, ya sea débito o crédito. | En el ejemplo de código, el monto de transacción se almacena en la variable `TR-MONTO`. |
| **Consulta de saldo** | Una consulta de saldo es una operación que obtiene el saldo actual de una cuenta. | En el ejemplo de código, se realiza una consulta de saldo mediante la sentencia SQL `SELECT SALDO INTO :DB-SALDO`. |
| **Actualización de saldo** | Una actualización de saldo es una operación que modifica el saldo de una cuenta. | En el ejemplo de código, se actualiza el saldo mediante la sentencia SQL `UPDATE CUENTAS SET SALDO = :DB-SALDO`. |
| **Base de datos** | Una base de datos es un sistema que almacena y gestiona datos de manera estructurada. | En el ejemplo de código, se utiliza una base de datos para almacenar información sobre las cuentas y transacciones. |
| **SQL** | SQL (Structured Query Language) es un lenguaje de programación utilizado para gestionar bases de datos relacionales. | En el ejemplo de código, se utiliza SQL para realizar consultas y actualizaciones en la base de datos. |
##  🔄 Flujo BPMN
```mermaid
graph TD
A[Leer transacciones] --> B[Procesar transacciones]
    B --> C[Consulta saldo]
    C --> D[Sumar monto]
    D --> E[Actualizar BD]
    E --> B
    B --> F[Fin del proceso]