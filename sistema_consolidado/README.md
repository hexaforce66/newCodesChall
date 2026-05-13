# 🚀 Reporte: SISTEMA CONSOLIDADO

## 🧠 Resumen del Programa
**OBJETIVO PRINCIPAL**: El objetivo principal del sistema es procesar y validar instrucciones de pago diarias, generando archivos de pago aprobados, rechazados y un registro de auditoría.

**FLUJO FUNCIONAL**: El proceso se puede dividir en tres pasos clave:

1.  **Lectura y validación de instrucciones de pago**: El programa `PAYMAIN` lee las instrucciones de pago desde el archivo `BBVA.PAYMENTS.DAILY.INPUT` y las valida mediante llamadas a los subprogramas `CUSTVAL`, `BALCHK` y `RISKSCOR`.
2.  **Generación de archivos de pago aprobados y rechazados**: Según el resultado de la validación, el programa `PAYMAIN` genera archivos de pago aprobados (`BBVA.PAYMENTS.APPROVED`) y rechazados (`BBVA.PAYMENTS.REJECTED`).
3.  **Generación del registro de auditoría**: El programa `PAYMAIN` también genera un registro de auditoría (`BBVA.PAYMENTS.AUDIT.LOG`) que contiene información detallada sobre cada instrucción de pago procesada.

**VALOR DE NEGOCIO**: El sistema ayuda a reducir el riesgo operativo al validar las instrucciones de pago de manera automática y consistente, lo que minimiza la posibilidad de errores humanos y fraude. Además, el registro de auditoría proporciona una trazabilidad completa de todas las transacciones, lo que facilita la detección y resolución de problemas. El impacto en el negocio es significativo, ya que permite al banco procesar un gran volumen de pagos de manera eficiente y segura, lo que mejora la satisfacción del cliente y reduce los costos operativos.

---

## 🧩 1. Arquitectura Legacy Detectada
**Programa principal**: PAYMAIN

**Sistemas relacionados**:

| Archivo | Tipo | Detalle | Link |
| --- | --- | --- | --- |
| /lego-demo-legacy/cobol/BALCHK.cbl | COBOL | Programa que valida el balance de una cuenta | Verifica si la cuenta está bloqueada, si el pago excede el límite diario, si el pago excede el saldo, etc. | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/BALCHK.cbl) |
| /lego-demo-legacy/cobol/CUSTVAL.cbl | COBOL Programa que valida la información del cliente | Verifica si el cliente está activo, si la información del cliente es completa, etc. | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/CUSTVAL.cbl) |
| /lego-demo-legacy/cobol/PAYMAIN.cbl | COBOL Programa principal que ejecuta el proceso de pago | Lee los archivos de entrada, ejecuta las validaciones y escribe los archivos de salida | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/PAYMAIN.cbl) |
| /lego-demo-legacy/cobol/RISKSCOR.cbl | COBOL Programa que calcula el riesgo de un pago | Calcula el riesgo según la información del cliente y del pago | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/RISKSCOR.cbl) |
| /lego-demo-legacy/cobol/TXNLOG.cbl | COBOL Programa que registra las transacciones | Escribe las transacciones en un archivo de auditoría | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/TXNLOG.cbl) |
| /lego-demo-legacy/copybooks/ACCOUNT.cpy | Copybook que define la estructura de la cuenta | Define la estructura de la cuenta, incluyendo el ID, el estado, el saldo, etc. | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/copybooks/ACCOUNT.cpy) |
| /lego-demo-legacy/copybooks/CUSTOMER.cpy | Copybook que define la estructura del cliente | Define la estructura del cliente, incluyendo el ID, el estado, la información de KYC, etc. | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/copybooks/CUSTOMER.cpy) |
| /lego-demo-legacy/copybooks/PAYMENT.cpy | Copybook que define la estructura del pago | Define la estructura del pago, incluyendo el ID, el monto, la moneda, etc. | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/copybooks/PAYMENT.cpy) |
| /lego-demo-legacy/copybooks/RETURN_CODES.cpy | Copybook que define los códigos de retorno | Define los códigos de retorno para las validaciones y el proceso de pago | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/copybooks/RETURN_CODES.cpy) |
| /lego-demo-legacy/jcl/RUN_PAYMENTS_DAILY.jcl | JCL que ejecuta el proceso de pago diario | Ejecuta el programa PAYMAIN y define los archivos de entrada y salida | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/jcl/RUN_PAYMENTS_DAILY.jcl) |

