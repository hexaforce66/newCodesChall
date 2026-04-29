# 🚀 Reporte: BANCO
## 🧠 Resumen del código
**Proceso de Actualización de Saldo en Cuentas Bancarias**

**Resumen**

Este documento describe el proceso de actualización de saldo en cuentas bancarias utilizando un programa en COBOL que interactúa con una base de datos. El proceso lee transacciones de un archivo de texto, consulta el saldo actual de la cuenta correspondiente, suma el monto de la transacción y actualiza el saldo en la base de datos.

**Requisitos previos**

* Un archivo de texto llamado "transacciones.txt" que contiene las transacciones a procesar, con el formato:
 + ID de transacción (5 dígitos)
 + Monto de la transacción (8 dígitos con 2 decimales)
* Una base de datos con una tabla llamada "CUENTAS" que contiene los saldos actuales de las cuentas, con los siguientes campos:
 + ID (5 dígitos)
 + SALDO (10 dígitos con 2 decimales)

**Proceso**

1. **Apertura del archivo de transacciones**: El programa abre el archivo de texto "transacciones.txt" para leer las transacciones.
2. **Lectura de transacciones**: El programa lee cada transacción del archivo y la procesa de la siguiente manera:
	* **Consulta de saldo actual**: El programa consulta el saldo actual de la cuenta correspondiente a la transacción en la base de datos.
	* **Suma de monto**: El programa suma el monto de la transacción al saldo actual.
	* **Actualización de saldo**: El programa actualiza el saldo en la base de datos con el nuevo valor.
3. **Cierre del archivo de transacciones**: El programa cierra el archivo de texto "transacciones.txt" después de procesar todas las transacciones.

**Código**

El código COBOL que implementa este proceso es el siguiente:
```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. PROCESO-BANCO.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       SELECT TRANS-FILE ASSIGN TO "transacciones.txt"
       ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  TRANS-FILE.
01  TRANS-REG.
       05 TR-ID      PIC 9(5).
       05 TR-MONTO   PIC 9(8)V99.

WORKING-STORAGE SECTION.
EXEC SQL BEGIN DECLARE SECTION END-EXEC.
01 DB-SALDO       PIC 9(10)V99.
01 ID-BUSCAR      PIC 9(5).
EXEC SQL END DECLARE SECTION END-EXEC.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
       OPEN INPUT TRANS-FILE.
       PERFORM UNTIL EXIT
              READ TRANS-FILE AT END EXIT PERFORM END-READ
              MOVE TR-ID TO ID-BUSCAR
               
               * Consulta saldo actual
               EXEC SQL SELECT SALDO INTO :DB-SALDO 
                        FROM CUENTAS WHERE ID = :ID-BUSCAR END-EXEC
               
               * Sumar monto
               COMPUTE DB-SALDO = DB-SALDO + TR-MONTO
               
               * Actualizar BD
               EXEC SQL UPDATE CUENTAS SET SALDO = :DB-SALDO 
                        WHERE ID = :ID-BUSCAR END-EXEC
       END-PERFORM.
       CLOSE TRANS-FILE.
       STOP RUN.
```
**Notas**

* El programa utiliza la sentencia `EXEC SQL` para interactuar con la base de datos.
* El programa utiliza la sentencia `COMPUTE` para realizar la suma del monto de la transacción al saldo actual.
* El programa utiliza la sentencia `UPDATE` para actualizar el saldo en la base de datos.
## 📋 Reglas de negocio identificadas
| Regla | Descripción | Condición | Acción |
| --- | --- | --- | --- |
| 1 | Actualizar saldo de cuenta | Se ha leído una transacción desde el archivo de transacciones | Sumar el monto de la transacción al saldo actual de la cuenta |
| 2 | Consultar saldo actual de cuenta | Se ha leído una transacción desde el archivo de transacciones | Consultar el saldo actual de la cuenta en la base de datos |
| 3 | Actualizar base de datos con nuevo saldo | Se ha actualizado el saldo de la cuenta | Actualizar el saldo de la cuenta en la base de datos |
## 📖 Diccionario de datos bancarios
| Término | Definición | Explicación |
| --- | --- | --- |
| **Cuenta** | Una cuenta es un registro que muestra la relación entre un cliente y un banco, donde se almacenan los movimientos financieros. | En el contexto del programa, una cuenta se identifica por un ID único (TR-ID) y tiene un saldo asociado (DB-SALDO). |
| **Transacción** | Una transacción es un movimiento financiero que se realiza en una cuenta, como un depósito, retiro o transferencia. | En el programa, las transacciones se almacenan en un archivo llamado "transacciones.txt" y se procesan una a una para actualizar el saldo de la cuenta correspondiente. |
| **Saldo** | El saldo es el monto total de dinero que se encuentra en una cuenta en un momento determinado. | En el programa, el saldo se almacena en la variable DB-SALDO y se actualiza después de procesar cada transacción. |
| **ID** | Un ID es un identificador único que se asigna a una cuenta o transacción para distinguirla de otras. | En el programa, el ID de la cuenta se almacena en la variable ID-BUSCAR y se utiliza para buscar la cuenta correspondiente en la base de datos. |
| **Monto** | El monto es el valor de una transacción, que puede ser positivo (depósito) o negativo (retiro). | En el programa, el monto de la transacción se almacena en la variable TR-MONTO y se suma o resta del saldo de la cuenta correspondiente. |
| **Base de datos** | Una base de datos es un conjunto de datos almacenados de manera estructurada para facilitar su acceso y manipulación. | En el programa, la base de datos se utiliza para almacenar la información de las cuentas y sus respectivos saldos. |
| **Consulta** | Una consulta es una solicitud de información a la base de datos para obtener datos específicos. | En el programa, se realiza una consulta a la base de datos para obtener el saldo actual de una cuenta antes de procesar una transacción. |
| **Actualización** | Una actualización es el proceso de modificar los datos existentes en una base de datos. | En el programa, se actualiza el saldo de una cuenta en la base de datos después de procesar una transacción. |
| **Archivo** | Un archivo es un conjunto de datos almacenados en un formato específico para su posterior uso. | En el programa, se utiliza un archivo llamado "transacciones.txt" para almacenar las transacciones que se van a procesar. |
| **Lectura** | La lectura es el proceso de obtener datos de un archivo o base de datos. | En el programa, se lee el archivo "transacciones.txt" para obtener las transacciones que se van a procesar. |
| **Escritura** | La escritura es el proceso de almacenar datos en un archivo o base de datos. | En el programa, se escribe la actualización del saldo en la base de datos después de procesar una transacción. |
##  🔄 Flujo BPMN
```mermaid
graph TD
A[ABRIR ARCHIVO TRANSACCIONES] --> B[LEER TRANSACCIONES]
    B --> C[CONSULTAR SALDO ACTUAL]
    C --> D[SUMAR MONTO]
    D --> E[ACTUALIZAR SALDO EN BD]
    E --> F[REPETIR LECTURA DE TRANSACCIONES]
    F --> G[CERRAR ARCHIVO TRANSACCIONES]
    G --> H[FINALIZAR PROCESO]