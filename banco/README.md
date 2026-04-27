# 🚀 Reporte: BANCO
## 🧠 Explicación
El código que se muestra es un programa escrito en COBOL (Common Business Oriented Language), un lenguaje de programación de propósito general que se utiliza principalmente para aplicaciones comerciales y de negocios. Este programa parece estar diseñado para procesar transacciones bancarias, actualizando los saldos de cuentas en una base de datos según las transacciones registradas en un archivo de texto llamado "transacciones.txt".

A continuación, se explica el propósito y la funcionalidad del código de manera detallada:

### IDENTIFICATION DIVISION
Esta sección identifica el programa y proporciona información general sobre él. En este caso, el programa se llama "PROCESO-BANCO".

### ENVIRONMENT DIVISION
Esta sección describe el entorno en el que se ejecutará el programa. Aquí se especifica que el programa utilizará un archivo llamado "transacciones.txt" como entrada, organizado de manera secuencial por líneas.

### DATA DIVISION
Esta sección define las estructuras de datos que utilizará el programa. Se dividen en dos partes principales:

- **FILE SECTION**: Define la estructura del archivo de transacciones. Cada registro del archivo (representado por `TRANS-REG`) contiene dos campos: `TR-ID` (un identificador de transacción de 5 dígitos) y `TR-MONTO` (el monto de la transacción, representado por un número de hasta 8 dígitos seguido de dos decimales).

- **WORKING-STORAGE SECTION**: Define las variables que se utilizarán durante la ejecución del programa. Estas incluyen `DB-SALDO` (para almacenar el saldo actual de una cuenta), `ID-BUSCAR` (para almacenar el ID de la cuenta que se está procesando), y secciones para la interoperabilidad con SQL (`EXEC SQL BEGIN DECLARE SECTION` y `EXEC SQL END DECLARE SECTION`).

### PROCEDURE DIVISION
Esta sección contiene el código que se ejecutará. El programa sigue los siguientes pasos:

1. **Abrir el archivo de transacciones**: El programa abre el archivo "transacciones.txt" para lectura.

2. **Procesar transacciones**: En un bucle, el programa lee cada registro del archivo de transacciones. Para cada registro:
   - **Consulta el saldo actual**: Utilizando SQL, el programa consulta el saldo actual de la cuenta identificada por `TR-ID` y lo almacena en `DB-SALDO`.
   - **Sumar el monto de la transacción**: El programa suma el monto de la transacción (`TR-MONTO`) al saldo actual (`DB-SALDO`).
   - **Actualizar el saldo en la base de datos**: Utilizando SQL nuevamente, el programa actualiza el saldo de la cuenta en la base de datos con el nuevo saldo calculado.

3. **Cerrar el archivo y terminar**: Después de procesar todas las transacciones, el programa cierra el archivo de transacciones y termina su ejecución.

En resumen, este programa de COBOL está diseñado para leer transacciones de un archivo de texto, actualizar los saldos correspondientes en una base de datos según esas transacciones, y así reflejar los movimientos en las cuentas bancarias de manera automática.
## 📋 Reglas
| Regla de Negocio | Descripción |
| --- | --- |
| 1 | El sistema debe leer un archivo de transacciones secuencialmente. |
| 2 | El sistema debe buscar el saldo actual de una cuenta en la base de datos antes de realizar cualquier operación. |
| 3 | El sistema debe sumar el monto de la transacción al saldo actual de la cuenta. |
| 4 | El sistema debe actualizar el saldo de la cuenta en la base de datos después de realizar la operación. |
| 5 | El sistema debe cerrar el archivo de transacciones después de procesar todas las transacciones. |
| 6 | El sistema debe detener la ejecución después de cerrar el archivo de transacciones. |
| 7 | El sistema debe utilizar una variable de trabajo para almacenar el saldo actual de la cuenta. |
| 8 | El sistema debe utilizar una variable de trabajo para almacenar el ID de la cuenta a buscar. |
| 9 | El sistema debe utilizar una variable de trabajo para almacenar el monto de la transacción. |
| 10 | El sistema debe utilizar una sentencia SQL para seleccionar el saldo actual de la cuenta. |
| 11 | El sistema debe utilizar una sentencia SQL para actualizar el saldo de la cuenta. |
| 12 | El sistema debe utilizar una sentencia SQL para buscar la cuenta en la base de datos. |
| 13 | El sistema debe utilizar un bucle para procesar todas las transacciones en el archivo. |
| 14 | El sistema debe utilizar una condición de salida para detener el bucle cuando se llegue al final del archivo. |
## 📖 Glosario
| Término | Descripción |
| --- | --- |
| TRANS-FILE | Archivo de transacciones |
| TRANS-REG | Registro de transacciones |
| TR-ID | Identificador de transacción |
| TR-MONTO | Monto de la transacción |
| DB-SALDO | Saldo actual en la base de datos |
| ID-BUSCAR | Identificador de cuenta a buscar |
| CUENTAS | Tabla de cuentas en la base de datos |
| SALDO | Campo de saldo en la tabla de cuentas |
| SELECT | Sentencia SQL para seleccionar datos |
| INTO | Cláusula SQL para almacenar resultados en variables |
| FROM | Cláusula SQL para especificar la tabla de origen |
| WHERE | Cláusula SQL para filtrar datos |
| UPDATE | Sentencia SQL para actualizar datos |
| SET | Cláusula SQL para especificar los cambios |
| EXEC SQL | Sentencia para ejecutar código SQL en COBOL |
| BEGIN DECLARE SECTION | Inicio de la sección de declaración de variables para SQL |
| END DECLARE SECTION | Fin de la sección de declaración de variables para SQL |
| PIC | Declaración de tipo de dato en COBOL (Picture) |
| 9 | Dígito numérico en COBOL |
| V | Separador decimal en COBOL |
| 99 | Dos dígitos decimales en COBOL |
| LINE SEQUENTIAL | Organización del archivo de transacciones (secuencial por línea) |
| ASSIGN TO | Asignación de archivo en COBOL |
| INPUT-OUTPUT SECTION | Sección de entrada y salida en COBOL |
| FILE-CONTROL | Control de archivos en COBOL |
| SELECT | Selección de archivo en COBOL |
| OPEN | Apertura de archivo en COBOL |
| CLOSE | Cierre de archivo en COBOL |
| READ | Lectura de archivo en COBOL |
| AT END | Condición de fin de archivo en COBOL |
| EXIT | Salida del programa en COBOL |
| PERFORM | Ejecución de un bloque de código en COBOL |
| UNTIL | Condición de repetición en COBOL |
| MOVE | Asignación de valor en COBOL |
| COMPUTE | Cálculo en COBOL |
| STOP RUN | Fin del programa en COBOL |
##  🔄 Flujo BPMN
```mermaid
graph TD
A[Leer transacciones] --> B[Procesar transacciones]
    B --> C[Consulta saldo actual]
    C --> D[Sumar monto]
    D --> E[Actualizar BD]
    E --> B
    B --> F[Fin del proceso]