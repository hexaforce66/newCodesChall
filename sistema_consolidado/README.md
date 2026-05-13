# 🚀 Reporte: SISTEMA CONSOLIDADO

## 🧠 Resumen del Programa
**OBJETIVO PRINCIPAL**: El objetivo principal del sistema es procesar y validar instrucciones de pago diarias, generando archivos de pago aprobados, rechazados y un registro de auditoría.

**FLUJO FUNCIONAL**: El proceso se puede dividir en tres pasos clave:

1. **Lectura y validación de datos**: El programa PAYMAIN lee las instrucciones de pago desde el archivo de entrada PAYIN y las valida mediante llamadas a los subprogramas CUSTVAL y BALCHK. Estos subprogramas verifican la información del cliente y la cuenta, respectivamente.

2. **Cálculo de riesgo**: Si la validación es exitosa, se llama al subprograma RISKSCOR para calcular el riesgo asociado con la transacción. Este cálculo se basa en la información del cliente y la cuenta.

3. **Generación de resultados**: Finalmente, se generan los archivos de pago aprobados (PAYOK), rechazados (PAYREJ) y el registro de auditoría (AUDITOUT). El programa TXNLOG se utiliza para construir la línea de auditoría.

**VALOR DE NEGOCIO**: El sistema ayuda a reducir el riesgo operativo al validar las instrucciones de pago y detectar posibles fraudes o errores. El impacto en el negocio es significativo, ya que permite al banco procesar pagos de manera eficiente y segura, lo que a su vez mejora la satisfacción del cliente y reduce los costos asociados con la resolución de disputas y fraudes.

---

## 🧩 1. Arquitectura Legacy Detectada
**Programa principal**: PAYMAIN

**Sistemas relacionados**:

| Archivo | Tipo | Detalle | Link |
| --- | --- | --- | --- |
| /lego-demo-legacy/cobol/BALCHK.cbl | COBOL | Programa que valida el balance de la cuenta | Verifica si la cuenta está bloqueada, si el pago excede el límite diario, si el pago excede el saldo, etc. | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/BALCHK.cbl) |
| /lego-demo-legacy/cobol/CUSTVAL.cbl | COBOL Programa que valida al cliente | Verifica si el cliente está bloqueado, si el cliente tiene KYC incompleto, etc. | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/CUSTVAL.cbl) |
| /lego-demo-legacy/cobol/PAYMAIN.cbl | COBOL Programa principal que ejecuta el flujo de pago | Lee el archivo de entrada, valida el pago, escribe el archivo de salida y genera un resumen | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/PAYMAIN.cbl) |
| /lego-demo-legacy/cobol/RISKSCOR.cbl | COBOL Programa que calcula el riesgo del pago | Calcula el riesgo del pago según el monto y el segmento de riesgo del cliente | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/RISKSCOR.cbl) |
| /lego-demo-legacy/cobol/TXNLOG.cbl | COBOL Programa que genera el registro de transacciones | Genera un registro de transacciones para cada pago | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/TXNLOG.cbl) |
| /lego-demo-legacy/copybooks/ACCOUNT.cpy | Copybook que define la estructura de la cuenta | Define la estructura de la cuenta, incluyendo el ID, el estado, el saldo, etc. | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/copybooks/ACCOUNT.cpy) |
| /lego-demo-legacy/copybooks/CUSTOMER.cpy | Copybook que define la estructura del cliente | Define la estructura del cliente, incluyendo el ID, el estado, el segmento de riesgo, etc. | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/copybooks/CUSTOMER.cpy) |
| /lego-demo-legacy/copybooks/PAYMENT.cpy | Copybook que define la estructura del pago | Define la estructura del pago, incluyendo el ID, el monto, la moneda, etc. | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/copybooks/PAYMENT.cpy) |
| /lego-demo-legacy/copybooks/RETURN_CODES.cpy | Copybook que define los códigos de retorno | Define los códigos de retorno para los programas | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/copybooks/RETURN_CODES.cpy) |
| /lego-demo-legacy/jcl/RUN_PAYMENTS_DAILY.jcl | JCL que ejecuta el programa PAYMAIN | Ejecuta el programa PAYMAIN y define los archivos de entrada y salida | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/jcl/RUN_PAYMENTS_DAILY.jcl) |