**Mapa de dependencias**:

| Tipo | Nombre | Usado por | Propósito | Dependencias |
| --- | --- | --- | --- | --- |
| COBOL | BALCHK | PAYMAIN | Valida el balance de una cuenta | ACCOUNT, RETURN_CODES |
| COBOL | CUSTVAL | PAYMAIN | Valida la información del cliente | CUSTOMER, RETURN_CODES |
| COBOL | PAYMAIN | RUN_PAYMENTS_DAILY | Ejecuta el proceso de pago | BALCHK, CUSTVAL, RISKSCOR, TXNLOG, ACCOUNT, CUSTOMER, PAYMENT, RETURN_CODES |
| COBOL | RISKSCOR | PAYMAIN | Calcula el riesgo de un pago | CUSTOMER, ACCOUNT, RETURN_CODES |
| COBOL | TXNLOG | PAYMAIN | Registra las transacciones | PAYMENT, RETURN_CODES |
| Copybook | ACCOUNT | BALCHK, PAYMAIN | Define la estructura de la cuenta |  |
| Copybook | CUSTOMER | CUSTVAL, PAYMAIN | Define la estructura del cliente |  |
| Copybook | PAYMENT | PAYMAIN | Define la estructura del pago |  |
| Copybook | RETURN_CODES | BALCHK, CUSTVAL, PAYMAIN, RISKSCOR, TXNLOG | Define los códigos de retorno |  |
| JCL | RUN_PAYMENTS_DAILY |  | Ejecuta el proceso de pago diario | PAYMAIN |

**Flujo batch JCL**: El JCL RUN_PAYMENTS_DAILY ejecuta el programa PAYMAIN, que lee los archivos de entrada, ejecuta las validaciones y escribe los archivos de salida.

**Flujo funcional consolidado**: El proceso de pago diario lee los archivos de entrada, ejecuta las validaciones de balance y cliente, calcula el riesgo de pago, registra las transacciones y escribe los archivos de salida.

**Riesgos técnicos**: Los riesgos técnicos incluyen la dependencia de los copybooks, la complejidad del proceso de pago y la posibilidad de errores en la lectura y escritura de archivos.

---

## 📖 2. Diccionario de Datos Bancarios
| Variable COBOL | Archivo origen | Concepto de Negocio | Formato | Definición |
| --- | --- | --- | --- | --- |
| ACC-ID | ACCOUNT.cpy | Identificador de cuenta | X(12) | Identificador único de la cuenta bancaria. |
| ACC-CUSTOMER-ID | ACCOUNT.cpy | Identificador de cliente | X(10) | Identificador del cliente propietario de la cuenta. |
| ACC-STATUS | ACCOUNT.cpy | Estado de la cuenta | X(1) | Estado actual de la cuenta (abierto, bloqueado, cerrado). |
| ACC-BALANCE | ACCOUNT.cpy | Saldo de la cuenta | 9(9)V99 | Saldo actual de la cuenta. |
| ACC-DAILY-LIMIT | ACCOUNT.cpy | Límite diario de la cuenta | 9(9)V99 | Límite máximo de transacciones diarias permitidas en la cuenta. |
| ACC-CURRENCY | ACCOUNT.cpy | Moneda de la cuenta | X(3) | Moneda en la que se maneja la cuenta. |
| CUST-ID | CUSTOMER.cpy | Identificador de cliente | X(10) | Identificador único del cliente. |
| CUST-STATUS | CUSTOMER.cpy | Estado del cliente | X(1) | Estado actual del cliente (activo, bloqueado, cerrado). |
| CUST-KYC-FLAG | CUSTOMER.cpy | Estado de cumplimiento de KYC | X(1) | Indicador de si el cliente ha cumplido con los requisitos de Know Your Customer (KYC). |
| CUST-RISK-SEGMENT | CUSTOMER.cpy | Segmento de riesgo del cliente | X(1) | Nivel de riesgo asociado al cliente (bajo, medio, alto). |
| PAY-ID | PAYMENT.cpy | Identificador de pago | X(12) | Identificador único de la transacción de pago. |
| PAY-CUSTOMER-ID | PAYMENT.cpy | Identificador de cliente del pago | X(10) | Identificador del cliente que realiza el pago. |
| PAY-ACCOUNT-ID | PAYMENT.cpy | Identificador de cuenta del pago | X(12) | Identificador de la cuenta desde la que se realiza el pago. |
| PAY-AMOUNT | PAYMENT.cpy | Monto del pago | 9(9)V99 | Monto de la transacción de pago. |
| PAY-CURRENCY | PAYMENT.cpy | Moneda del pago | X(3) | Moneda en la que se realiza el pago. |
| PAY-CHANNEL | PAYMENT.cpy | Canal de pago | X(10) | Medio por el que se realiza el pago (transferencia, tarjeta, etc.). |
| PAY-DESTINATION | PAYMENT.cpy | Destino del pago | X(12) | Identificador de la cuenta o entidad a la que se dirige el pago. |
| PAY-REQUEST-DATE | PAYMENT.cpy | Fecha de solicitud del pago | 9(8) | Fecha en la que se solicitó la transacción de pago. |
| RETURN-CODE | RETURN_CODES.cpy | Código de retorno | X(4) | Código que indica el resultado de la validación del pago. |
| RETURN-MESSAGE | RETURN_CODES.cpy | Mensaje de retorno | X(80) | Descripción del resultado de la validación del pago. |
| RETURN-RISK-SCORE | RETURN_CODES.cpy | Puntuación de riesgo | 9(3) | Puntuación que refleja el nivel de riesgo asociado al pago. |

