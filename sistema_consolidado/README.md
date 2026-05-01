# 🚀 Reporte: SISTEMA CONSOLIDADO

## 🧠 Resumen del Programa
**OBJETIVO PRINCIPAL**: El objetivo principal de este programa COBOL es procesar transacciones bancarias, actualizando los saldos de las cuentas en una base de datos según los montos de las transacciones.

**FLUJO FUNCIONAL**: El proceso se divide en tres pasos clave:

1. **Lectura de transacciones**: El programa lee un archivo de texto que contiene las transacciones a procesar, con cada línea representando una transacción con un ID y un monto.
2. **Procesamiento de transacciones**: Para cada transacción, el programa consulta el saldo actual de la cuenta en la base de datos, aplica la lógica de negocio para validar y calcular el nuevo saldo, y actualiza el saldo en la base de datos si es necesario.
3. **Resumen y finalización**: Después de procesar todas las transacciones, el programa muestra un resumen de las transacciones procesadas, incluyendo el número total de transacciones, el número de transacciones procesadas con éxito y el número de transacciones con errores.

**SISTEMAS RELACIONADOS**: El programa utiliza dos archivos:

| Archivo | Detalle | Link |
| --- | --- | --- |
| BANCO.COB | Programa principal que procesa transacciones bancarias | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/BANCO.COB) |
| VAL-MOTOR.CBL | Subprograma que valida y calcula el nuevo saldo según las reglas de negocio | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/VAL-MOTOR.CBL) |

**VALOR DE NEGOCIO**: El programa ayuda a reducir el riesgo operativo al automatizar el procesamiento de transacciones bancarias, lo que puede minimizar errores humanos y mejorar la eficiencia. Sin embargo, si el programa no se ejecuta correctamente, puede generar errores en la base de datos, lo que podría tener un impacto significativo en la operación del banco. Por lo tanto, es fundamental probar y validar el programa exhaustivamente antes de su implementación en producción.

--- 

## 📖 1. Diccionario de Datos Bancarios
| **Variable COBOL** | **Concepto de Negocio** | **Formato** | **Definición** |
| --- | --- | --- | --- |
| TR-ID | Identificador de Transacción | Numérico (5 dígitos) | Identificador único de cada transacción bancaria. |
| TR-MONTO | Monto de la Transacción | Decimal (8 dígitos, 2 decimales) | Cantidad de dinero involucrada en la transacción. |
| DB-SALDO | Saldo Actual de la Cuenta | Decimal (10 dígitos, 2 decimales) | Saldo actual de la cuenta bancaria antes de procesar la transacción. |
| ID-BUSCAR | Identificador de Cuenta a Buscar | Numérico (5 dígitos) | Identificador de la cuenta bancaria a buscar en la base de datos. |
| WS-SALDO-ACTUAL | Saldo Actual de la Cuenta (área de intercambio) | Decimal (10 dígitos, 2 decimales) | Saldo actual de la cuenta bancaria antes de procesar la transacción (usado en la llamada al subprograma VAL-MOTOR). |
| WS-MONTO-TRANS | Monto de la Transacción (área de intercambio) | Decimal (8 dígitos, 2 decimales) | Cantidad de dinero involucrada en la transacción (usado en la llamada al subprograma VAL-MOTOR). |
| WS-NUEVO-SALDO | Nuevo Saldo de la Cuenta (área de intercambio) | Decimal (10 dígitos, 2 decimales) | Nuevo saldo de la cuenta bancaria después de procesar la transacción (usado en la llamada al subprograma VAL-MOTOR). |
| WS-RESULT-CODE | Código de Resultado (área de intercambio) | Alfanumérico (2 caracteres) | Código de resultado de la llamada al subprograma VAL-MOTOR (OK o ER). |
| WS-TOTAL-TRANS | Total de Transacciones Procesadas | Numérico (5 dígitos) | Número total de transacciones procesadas. |
| WS-TOTAL-EXITO | Total de Transacciones Procesadas con Éxito | Numérico (5 dígitos) | Número total de transacciones procesadas con éxito. |
| WS-TOTAL-ERROR | Total de Transacciones con Error | Numérico (5 dígitos) | Número total de transacciones con error. |
| WS-SUMA-MONTOS | Suma Total de Montos Procesados | Decimal (12 dígitos, 2 decimales) | Suma total de montos procesados. |

--- 

## 📋 2. Especificación de Lógica y Reglas
**REGLAS DE NEGOCIO**

