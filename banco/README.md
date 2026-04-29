# 🚀 Reporte: BANCO
## 🧠 Resumen del código
**Documentación del Proceso de Banco**

**Resumen**

Este documento describe el proceso de actualización de saldos en una base de datos de cuentas bancarias. El proceso lee transacciones de un archivo de texto, consulta el saldo actual de la cuenta correspondiente, suma el monto de la transacción y actualiza el saldo en la base de datos.

**Requisitos previos**

* El archivo de texto "transacciones.txt" debe contener las transacciones a procesar, con el formato:
 + ID de transacción (5 dígitos)
 + Monto de la transacción (8 dígitos con 2 decimales)
* La base de datos de cuentas bancarias debe tener una tabla "CUENTAS" con los siguientes campos:
 + ID (5 dígitos)
 + SALDO (10 dígitos con 2 decimales)

**Proceso**

1. **Apertura del archivo de transacciones**: Se abre el archivo de texto "transacciones.txt" para lectura.
2. **Lectura de transacciones**: Se lee cada transacción del archivo y se almacena en la variable `TR-REG`.
3. **Consulta de saldo actual**: Se consulta el saldo actual de la cuenta correspondiente a la transacción mediante una sentencia SQL.
4. **Actualización de saldo**: Se suma el monto de la transacción al saldo actual y se almacena en la variable `DB-SALDO`.
5. **Actualización de la base de datos**: Se actualiza el saldo en la base de datos mediante una sentencia SQL.
6. **Cierre del archivo de transacciones**: Se cierra el archivo de texto "transacciones.txt".

**Variables**

* `TR-ID`: ID de transacción (5 dígitos)
* `TR-MONTO`: Monto de la transacción (8 dígitos con 2 decimales)
* `DB-SALDO`: Saldo actual de la cuenta (10 dígitos con 2 decimales)
* `ID-BUSCAR`: ID de la cuenta a buscar (5 dígitos)

**Sentencias SQL**

* `SELECT SALDO INTO :DB-SALDO FROM CUENTAS WHERE ID = :ID-BUSCAR`: Consulta el saldo actual de la cuenta correspondiente a la transacción.
* `UPDATE CUENTAS SET SALDO = :DB-SALDO WHERE ID = :ID-BUSCAR`: Actualiza el saldo en la base de datos.

**Notas**

* El proceso asume que el archivo de texto "transacciones.txt" está en el mismo directorio que el programa.
* El proceso utiliza sentencias SQL para interactuar con la base de datos.
* El proceso utiliza variables para almacenar los datos de la transacción y el saldo actual.
## 📋 Reglas de negocio identificadas
| Regla | Descripción | Condición | Acción |
| --- | --- | --- | --- |
| 1 | Actualizar saldo de cuenta | Se ha leído una transacción desde el archivo de transacciones | Sumar el monto de la transacción al saldo actual de la cuenta |
| 2 | Consultar saldo actual | Se ha leído una transacción desde el archivo de transacciones | Consultar el saldo actual de la cuenta en la base de datos |
| 3 | Actualizar base de datos | Se ha actualizado el saldo de la cuenta | Actualizar el saldo de la cuenta en la base de datos |
## 📖 Diccionario de datos bancarios
| Término | Definición | Explicación |
| --- | --- | --- |
| **Cuenta** | Una cuenta es un registro financiero que almacena información sobre las transacciones de un cliente o entidad. | En el contexto del programa, una cuenta se identifica por un ID único (TR-ID) y tiene un saldo asociado (DB-SALDO). |
| **Transacción** | Una transacción es un movimiento de dinero entre cuentas o una operación financiera que afecta el saldo de una cuenta. | En el programa, las transacciones se almacenan en un archivo de texto (transacciones.txt) y se procesan para actualizar los saldos de las cuentas correspondientes. |
| **Saldo** | El saldo es el monto total de dinero que se encuentra en una cuenta en un momento determinado. | En el programa, el saldo se almacena en la variable DB-SALDO y se actualiza después de procesar cada transacción. |
| **ID** | Un ID es un identificador único que se asigna a una cuenta o entidad para distinguirla de otras. | En el programa, el ID se utiliza para buscar la cuenta correspondiente en la base de datos y actualizar su saldo. |
| **Monto** | El monto es el valor de una transacción o el importe que se suma o resta del saldo de una cuenta. | En el programa, el monto se almacena en la variable TR-MONTO y se utiliza para actualizar el saldo de la cuenta correspondiente. |
| **Base de datos** | Una base de datos es un sistema que almacena y gestiona datos de manera estructurada. | En el programa, la base de datos se utiliza para almacenar información sobre las cuentas y sus saldos, y se actualiza después de procesar cada transacción. |
| **Consulta** | Una consulta es una solicitud de información a una base de datos. | En el programa, se realiza una consulta para obtener el saldo actual de una cuenta antes de actualizarlo. |
| **Actualización** | Una actualización es un cambio en la información almacenada en una base de datos. | En el programa, se actualiza el saldo de una cuenta después de procesar una transacción. |
| **Archivo de texto** | Un archivo de texto es un archivo que contiene información en formato de texto plano. | En el programa, el archivo de texto (transacciones.txt) se utiliza para almacenar las transacciones que se van a procesar. |
| **Secuencia lineal** | Una secuencia lineal es un método de organización de datos en el que los registros se almacenan en orden secuencial. | En el programa, el archivo de texto se organiza en secuencia lineal, lo que significa que los registros se almacenan uno después del otro. |
##  🔄 Flujo BPMN
```mermaid
graph TD
A[Abre archivo transacciones.txt] --> B[Lee transacciones]
    B --> C[Consulta saldo actual en BD]
    C --> D[Suma monto a saldo]
    D --> E[Actualiza saldo en BD]
    E --> F[Repite hasta finalizar transacciones]
    F --> G[Cierra archivo transacciones.txt]