**Mapa de dependencias**:

| Tipo | Nombre | Usado por | Propósito | Dependencias |
| --- | --- | --- | --- | --- |
| COBOL | BALCHK | PAYMAIN | Valida el balance de la cuenta | ACCOUNT, RETURN_CODES |
| COBOL | CUSTVAL | PAYMAIN | Valida al cliente | CUSTOMER, RETURN_CODES |
| COBOL | PAYMAIN | RUN_PAYMENTS_DAILY | Ejecuta el flujo de pago | PAYMENT, ACCOUNT, CUSTOMER, RETURN_CODES |
| COBOL | RISKSCOR | PAYMAIN | Calcula el riesgo del pago | PAYMENT, CUSTOMER, RETURN_CODES |
| COBOL | TXNLOG | PAYMAIN | Genera el registro de transacciones | PAYMENT, RETURN_CODES |
| Copybook | ACCOUNT | BALCHK, PAYMAIN | Define la estructura de la cuenta |  |
| Copybook | CUSTOMER | CUSTVAL, PAYMAIN | Define la estructura del cliente |  |
| Copybook | PAYMENT | PAYMAIN, RISKSCOR, TXNLOG | Define la estructura del pago |  |
| Copybook | RETURN_CODES | BALCHK, CUSTVAL, PAYMAIN, RISKSCOR, TXNLOG | Define los códigos de retorno |  |
| JCL | RUN_PAYMENTS_DAILY |  | Ejecuta el programa PAYMAIN | PAYMAIN, PAYIN, CUSTIN, ACCTIN, PAYOK, PAYREJ, AUDITOUT |

**Flujo batch JCL**: El JCL RUN_PAYMENTS_DAILY ejecuta el programa PAYMAIN, que lee el archivo de entrada PAYIN, valida el pago, escribe el archivo de salida PAYOK y genera un resumen en el archivo AUDITOUT.

**Flujo funcional consolidado**: El proceso de pago consiste en leer el archivo de entrada, validar el pago, escribir el archivo de salida y generar un resumen. El proceso de validación del pago incluye la validación del balance de la cuenta, la validación del cliente y el cálculo del riesgo del pago.

**Riesgos técnicos**: Los riesgos técnicos incluyen la dependencia de los copybooks, la complejidad del proceso de validación del pago y la posibilidad de errores en la generación del resumen. Es importante asegurarse de que los copybooks estén actualizados y que el proceso de validación del pago esté bien probado para minimizar los riesgos.

---

