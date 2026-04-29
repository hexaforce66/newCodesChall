# 🚀 Reporte: BANCO
## 🧠 Resumen del código
**Documentación del Proceso de Banco**

**Resumen**

Este documento describe el proceso de actualización de saldos en una base de datos de cuentas bancarias. El proceso lee transacciones de un archivo de texto, consulta el saldo actual de la cuenta correspondiente, suma el monto de la transacción y actualiza el saldo en la base de datos.

**Arquitectura del Proceso**

El proceso consta de las siguientes etapas:

1. **Lectura de transacciones**: El proceso lee transacciones de un archivo de texto llamado "transacciones.txt".
2. **Consulta de saldo actual**: Para cada transacción, el proceso consulta el saldo actual de la cuenta correspondiente en la base de datos.
3. **Actualización de saldo**: El proceso suma el monto de la transacción al saldo actual y actualiza el saldo en la base de datos.

**Detalles Técnicos**

* El proceso utiliza un lenguaje de programación COBOL y se conecta a una base de datos utilizando SQL.
* El archivo de transacciones tiene un formato de registro fijo, con los siguientes campos:
	+ `TR-ID`: identificador de la transacción (5 dígitos)
	+ `TR-MONTO`: monto de la transacción (8 dígitos con 2 decimales)
* La base de datos tiene una tabla llamada `CUENTAS` con los siguientes campos:
	+ `ID`: identificador de la cuenta (5 dígitos)
	+ `SALDO`: saldo actual de la cuenta (10 dígitos con 2 decimales)

**Código del Proceso**

El código del proceso se muestra a continuación:
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

