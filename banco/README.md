# 🚀 Reporte: BANCO
## 🧠 Resumen del código
**Documentación del Proceso de Banco**

**Resumen**

Este documento describe el proceso de actualización de saldos en una base de datos de cuentas bancarias. El proceso lee transacciones de un archivo de texto, consulta el saldo actual de la cuenta correspondiente, suma el monto de la transacción y actualiza el saldo en la base de datos.

**Requisitos previos**

* Un archivo de texto llamado "transacciones.txt" que contiene las transacciones a procesar.
* Una base de datos de cuentas bancarias con una tabla llamada "CUENTAS" que contiene los saldos actuales de las cuentas.

**Proceso**

1. **Apertura del archivo de transacciones**: El proceso abre el archivo de texto "transacciones.txt" para leer las transacciones.
2. **Lectura de transacciones**: El proceso lee cada transacción del archivo y la procesa de la siguiente manera:
	* **Consulta del saldo actual**: El proceso consulta el saldo actual de la cuenta correspondiente a la transacción en la base de datos.
	* **Suma del monto**: El proceso suma el monto de la transacción al saldo actual.
	* **Actualización del saldo**: El proceso actualiza el saldo en la base de datos con el nuevo valor.
3. **Cierre del archivo de transacciones**: El proceso cierra el archivo de texto "transacciones.txt" después de procesar todas las transacciones.

**Variables y estructuras de datos**

* **TRANS-FILE**: El archivo de texto que contiene las transacciones a procesar.
* **TRANS-REG**: La estructura de datos que representa una transacción, que contiene los siguientes campos:
	+ **TR-ID**: El identificador de la transacción (5 dígitos).
	+ **TR-MONTO**: El monto de la transacción (8 dígitos con 2 decimales).
* **DB-SALDO**: La variable que almacena el saldo actual de la cuenta en la base de datos.
* **ID-BUSCAR**: La variable que almacena el identificador de la cuenta a buscar en la base de datos.

**Instrucciones SQL**

* **SELECT**: Se utiliza para consultar el saldo actual de la cuenta correspondiente a la transacción en la base de datos.
* **UPDATE**: Se utiliza para actualizar el saldo en la base de datos con el nuevo valor.

**Notas**

* El proceso asume que el archivo de texto "transacciones.txt" está en el mismo directorio que el programa.
* El proceso asume que la base de datos de cuentas bancarias está configurada correctamente y que la tabla "CUENTAS" existe con los campos necesarios.
## 📋 Reglas de negocio identificadas
| Regla | Descripción | Condición | Acción |
| --- | --- | --- | --- |
| 1 | Actualizar saldo de cuenta | Se ha leído una transacción desde el archivo de transacciones | Sumar el monto de la transacción al saldo actual de la cuenta |
| 2 | Consultar saldo actual | Se ha leído una transacción desde el archivo de transacciones | Consultar el saldo actual de la cuenta en la base de datos |
| 3 | Actualizar base de datos | Se ha actualizado el saldo de la cuenta | Actualizar el saldo de la cuenta en la base de datos |
| 4 | Cerrar archivo de transacciones | Se ha terminado de procesar todas las transacciones | Cerrar el archivo de transacciones |
| 5 | Detener ejecución | Se ha terminado de procesar todas las transacciones | Detener la ejecución del programa |
## 📖 Diccionario de datos bancarios
| Término | Definición | Explicación |
| --- | --- | --- |
| **Cuenta** | Una cuenta es un registro financiero que almacena información sobre las transacciones de un cliente o entidad. | En el contexto bancario, una cuenta puede ser de ahorro, corriente, de crédito, etc. |
| **Saldo** | El saldo es el monto total de dinero que se encuentra en una cuenta en un momento determinado. | El saldo puede ser positivo (crédito) o negativo (débito). |
| **Transacción** | Una transacción es un movimiento de dinero entre cuentas o entidades. | Las transacciones pueden ser de débito (retiro de dinero) o crédito (depósito de dinero). |
| **Débito** | Un débito es una transacción que reduce el saldo de una cuenta. | Un ejemplo de débito es un retiro de dinero en efectivo. |
| **Crédito** | Un crédito es una transacción que aumenta el saldo de una cuenta. | Un ejemplo de crédito es un depósito de dinero en una cuenta. |
| **ID** | Un ID (Identificador) es un código único que identifica a una cuenta o entidad. | En el ejemplo, el ID se utiliza para buscar la cuenta correspondiente en la base de datos. |
| **Base de datos** | Una base de datos es un sistema que almacena y gestiona información. | En el contexto bancario, la base de datos almacena información sobre las cuentas y transacciones. |
| **SQL** | SQL (Lenguaje de Consulta Estructurada) es un lenguaje de programación utilizado para gestionar bases de datos. | En el ejemplo, se utiliza SQL para consultar y actualizar la base de datos. |
| **UPDATE** | UPDATE es una instrucción SQL que actualiza los datos en una base de datos. | En el ejemplo, se utiliza UPDATE para actualizar el saldo de la cuenta correspondiente. |
| **SELECT** | SELECT es una instrucción SQL que selecciona datos de una base de datos. | En el ejemplo, se utiliza SELECT para consultar el saldo actual de la cuenta correspondiente. |
| **ORGANIZACIÓN LINEAL SECUENCIAL** | La organización lineal secuencial es un método de almacenamiento de datos en el que los registros se almacenan en orden secuencial. | En el ejemplo, se utiliza la organización lineal secuencial para almacenar las transacciones en el archivo "transacciones.txt". |
| **FILE-CONTROL** | FILE-CONTROL es una sección del lenguaje COBOL que define el control de los archivos. | En el ejemplo, se utiliza FILE-CONTROL para definir el archivo "transacciones.txt" y su organización. |
| **WORKING-STORAGE** | WORKING-STORAGE es una sección del lenguaje COBOL que define las variables de trabajo. | En el ejemplo, se utiliza WORKING-STORAGE para definir las variables DB-SALDO e ID-BUSCAR. |
##  🔄 Flujo BPMN
```mermaid
graph TD
A[ABRIR ARCHIVO TRANS-FILE] --> B[LEER TRANS-FILE]
    B --> C[CONSULTAR SALDO ACTUAL]
    C --> D[SUMAR MONTO]
    D --> E[ACTUALIZAR BD]
    E --> F[REPETIR LECTURA]
    F --> B
    B --> G[CERRAR ARCHIVO TRANS-FILE]
    G --> H[FINALIZAR PROCESO]