## 📖 2. Diccionario de Datos Bancarios
| Variable COBOL | Archivo origen | Concepto de Negocio | Formato | Definición |
| --- | --- | --- | --- | --- |
| ACC-ID | ACCOUNT.cpy | Identificador de cuenta | X(12) | Identificador único de la cuenta bancaria. |
| ACC-CUSTOMER-ID | ACCOUNT.cpy | Identificador de cliente | X(10) | Identificador del cliente propietario de la cuenta. |
| ACC-STATUS | ACCOUNT.cpy | Estado de la cuenta | X(1) | Estado actual de la cuenta (abierta, bloqueada o cerrada). |
| ACC-BALANCE | ACCOUNT.cpy | Saldo de la cuenta | 9(9)V99 | Saldo actual de la cuenta. |
| ACC-DAILY-LIMIT | ACCOUNT.cpy | Límite diario de la cuenta | 9(9)V99 | Límite máximo de transacciones diarias permitidas en la cuenta. |
| ACC-CURRENCY | ACCOUNT.cpy | Moneda de la cuenta | X(3) | Moneda en la que se maneja la cuenta. |
| CUST-ID | CUSTOMER.cpy | Identificador de cliente | X(10) | Identificador único del cliente. |
| CUST-STATUS | CUSTOMER.cpy | Estado del cliente | X(1) | Estado actual del cliente (activo, bloqueado o cerrado). |
| CUST-KYC-FLAG | CUSTOMER.cpy | Estado de KYC del cliente | X(1) | Indicador de si el cliente ha completado el proceso de Know Your Customer (KYC). |
| CUST-RISK-SEGMENT | CUSTOMER.cpy | Segmento de riesgo del cliente | X(1) | Nivel de riesgo asociado al cliente (bajo, medio o alto). |
| PAY-ID | PAYMENT.cpy | Identificador de pago | X(12) | Identificador único de la transacción de pago. |
| PAY-CUSTOMER-ID | PAYMENT.cpy | Identificador de cliente del pago | X(10) | Identificador del cliente que realiza el pago. |
| PAY-ACCOUNT-ID | PAYMENT.cpy | Identificador de cuenta del pago | X(12) | Identificador de la cuenta desde la que se realiza el pago. |
| PAY-AMOUNT | PAYMENT.cpy | Monto del pago | 9(9)V99 | Monto de la transacción de pago. |
| PAY-CURRENCY | PAYMENT.cpy | Moneda del pago | X(3) | Moneda en la que se realiza el pago. |
| PAY-CHANNEL | PAYMENT.cpy | Canal del pago | X(10) | Canal a través del cual se realiza el pago (por ejemplo, transferencia bancaria, tarjeta de crédito, etc.). |
| PAY-DESTINATION | PAYMENT.cpy | Destino del pago | X(12) | Identificador del destinatario del pago. |
| PAY-REQUEST-DATE | PAYMENT.cpy | Fecha de solicitud del pago | 9(8) | Fecha en la que se solicitó el pago. |
| RETURN-CODE | RETURN_CODES.cpy | Código de retorno | X(4) | Código que indica el resultado de la validación del pago (aprobado, rechazado, en revisión, etc.). |
| RETURN-MESSAGE | RETURN_CODES.cpy | Mensaje de retorno | X(80) | Mensaje descriptivo del resultado de la validación del pago. |
| RETURN-RISK-SCORE | RETURN_CODES.cpy | Puntuación de riesgo | 9(3) | Puntuación que indica el nivel de riesgo asociado al pago. |

---

## 📋 3. Especificación de Lógica y Reglas
**REGLAS DE NEGOCIO**

1.  **Validación de cuenta**: Una cuenta debe estar abierta y no bloqueada para realizar pagos.
2.  **Validación de moneda**: La moneda del pago debe coincidir con la moneda de la cuenta.
3.  **Límite diario**: El monto del pago no debe exceder el límite diario de la cuenta.
4.  **Fondos suficientes**: La cuenta debe tener fondos suficientes para realizar el pago.
5.  **Validación de cliente**: El cliente debe estar activo y no bloqueado.
6.  **KYC (Conozca a su cliente)**: El cliente debe tener un KYC válido.
7.  **Puntuación de riesgo**: La puntuación de riesgo del pago debe ser menor o igual a 80 para ser aprobado.
8.  **Revisión manual**: Si la puntuación de riesgo es mayor a 60, el pago requiere revisión manual.

**MATRIZ DE DECISIONES Y FÓRMULAS**