1.  **Validación de Monto Positivo**: El monto de la transacción debe ser positivo.
2.  **No se permite sobregiro**: El saldo actual más el monto de la transacción no debe ser menor a cero.
3.  **Validación de Cuenta Existente**: La cuenta debe existir en la base de datos antes de realizar cualquier operación.
4.  **Actualización de Saldo**: El saldo de la cuenta se actualiza sumando el monto de la transacción.
5.  **Registro de Transacciones**: Se registra el total de transacciones leídas, procesadas con éxito y con errores.
6.  **Suma Total Procesada**: Se calcula la suma total de los montos procesados.

**MATRIZ DE DECISIONES Y FÓRMULAS**

| **Condición** | **Acción** | **Fórmula** |
| :------------ | :--------- | :---------- |
| Monto > 0     | Actualizar Saldo | DB-SALDO = DB-SALDO + TR-MONTO |
| Saldo Actual + Monto >= 0 | Permitir Transacción | LS-NUEVO-SALDO = LS-SALDO-ACTUAL + LS-MONTO-TRANS |
| Cuenta Existente | Realizar Operación | - |
| Error SQL     | Manejar Error | - |

**MAPEO DE PÁRRAFOS**

| **Párrafo** | **Regla de Negocio** |
| :---------- | :------------------- |
| 2200-GESTIONAR-MOTOR | Validación de Monto Positivo, No se permite sobregiro |
| 2200-ACTUALIZAR-CUENTA | Actualización de Saldo, Validación de Cuenta Existente |
| 2300-MANEJAR-ERROR-SQL | Registro de Transacciones, Suma Total Procesada |
| 100-VALIDAR-Y-CALCULAR | Validación de Monto Positivo, No se permite sobregiro |

--- 

## 🔄 3. Flujo del Proceso (BPMN)

```mermaid
%%{init: {'theme': 'base', 'themeVariables': { 'primaryColor': '#004481', 'primaryTextColor': '#fff', 'lineColor': '#043263'}}}%%
graph TD
A[Iniciar Procesamiento Bancario] --> B{Archivo de Transacciones Abierto?}
    B --> C[Leer Transacciones]
    B --> D[Error al Abrir Archivo]
    C --> E[Procesar Registro]
    E --> F{Monto Positivo?}
    F --> G[Actualizar Cuenta]
    F --> H[Aviso: Monto Invalido]
    G --> I{Actualizacion Exitosa?}
    I --> J[Commit y Resumen]
    I --> K[Error al Actualizar]
    J --> L[Finalizar Procesamiento]
    K --> L
    H --> L
    D --> L
    L --> M[Mostrar Resumen Final]
    M --> N[Salir del Programa]

    subgraph VAL-MOTOR
        O[Validar y Calcular] --> P{Monto Positivo?}
        P --> Q{No Sobregiro?}
        P --> R[Aviso: Monto Invalido]
        Q --> S[Calcular Nuevo Saldo]
        Q --> T[Aviso: Sobregiro]
        S --> U[Actualizar Resultado]
        T --> U
        R --> U
        U --> V[Salir del Subprograma]
    endsubgraph

    E --> O
    S --> G
    T --> H
    R --> H
```

--- 

## 📊 4. Matriz de Calidad y Madurez
| Funcionalidad | Fiabilidad (%) | Cobertura (%) | Calidad (%) | Notas Justificativas |
| --- | --- | --- | --- | --- |
| Procesamiento de transacciones | 80 | 70 | 60 | La funcionalidad principal del sistema es procesar transacciones, pero hay algunas áreas de mejora. La falta de manejo de errores en la lectura del archivo de transacciones y la conexión a la base de datos puede generar problemas. Además, la lógica de negocio es sencilla, pero no se han considerado escenarios de borde. |
| Validación y cálculo de saldo | 90 | 80 | 70 | El motor de reglas es robusto y bien implementado, pero no se han considerado escenarios de borde. La falta de pruebas unitarias para el motor de reglas puede generar problemas en el futuro. |
| Conexión a la base de datos | 70 | 60 | 50 | La conexión a la base de datos es básica y no se han considerado escenarios de borde. La falta de manejo de errores y la configuración de la conexión pueden generar problemas. |
| Configuración de Spring Boot | 80 | 70 | 60 | La configuración de Spring Boot es básica y no se han considerado escenarios de borde. La falta de pruebas unitarias para la configuración puede generar problemas en el futuro. |
| Ejecución del programa | 90 | 80 | 70 | La ejecución del programa es robusta y bien implementada, pero no se han considerado escenarios de borde. La falta de pruebas unitarias para la ejecución puede generar problemas en el futuro. |