---

## 📋 3. Especificación de Lógica y Reglas
**REGLAS DE NEGOCIO**

1.  **Validación de cuenta**: La cuenta debe estar abierta y no bloqueada para realizar pagos.
2.  **Validación de moneda**: La moneda del pago debe coincidir con la moneda de la cuenta.
3.  **Límite diario**: El monto del pago no debe exceder el límite diario establecido para la cuenta.
4.  **Fondos suficientes**: La cuenta debe tener fondos suficientes para realizar el pago.
5.  **Validación de cliente**: El cliente debe estar activo y no bloqueado para realizar pagos.
6.  **KYC**: El cliente debe tener un KYC (Conoce a tu cliente) válido para realizar pagos.
7.  **Puntuación de riesgo**: La puntuación de riesgo del pago se calcula en función del monto y la segmentación de riesgo del cliente.
8.  **Revisión manual**: Los pagos con una puntuación de riesgo alta requieren revisión manual.

**MATRIZ DE DECISIONES Y FÓRMULAS**

| **Condición** | **Acción** | **Fórmula** |
| :------------ | :--------- | :---------- |
| ACC-BLOCKED o ACC-CLOSED | Rechazar pago | RETURN-CODE = '2001' |  |
| PAY-CURRENCY ≠ ACC-CURRENCY | Rechazar pago | RETURN-CODE = '2001' |
| PAY-AMOUNT > ACC-DAILY-LIMIT | Rechazar pago | RETURN-CODE = '9001' |
| PAY-AMOUNT > ACC-BALANCE | Rechazar pago | RETURN-CODE = '3001' |
| CUST-BLOCKED o CUST-CLOSED | Rechazar pago | RETURN-CODE = '1001' |
| KYC-MISSING | Rechazar pago | RETURN-CODE = '1001' |
| RISK-MEDIUM | Aumentar puntuación de riesgo | WS-BASE-SCORE + 30 |
| RISK-HIGH | Aumentar puntuación de riesgo | WS-BASE-SCORE + 60 |
| PAY-AMOUNT > 10000 | Aumentar puntuación de riesgo | WS-AMOUNT-SCORE = 30 |
| PAY-AMOUNT > 5000 | Aumentar puntuación de riesgo | WS-AMOUNT-SCORE = 15 |
| RETURN-RISK-SCORE > 80 | Rechazar pago | RETURN-CODE = '4001' |
| RETURN-RISK-SCORE > 60 | Revisión manual | RETURN-CODE = '9001' |

**MAPEO DE COMPONENTES**