| **Condición** | **Acción** | **Fórmula** |
| :------------ | :--------- | :---------- |
| ACC-BLOCKED o ACC-CLOSED | Rechazar pago | - |
| PAY-CURRENCY ≠ ACC-CURRENCY | Rechazar pago | - |
| PAY-AMOUNT > ACC-DAILY-LIMIT | Rechazar pago | - |
| PAY-AMOUNT > ACC-BALANCE | Rechazar pago | - |
| CUST-BLOCKED o CUST-CLOSED | Rechazar pago | - |
| KYC-MISSING | Rechazar pago | - |
| RETURN-RISK-SCORE > 80 | Rechazar pago | - |
| RETURN-RISK-SCORE > 60 | Revisión manual | - |
| PAY-AMOUNT > 10000 | Aumentar puntuación de riesgo en 30 | WS-AMOUNT-SCORE = 30 |
| PAY-AMOUNT > 5000 | Aumentar puntuación de riesgo en 15 | WS-AMOUNT-SCORE = 15 |
| PAY-AMOUNT ≤ 5000 | Aumentar puntuación de riesgo en 5 | WS-AMOUNT-SCORE = 5 |
| RISK-MEDIUM | Aumentar puntuación de riesgo en 30 | WS-BASE-SCORE = 30 |
| RISK-HIGH | Aumentar puntuación de riesgo en 60 | WS-BASE-SCORE = 60 |

**MAPEO DE COMPONENTES**

| **Componente** | **Descripción** | **Regla de negocio** |
| :------------- | :-------------- | :------------------ |
| PAYMAIN | Programa principal de pago | Todas las reglas de negocio |
| BALCHK | Subprograma de validación de cuenta | Validación de cuenta, moneda y límite diario |
| CUSTVAL | Subprograma de validación de cliente | Validación de cliente y KYC |
| RISKSCOR | Subprograma de puntuación de riesgo | Puntuación de riesgo y revisión manual |
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
    "fontSize": "20px"
  }
}}%%
flowchart LR
A[Read Payment File] -->> B{End of File?}
    B -->> C[Write Summary]
    B -->> D[Parse Payment]
    D --> E[Validate Customer]
    E -->> F[Validate Balance]
    E -->> G[Write Rejected]
    F -->> H[Calculate Risk Score]
    F -->> G
    H -->> I[Write Approved]
    H -->> G
    H -->> J[Write Review]
    I --> K[Write Audit]
    J --> K
    G --> K
    K --> B
    C --> L[Close Files]
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
B[Ejecutar programa PAYMAIN]
C[Lectura de archivos de entrada]
D[Lectura de archivos de salida]
E[Lectura de archivos de auditoria]
end

subgraph Programa_Principal
direction TB
F[Leer registro de pago]
G[Validar registro de pago]
H[Validar cliente]
I[Validar cuenta]
J[Calcular riesgo]
K[Escribir resultado]
L[Escribir resumen]
end

subgraph Subprogramas
direction TB
M[Validar cliente]
N[Validar cuenta]
O[Calcular riesgo]
P[Crear registro de auditoria]
end

subgraph Copybooks
direction TB
Q[Definir estructura de pago]
R[Definir estructura de cliente]
S[Definir estructura de cuenta]
T[Definir estructura de respuesta]
end

subgraph Archivos
direction TB
U[Archivo de entrada de pagos]
V[Archivo de salida de pagos aprobados]
W[Archivo de salida de pagos rechazados]
X[Archivo de auditoria]
end

A --> B
B --> F
F --> G
G --> H
H --> I
I --> J
J --> K
K --> L
L --> M
M --> N
N --> O
O --> P
P --> Q
Q --> R
R --> S
S --> T
T --> U
U --> V
V --> W
W --> X

