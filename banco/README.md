# 🚀 Reporte: BANCO
## 🧠 Resumen del código
**Documentación del Proceso de Banco**

**Resumen**

Este documento describe el proceso de actualización de saldos en una base de datos de cuentas bancarias. El proceso lee transacciones de un archivo de texto, consulta el saldo actual de la cuenta correspondiente, suma el monto de la transacción y actualiza el saldo en la base de datos.

**Requisitos previos**

* El archivo de transacciones "transacciones.txt" debe estar en el mismo directorio que el programa.
* La base de datos de cuentas bancarias debe estar configurada y accesible.

**Funcionamiento**

1. **Lectura de transacciones**: El programa lee el archivo de transacciones "transacciones.txt" línea por línea.
2. **Consulta de saldo actual**: Para cada transacción, el programa consulta el saldo actual de la cuenta correspondiente en la base de datos.
3. **Actualización de saldo**: El programa suma el monto de la transacción al saldo actual y actualiza el saldo en la base de datos.
4. **Cierre del archivo**: Después de procesar todas las transacciones, el programa cierra el archivo de transacciones.

**Variables y estructuras de datos**

* `TRANS-FILE`: archivo de transacciones
* `TRANS-REG`: registro de transacción
	+ `TR-ID`: identificador de transacción (5 dígitos)
	+ `TR-MONTO`: monto de la transacción (8 dígitos con 2 decimales)
* `DB-SALDO`: saldo actual de la cuenta (10 dígitos con 2 decimales)
* `ID-BUSCAR`: identificador de cuenta a buscar (5 dígitos)

**Instrucciones SQL**

* `SELECT SALDO INTO :DB-SALDO FROM CUENTAS WHERE ID = :ID-BUSCAR`: consulta el saldo actual de la cuenta correspondiente.
* `UPDATE CUENTAS SET SALDO = :DB-SALDO WHERE ID = :ID-BUSCAR`: actualiza el saldo en la base de datos.

**Notas**

* El programa utiliza un lenguaje de programación COBOL y un sistema de gestión de bases de datos relacional.
* El archivo de transacciones debe tener un formato específico para que el programa pueda leerlo correctamente.
* El programa asume que la base de datos de cuentas bancarias está configurada y accesible.
## 📋 Reglas de negocio identificadas
| Regla | Descripción | Condición | Acción |
| --- | --- | --- | --- |
| 1 | Actualizar saldo de cuenta | El ID de la transacción coincide con el ID de la cuenta en la base de datos | Sumar el monto de la transacción al saldo actual de la cuenta y actualizar la base de datos |
| 2 | Leer transacciones | El archivo de transacciones tiene registros | Leer el siguiente registro del archivo de transacciones y procesarlo |
| 3 | Finalizar proceso | Se ha llegado al final del archivo de transacciones | Cerrar el archivo de transacciones y finalizar el proceso |
## 📖 Diccionario de datos bancarios
| Término | Definición | Explicación |
| --- | --- | --- |
| **Cuenta** | Una cuenta es un registro que almacena la información financiera de un cliente o entidad en un banco. | Las cuentas pueden ser de ahorro, corrientes, de crédito, etc. |
| **Saldo** | El saldo es el monto total de dinero que se encuentra en una cuenta en un momento determinado. | El saldo puede ser positivo (crédito) o negativo (débito). |
| **Transacción** | Una transacción es cualquier operación financiera que se realiza en una cuenta, como un depósito, retiro, transferencia, etc. | Las transacciones pueden ser realizadas en línea, en persona o a través de dispositivos móviles. |
| **Débito** | Un débito es una transacción que reduce el saldo de una cuenta. | Los débitos pueden ser automáticos, como los pagos de servicios, o manuales, como los retiros de efectivo. |
| **Crédito** | Un crédito es una transacción que aumenta el saldo de una cuenta. | Los créditos pueden ser depósitos, transferencias o ingresos por servicios prestados. |
| **ID de transacción** | El ID de transacción es un código único que identifica cada transacción realizada en una cuenta. | El ID de transacción se utiliza para rastrear y verificar las transacciones. |
| **Monto** | El monto es el valor de una transacción, expresado en unidades monetarias. | El monto puede ser positivo (crédito) o negativo (débito). |
| **Consulta de saldo** | Una consulta de saldo es una operación que permite obtener el saldo actual de una cuenta. | Las consultas de saldo se pueden realizar en línea, en persona o a través de dispositivos móviles. |
| **Actualización de saldo** | La actualización de saldo es la operación que se realiza para reflejar los cambios en el saldo de una cuenta después de una transacción. | La actualización de saldo se realiza automáticamente después de cada transacción. |
| **Base de datos** | Una base de datos es un sistema que almacena y gestiona la información financiera de las cuentas y transacciones. | Las bases de datos se utilizan para almacenar y procesar la información financiera de manera segura y eficiente. |
| **SQL** | SQL (Lenguaje de Consulta Estructurada) es un lenguaje de programación utilizado para gestionar y manipular bases de datos relacionales. | SQL se utiliza para realizar consultas, actualizaciones y manipulaciones de datos en bases de datos. |
##  🔄 Flujo BPMN
```mermaid
graph TD
A[Leer archivo de transacciones] --> B[Extraer ID y monto]
    B --> C[Consulta saldo en BD]
    C --> D[Sumar monto]
    D --> E[Actualizar BD]
    E --> F[Repetir lectura de transacciones]
    F --> G[Cerrar archivo y terminar]