* El proceso asume que el archivo de transacciones está en el mismo directorio que el programa.
* El proceso utiliza una conexión a la base de datos utilizando SQL.
* El proceso actualiza el saldo en la base de datos para cada transacción. Si se produce un error durante la actualización, el proceso no realiza ninguna acción adicional.
## 📋 Reglas de negocio identificadas
| Regla | Descripción | Condición | Acción |
| --- | --- | --- | --- |
| 1 | Actualizar saldo de cuenta | Se ha leído una transacción desde el archivo de transacciones | Sumar el monto de la transacción al saldo actual de la cuenta |
| 2 | Consultar saldo actual | Se ha leído una transacción desde el archivo de transacciones | Consultar el saldo actual de la cuenta en la base de datos |
| 3 | Actualizar base de datos | Se ha actualizado el saldo de la cuenta | Actualizar el saldo de la cuenta en la base de datos |
| 4 | Cerrar archivo de transacciones | Se ha terminado de procesar todas las transacciones | Cerrar el archivo de transacciones |
| 5 | Terminar programa | Se ha terminado de procesar todas las transacciones | Terminar la ejecución del programa |
## 📖 Diccionario de datos bancarios
| Término | Definición | Explicación |
| --- | --- | --- |
| Activos | Bienes o derechos que posee una entidad y que tienen un valor económico. | Los activos pueden ser tangibles (como edificios o maquinaria) o intangibles (como patentes o derechos de autor). |
| Ahorro | Parte del ingreso que no se gasta en consumo y se reserva para el futuro. | El ahorro es una forma de acumular riqueza y puede ser utilizado para invertir o para cubrir gastos imprevistos. |
| Amortización | Proceso de reducir el valor de un activo a lo largo del tiempo. | La amortización se utiliza para reflejar la pérdida de valor de un activo debido al desgaste o la obsolescencia. |
| Análisis de riesgo | Evaluación de la probabilidad y el impacto potencial de un evento adverso. | El análisis de riesgo es fundamental para tomar decisiones informadas en el ámbito financiero. |
| Arrendamiento | Contrato por el cual una parte (el arrendador) cede el uso de un bien a otra parte (el arrendatario) a cambio de una renta. | El arrendamiento es una forma de obtener el uso de un bien sin tener que comprarlo. |
| Asignación de activos | Proceso de distribuir los activos de una cartera de inversión entre diferentes clases de activos. | La asignación de activos es fundamental para gestionar el riesgo y maximizar las ganancias. |
| Balance general | Estado financiero que muestra la situación patrimonial de una entidad en un momento determinado. | El balance general es una herramienta fundamental para evaluar la salud financiera de una entidad. |
| Banco | Institución financiera que acepta depósitos y concede préstamos. | Los bancos desempeñan un papel fundamental en el sistema financiero, ya que facilitan la intermediación financiera. |
| Bono | Título de deuda emitido por una entidad para financiar sus actividades. | Los bonos son una forma de inversión en deuda y ofrecen una rentabilidad fija. |
| Cartera de inversión | Conjunto de activos financieros que posee un inversor. | La cartera de inversión puede incluir acciones, bonos, fondos mutuos, etc. |
| Cuenta corriente | Cuenta bancaria que permite a un cliente realizar operaciones de pago y recepción de fondos. | La cuenta corriente es una herramienta fundamental para la gestión financiera diaria. |
| Depósito | Cantidad de dinero que se coloca en una cuenta bancaria. | Los depósitos son una forma de ahorro y pueden ser utilizados para obtener intereses. |
| Derivado | Instrumento financiero cuyo valor depende del valor de otro activo subyacente. | Los derivados son utilizados para gestionar el riesgo y especular. |
| Divisa | Moneda extranjera. | Las divisas son utilizadas para realizar operaciones de comercio internacional. |
| Emisión de acciones | Proceso por el cual una empresa ofrece acciones a los inversores para recaudar fondos. | La emisión de acciones es una forma de financiación para las empresas. |
| Fondos mutuos | Tipo de inversión colectiva que permite a los inversores diversificar su cartera. | Los fondos mutuos son gestionados por profesionales y ofrecen una forma de inversión diversificada. |
| Garantía | Bien o derecho que se ofrece como seguridad para un préstamo o una deuda. | Las garantías son utilizadas para reducir el riesgo de crédito. |
| Inflación | Aumento generalizado y sostenido de los precios de los bienes y servicios. | La inflación puede erosionar el valor del dinero y afectar la economía. |
| Interés | Pago que se realiza por el uso del dinero prestado. | Los intereses son una forma de rentabilidad para los prestamistas. |
| Inversión | Colocación de dinero en un activo con la esperanza de obtener una rentabilidad. | La inversión es fundamental para el crecimiento económico y la generación de riqueza. |
| Leasing | Contrato por el cual una parte (el arrendador) cede el uso de un bien a otra parte (el arrendatario) a cambio de una renta. | El leasing es similar al arrendamiento, pero suele ser utilizado para bienes de mayor valor. |
| Límite de crédito | Máximo monto de dinero que se puede pedir prestado. | Los límites de crédito son establecidos por los prestamistas para gestionar el riesgo de crédito. |
| Mercado de valores | Lugar donde se compran y venden valores mobiliarios. | Los mercados de valores son fundamentales para la intermediación financiera. |
| Moneda | Medio de pago y unidad de cuenta. | Las monedas son emitidas por los bancos centrales y son utilizadas para realizar transacciones. |
| Obligación | Deuda que se contrae con un prestamista. | Las obligaciones pueden ser a corto o largo plazo. |
| Pasivo | Deuda o obligación que debe ser pagada por una entidad. | Los pasivos son una parte fundamental del balance general. |
| Patrimonio | Conjunto de activos y pasivos que posee una entidad. | El patrimonio es una medida de la riqueza de una entidad. |
| Préstamo | Contrato por el cual una parte (el prestamista) cede dinero a otra parte (el prestatario) a cambio de intereses. | Los préstamos son una forma de financiación para las empresas y los individuos. |
| Rendimiento | Rentabilidad obtenida por un inversor. | El rendimiento puede ser en forma de intereses, dividendos o plusvalías. |
| Reserva | Parte del capital que se mantiene en una cuenta bancaria para cubrir gastos imprevistos. | Las reservas son fundamentales para la gestión financiera. |
| Riesgo | Probabilidad de que un evento adverso ocurra. | El riesgo es fundamental en el ámbito financiero y debe ser gestionado adecuadamente. |
| Saldo | Cantidad de dinero que se tiene en una cuenta bancaria. | El saldo es una medida de la liquidez de una entidad. |
| Tasa de interés | Porcentaje que se paga por el uso del dinero prestado. | Las tasas de interés son fundamentales para la economía y pueden afectar la inflación y el crecimiento económico. |
| Título de deuda | Instrumento financiero que representa una deuda. | Los títulos de deuda son emitidos por las empresas y los gobiernos para financiar sus actividades. |
| Valor actual | Valor presente de una cantidad de dinero que se recibirá en el futuro. | El valor actual es fundamental para evaluar la rentabilidad de una inversión. |
| Valor nominal | Valor facial de un título de deuda o una acción. | El valor nominal es el valor que se indica en el título o la acción. |
| Vencimiento | Fecha en la que se debe pagar una deuda o una obligación. | Los vencimientos son fundamentales para la gestión financiera y deben ser cumplidos para evitar problemas. |
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