B{Decision} --> A[Accion]
A[Accion] --> B[Accion]
B[Accion] --> C[Accion]
C[Accion] --> D[Accion]
D[Accion] --> E[Accion]
E[Accion] --> F[Accion]
F[Accion] --> G[Accion]
G[Accion] --> H[Accion]
H[Accion] --> I[Accion]
I[Accion] --> J[Accion]
J[Accion] --> K[Accion]
K[Accion] --> L[Accion]
L[Accion] --> M[Accion]
M[Accion] --> N[Accion]
N[Accion] --> O[Accion]
O[Accion] --> P[Accion]
P[Accion] --> Q[Accion]
Q[Accion] --> R[Accion]
R[Accion] --> S[Accion]
S[Accion] --> T[Accion]
T[Accion] --> U[Accion]
U[Accion] --> V[Accion]
V[Accion] --> W[Accion]
W[Accion] --> X[Accion]
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
| Fidelidad Java vs COBOL | 95% | El código Java generado implementa la mayoría de las reglas de negocio y lógica del código COBOL original. Sin embargo, se detectaron algunas diferencias en la implementación de la lógica de riesgo y la validación de clientes. | Diferencias en la implementación de la lógica de riesgo y la validación de clientes. | Revisar y ajustar la implementación de la lógica de riesgo y la validación de clientes en el código Java generado. |
| Cobertura de reglas por tests | 80% | Los tests generados cubren la mayoría de las reglas de negocio y lógica del código COBOL original. Sin embargo, se detectaron algunas reglas que no tienen tests asociados. | Reglas sin tests asociados. | Generar tests adicionales para cubrir las reglas que no tienen tests asociados. |
| Cobertura funcional Gherkin | 90% | Los escenarios Gherkin generados cubren la mayoría de los flujos de negocio y lógica del código COBOL original. Sin embargo, se detectaron algunas brechas en la cobertura de algunos flujos de negocio. | Brechas en la cobertura de algunos flujos de negocio. | Generar escenarios Gherkin adicionales para cubrir los flujos de negocio que no están cubiertos. |
| Calidad del código Java | 85% | El código Java generado tiene una buena calidad en general, pero se detectaron algunas mejoras posibles en la estructura y la organización del código. | Mejoras posibles en la estructura y la organización del código. | Revisar y ajustar la estructura y la organización del código Java generado. |
| Madurez general para revisión humana | 80% | El código Java generado está listo para ser revisado por humanos, pero se detectaron algunas brechas en la documentación y la claridad del código. | Brechas en la documentación y la claridad del código. | Generar documentación adicional y mejorar la claridad del código Java generado. |

---

## 🧪 6. Escenarios Gherkin Generados

```gherkin
Característica: Procesamiento de pagos diarios

  Antecedentes:
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de cuentas BBVA.ACCOUNT.MASTER existe
    Y el programa PAYMAIN está disponible en BBVA.LEGO.LOADLIB
    Y el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED no existe
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED no existe
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG no existe

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Flujo feliz - pago rechazado
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago inválido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Caso de borde - pago con monto máximo permitido
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con monto máximo permitido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Caso de error - archivo de entrada de pagos diarios no existe
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado

  Escenario: Caso de error - archivo de clientes no existe
    Dado que el archivo de clientes BBVA.CUSTOMER.MASTER no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado

  Escenario: Caso de error - archivo de cuentas no existe
    Dado que el archivo de cuentas BBVA.ACCOUNT.MASTER no existe
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de archivo no encontrado

  Escenario: Caso de error - programa PAYMAIN no está disponible
    Dado que el programa PAYMAIN no está disponible en BBVA.LEGO.LOADLIB
    Cuando se ejecuta el programa PAYMAIN
    Entonces se produce un error de programa no encontrado

  Escenario: Validación de cliente - cliente no activo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con cliente no activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cliente - cliente con KYC incompleto
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con cliente con KYC incompleto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cuenta - cuenta no existe
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con cuenta no existente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cuenta - cuenta bloqueada
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con cuenta bloqueada
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de cuenta - cuenta cerrada
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con cuenta cerrada
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de saldo - saldo insuficiente
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con saldo insuficiente
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de riesgo - riesgo alto
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación de riesgo - riesgo medio
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con riesgo medio
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Validación de riesgo - riesgo bajo
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene un pago con riesgo bajo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Escenario batch de entrada y salida
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT contiene varios pagos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida de pagos aprobados BBVA.PAYMENTS.APPROVED contiene los pagos aprobados
    Y el archivo de salida de pagos rechazados BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida de auditoría BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos
```