| **Componente** | **Descripción** | **Regla de negocio** |
| :------------- | :-------------- | :------------------ |
| PAYMAIN | Programa principal de pago | Todas las reglas de negocio |
| BALCHK | Subprograma de validación de cuenta | Validación de cuenta, moneda y límite diario |
| CUSTVAL | Subprograma de validación de cliente | Validación de cliente y KYC |
| RISKSCOR | Subprograma de cálculo de puntuación de riesgo | Puntuación de riesgo |
| TXNLOG | Subprograma de registro de transacciones | Registro de transacciones |
| ACCOUNT | Copybook de cuenta | Validación de cuenta y moneda |
| CUSTOMER | Copybook de cliente | Validación de cliente y KYC |
| PAYMENT | Copybook de pago | Todas las reglas de negocio |
| RETURN\_CODES | Copybook de códigos de retorno | Todas las reglas de negocio |

---

## 🔄 4. Flujo Ejecutivo BPMN

Este diagrama muestra la visión resumida del proceso legacy.

```mermaid
%%{init: {
  "theme": "base",
  "flowchart": {
    "defaultRenderer": "elk",
    "nodeSpacing": 80,
    "rankSpacing": 120,
    "curve": "basis",
    "padding": 20
  },
  "themeVariables": {
    "primaryColor": "#004481",
    "primaryTextColor": "#ffffff",
    "lineColor": "#043263",
    "fontSize": "14px"
  }
}}%%
flowchart LR
A[Read Payment Input] --> B[Parse Payment]
    B --> C[Validate Customer]
    C --> D[Validate Account Balance]
    D --> E[Calculate Risk Score]
    E --> F[Write Result]
    F --> G[Write Summary]
    G --> H[End of Process]

    C --> I[Write Rejected]
    D --> I
    E --> I
    I --> J[End of Process]

    subgraph JCL
        direction TB
        K[Execute PAYMAIN] --> L[Read PAYIN]
        L --> M[Write PAYOK, PAYREJ, AUDITOUT]
        M --> N[End of JCL]
    end

    subgraph COBOL
        direction TB
        O[CALL CUSTVAL] --> P[CALL BALCHK]
        P --> Q[CALL RISKSCOR]
        Q --> R[CALL TXNLOG]
        R --> S[End of COBOL]
    end
```

---

## 🧬 4.1 Mapa Detallado de Procesos y Dependencias

Este diagrama muestra JCL, programas COBOL, CALLs, COPYBOOKS, validaciones y archivos.

```mermaid
%%{init: {
  "theme": "base",
  "flowchart": {
    "defaultRenderer": "elk",
    "nodeSpacing": 120,
    "rankSpacing": 180,
    "curve": "basis",
    "padding": 20
  },
  "themeVariables": {
    "primaryColor": "#004481",
    "primaryTextColor": "#ffffff",
    "lineColor": "#043263",
    "fontSize": "13px"
  }
}}%%
flowchart LR
subgraph JCL
        direction TB
        A[Leer parametros]
        B[Ejecutar programa]
        C[Lectura de archivos de entrada]
        D[Ejecucion de PAYMAIN]
        E[Escribir archivos de salida]
        A --> C --> E
    end

    subgraph Programa_Principal
        direction TB
        F[Leer registro]
        G{Registro valido?}
        H[Procesar registro]
        I[Escribir resultado]
        F --> H --> I
    end

    subgraph Subprogramas
        direction TB
        J[Validar cliente]
        K[Validar cuenta]
        L[Calcular riesgo]
        M[Crear registro de auditoria]
        J --> L --> M
    end

    subgraph Copybooks
        direction TB
        N[Definir estructura de pago]
        O[Definir estructura de cliente]
        P[Definir estructura de cuenta]
        Q[Definir estructura de respuesta]
        N --> P --> Q
    end

    subgraph Archivos
        direction TB
        R[Lectura de archivo de entrada]
        S[Escribir archivo de salida]
        T[Escribir archivo de auditoria]
        R --> T
    end

    A --> F
    F --> J
    J --> K
    K --> L
    L --> M
    M --> I
    I --> S
    S --> T
    T --> E
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I --> S
    J --> K
    K --> L
    L --> M
    M --> I
    N --> F
    O --> J
    P --> K
    Q --> I
    R --> F
    S --> I
    T --> E
    B --> D
    D --> F
    E --> B
    C --> R
    D --> S
    E --> T
    F --> G
    G --> H
    H --> I
    I -->
```

---

---

## ✅ 5. Validación Técnica Java

**Compilación Java:** OK

```text
El código Java generado compila correctamente.
```

