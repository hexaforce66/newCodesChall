# 🚀 Reporte: BANCO
## 🧠 Explicación
El código proporcionado es un programa escrito en COBOL, un lenguaje de programación antiguo pero aún utilizado en algunos sistemas legados, especialmente en el sector financiero y bancario. El propósito de este código es procesar transacciones bancarias almacenadas en un archivo de texto llamado "transacciones.txt" y actualizar los saldos correspondientes en una base de datos.

Aquí hay una explicación detallada de lo que hace el código:

1. **IDENTIFICATION DIVISION**: Esta sección identifica el programa y su propósito.

2. **ENVIRONMENT DIVISION**: Aquí se configura el entorno en el que se ejecutará el programa. Se especifica que se utilizará un archivo llamado "transacciones.txt" para la entrada de datos, y se indica que el archivo está organizado de manera secuencial por líneas.

3. **DATA DIVISION**: En esta sección se definen los datos que se utilizarán en el programa. Se definen dos secciones: **FILE SECTION** y **WORKING-STORAGE SECTION**.
   - **FILE SECTION**: Se define la estructura del registro de transacciones que se leerá del archivo "transacciones.txt". Cada registro tiene un identificador de transacción (TR-ID) y un monto (TR-MONTO).
   - **WORKING-STORAGE SECTION**: Se definen variables que se utilizarán temporalmente durante la ejecución del programa. Estas incluyen el saldo actual de una cuenta (DB-SALDO), el identificador de la cuenta que se está procesando (ID-BUSCAR), y se utilizan sentencias SQL para interactuar con la base de datos.

4. **PROCEDURE DIVISION**: Esta es la sección donde se define la lógica del programa.
   - Se abre el archivo "transacciones.txt" para lectura.
   - Se entra en un bucle que lee cada registro del archivo. Por cada registro:
     - Se extrae el identificador de transacción y se almacena en la variable ID-BUSCAR.
     - Se consulta el saldo actual de la cuenta correspondiente a ID-BUSCAR en la base de datos y se almacena en DB-SALDO.
     - Se suma el monto de la transacción actual al saldo.
     - Se actualiza el saldo en la base de datos.
   - Una vez procesados todos los registros, se cierra el archivo y se finaliza el programa.

En resumen, este código es utilizado para procesar transacciones bancarias de un archivo de texto y actualizar los saldos correspondientes en una base de datos, utilizando COBOL y sentencias SQL para la interacción con la base de datos.
## 📋 Reglas
| Regla de Negocio | Descripción |
| --- | --- |
| 1 | El sistema debe leer un archivo de transacciones secuencialmente. |
| 2 | El sistema debe buscar el saldo actual de una cuenta en la base de datos antes de realizar cualquier operación. |
| 3 | El sistema debe sumar el monto de la transacción al saldo actual de la cuenta. |
| 4 | El sistema debe actualizar el saldo de la cuenta en la base de datos después de realizar la operación. |
| 5 | El sistema debe cerrar el archivo de transacciones después de procesar todas las transacciones. |
| 6 | El sistema debe detener su ejecución después de cerrar el archivo de transacciones. |
| 7 | El sistema debe utilizar una variable de trabajo para almacenar el saldo actual de la cuenta. |
| 8 | El sistema debe utilizar una variable de trabajo para almacenar el ID de la cuenta a buscar. |
| 9 | El sistema debe utilizar una variable de trabajo para almacenar el monto de la transacción. |
| 10 | El sistema debe utilizar una sentencia SQL para seleccionar el saldo de la cuenta en la base de datos. |
| 11 | El sistema debe utilizar una sentencia SQL para actualizar el saldo de la cuenta en la base de datos. |
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
| ID | Campo de identificador en la tabla de cuentas |
| SELECT | Sentencia SQL para seleccionar datos |
| INTO | Cláusula SQL para almacenar datos en una variable |
| FROM | Cláusula SQL para especificar la tabla de origen |
| WHERE | Cláusula SQL para filtrar datos |
| UPDATE | Sentencia SQL para actualizar datos |
| SET | Cláusula SQL para especificar los campos a actualizar |
| EXEC SQL | Sentencia para ejecutar código SQL en un programa COBOL |
| BEGIN DECLARE SECTION | Sentencia para iniciar la declaración de variables para SQL |
| END DECLARE SECTION | Sentencia para finalizar la declaración de variables para SQL |
| END-EXEC | Sentencia para finalizar la ejecución de código SQL |
| OPEN INPUT | Sentencia para abrir un archivo en modo de entrada |
| CLOSE | Sentencia para cerrar un archivo |
| READ | Sentencia para leer un registro de un archivo |
| AT END | Cláusula para especificar la acción a tomar al llegar al final del archivo |
| EXIT | Sentencia para salir de un bucle o programa |
| PERFORM | Sentencia para ejecutar un bloque de código |
| UNTIL | Cláusula para especificar la condición de salida de un bucle |
| MOVE | Sentencia para asignar un valor a una variable |
| COMPUTE | Sentencia para realizar un cálculo y asignar el resultado a una variable |
| STOP RUN | Sentencia para finalizar la ejecución de un programa COBOL |
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