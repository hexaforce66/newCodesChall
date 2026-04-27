# 🚀 Reporte: BANCO
## 🧠 Explicación
El código que se muestra es un programa escrito en COBOL (Common Business Oriented Language) que interactúa con una base de datos para procesar transacciones bancarias. A continuación, se explica el propósito y la funcionalidad del código de manera detallada:

**Propósito general:**
El programa está diseñado para leer un archivo de texto (`transacciones.txt`) que contiene registros de transacciones bancarias. Cada registro incluye un identificador de transacción (`TR-ID`) y un monto (`TR-MONTO`). El programa procesa cada transacción, actualizando el saldo correspondiente en una base de datos.

**Estructura del programa:**
El código se divide en cuatro secciones principales:

1. **IDENTIFICATION DIVISION:** Aquí se especifica el nombre del programa (`PROCESO-BANCO`).
2. **ENVIRONMENT DIVISION:** En esta sección se configura el entorno de ejecución, incluyendo la definición de archivos y dispositivos de entrada/salida. En este caso, se selecciona un archivo de texto (`transacciones.txt`) como fuente de datos.
3. **DATA DIVISION:** Aquí se definen las estructuras de datos utilizadas en el programa. Se incluyen dos secciones:
	* **FILE SECTION:** Se define la estructura del archivo de transacciones (`TRANS-FILE`), que incluye un identificador de transacción (`TR-ID`) y un monto (`TR-MONTO`).
	* **WORKING-STORAGE SECTION:** Se definen variables de trabajo para almacenar datos temporales, incluyendo el saldo actual (`DB-SALDO`) y el identificador de transacción a buscar (`ID-BUSCAR`).
4. **PROCEDURE DIVISION:** Esta sección contiene el código de procedimiento que se ejecuta para procesar las transacciones.

**Funcionalidad del programa:**
El programa sigue los siguientes pasos:

1. **Abrir el archivo de transacciones:** Se abre el archivo `transacciones.txt` en modo de entrada.
2. **Leer registros de transacciones:** Se lee cada registro del archivo y se procesa de la siguiente manera:
	* Se mueve el identificador de transacción (`TR-ID`) a la variable `ID-BUSCAR`.
	* Se consulta el saldo actual en la base de datos utilizando una sentencia SQL (`SELECT SALDO INTO :DB-SALDO FROM CUENTAS WHERE ID = :ID-BUSCAR`).
	* Se suma el monto de la transacción al saldo actual (`COMPUTE DB-SALDO = DB-SALDO + TR-MONTO`).
	* Se actualiza el saldo en la base de datos utilizando una sentencia SQL (`UPDATE CUENTAS SET SALDO = :DB-SALDO WHERE ID = :ID-BUSCAR`).
3. **Cerrar el archivo de transacciones:** Se cierra el archivo `transacciones.txt` después de procesar todos los registros.
4. **Finalizar el programa:** Se detiene la ejecución del programa con la instrucción `STOP RUN`.

En resumen, el programa procesa un archivo de transacciones bancarias, actualizando el saldo correspondiente en una base de datos para cada transacción.
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
| SET | Cláusula SQL para especificar los campos a actualizar |
| EXEC SQL | Sentencia para ejecutar código SQL en COBOL |
| BEGIN DECLARE SECTION | Inicio de la sección de declaración de variables para SQL |
| END DECLARE SECTION | Fin de la sección de declaración de variables para SQL |
| PIC | Declaración de tipo de dato en COBOL (Picture) |
| 9 | Dígito numérico en COBOL |
| V | Separador decimal en COBOL |
| 99 | Dos dígitos decimales en COBOL |
| FILE SECTION | Sección de declaración de archivos en COBOL |
| FD | Declaración de archivo en COBOL (File Description) |
| WORKING-STORAGE SECTION | Sección de declaración de variables de trabajo en COBOL |
| MAIN-PROCEDURE | Procedimiento principal en COBOL |
| OPEN | Sentencia para abrir un archivo en COBOL |
| INPUT | Modo de apertura de archivo en COBOL (lectura) |
| READ | Sentencia para leer un registro de un archivo en COBOL |
| AT END | Cláusula para detectar el final del archivo en COBOL |
| EXIT | Sentencia para salir de un bucle en COBOL |
| PERFORM | Sentencia para ejecutar un bloque de código en COBOL |
| UNTIL | Cláusula para repetir un bloque de código en COBOL |
| CLOSE | Sentencia para cerrar un archivo en COBOL |
| STOP RUN | Sentencia para finalizar la ejecución del programa en COBOL |
##  🔄 Flujo BPMN
```mermaid
graph TD
A[ABRIR ARCHIVO TRANS-FILE] --> B[LEER TRANS-FILE]
    B --> C[CONSULTAR SALDO ACTUAL]
    C --> D[SUMAR MONTO]
    D --> E[ACTUALIZAR BD]
    E --> F[REPETIR LECTURA]
    F --> G[CERRAR ARCHIVO TRANS-FILE]
    G --> H[FINALIZAR PROCESO]