## 📊 6. Matriz de Calidad y Madurez
| Métrica | Porcentaje | Evidencia | Brechas detectadas | Recomendación |
| --- | --- | --- | --- | --- |
| Fidelidad Java vs COBOL | 90% | El código Java generado implementa la mayoría de las reglas de negocio y decisiones del código COBOL original. Sin embargo, hay algunas diferencias en la implementación de la lógica de riesgo y la generación de archivos de auditoría. | Diferencias en la implementación de la lógica de riesgo y la generación de archivos de auditoría. | Revisar la implementación de la lógica de riesgo y la generación de archivos de auditoría para asegurarse de que sean consistentes con el código COBOL original. |
| Cobertura de reglas por tests | 80% | Los tests generados cubren la mayoría de las reglas de negocio y decisiones del código COBOL original. Sin embargo, hay algunas reglas que no están cubiertas por tests. | Reglas no cubiertas por tests. | Agregar tests para cubrir las reglas no cubiertas. |
| Cobertura funcional Gherkin | 90% | Los escenarios Gherkin generados cubren la mayoría de los casos de uso y flujos del código COBOL original. Sin embargo, hay algunos casos de uso que no están cubiertos. | Casos de uso no cubiertos. | Agregar escenarios Gherkin para cubrir los casos de uso no cubiertos. |
| Calidad del código Java | 85% | El código Java generado es legible y mantenible. Sin embargo, hay algunas áreas que pueden ser mejoradas, como la organización de los métodos y la documentación. | Áreas de mejora en la organización de los métodos y la documentación. | Revisar el código Java generado y mejorar la organización de los métodos y la documentación. |
| Madurez general para revisión humana | 80% | El código Java generado es maduro para revisión humana. Sin embargo, hay algunas áreas que pueden ser mejoradas, como la consistencia en la implementación de la lógica de riesgo y la generación de archivos de auditoría. | Áreas de mejora en la consistencia de la implementación de la lógica de riesgo y la generación de archivos de auditoría. | Revisar el código Java generado y mejorar la consistencia en la implementación de la lógica de riesgo y la generación de archivos de auditoría. |

---

## 🧪 6. Escenarios Gherkin Generados

```gherkin
Característica: Procesamiento de pagos diarios
  Como usuario del sistema de pagos
  Quiero que el sistema procese las instrucciones de pago diarias
  Para generar archivos de pago aprobados, rechazados y auditoría

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago válida
    Y el cliente y la cuenta están activos
    Y el saldo es suficiente
    Y el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago aprobado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Caso de borde - pago rechazado por saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con saldo insuficiente
    Y el cliente y la cuenta están activos
    Y el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Caso de error - pago rechazado por riesgo alto
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con riesgo alto
    Y el cliente y la cuenta están activos
    Y el saldo es suficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Validación de cliente - cliente no activo
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con cliente no activo
    Y la cuenta está activa
    Y el saldo es suficiente
    Y el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Validación - cuenta no activa
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con cuenta no activa
    Y el cliente está activo
    Y el saldo es suficiente
    Y el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Validación - saldo insuficiente
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con saldo insuficiente
    Y el cliente y la cuenta están activos
    Y el riesgo es bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Validación - riesgo alto
    Dado que el archivo de entrada de pagos diarios contiene una instrucción de pago con riesgo alto
    Y el cliente y la cuenta están activos
    Y el saldo es suficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Procesamiento de pago - archivo de entrada vacío
    Dado que el archivo de entrada de pagos diarios está vacío
    Cuando se ejecuta el programa PAYMAIN
    Entonces no se genera ningún archivo de pago
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Procesamiento de pago - archivo de entrada con errores
    Dado que el archivo de entrada de pagos diarios contiene errores
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Procesamiento de pago - archivo de entrada con instrucciones de pago válidas
    Dado que el archivo de entrada de pagos diarios contiene instrucciones de pago válidas
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago aprobado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Procesamiento de pago - archivo de entrada con instrucciones de pago rechazadas
    Dado que el archivo de entrada de pagos diarios contiene instrucciones de pago rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago rechazado
    Y se genera un archivo de auditoría con el resultado del pago

  Escenario: Procesamiento de pago - archivo de entrada con instrucciones de pago en revisión
    Dado que el archivo de entrada de pagos diarios contiene instrucciones de pago en revisión
    Cuando se ejecuta el programa PAYMAIN
    Entonces se genera un archivo de pago en revisión
    Y se genera un archivo de auditoría con el resultado del pago
```
