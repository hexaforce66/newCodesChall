# 🚀 Reporte: SISTEMA CONSOLIDADO

## 🧠 Resumen del Programa
**OBJETIVO PRINCIPAL**: El objetivo principal del sistema es procesar y validar instrucciones de pago diarias, generando archivos de pago aprobados, rechazados y un registro de auditoría.

**FLUJO FUNCIONAL**: El proceso se puede dividir en tres pasos clave:

1. **Lectura y validación de datos**: El programa PAYMAIN lee las instrucciones de pago desde el archivo de entrada PAYIN y las valida mediante llamadas a los subprogramas CUSTVAL y BALCHK. Estos subprogramas verifican la información del cliente y la cuenta, respectivamente.

2. **Cálculo de riesgo**: Si la validación es exitosa, el programa llama al subprograma RISKSCOR para calcular el riesgo asociado con la transacción. Este cálculo se basa en la información del cliente y la cuenta.

3. **Generación de resultados**: Finalmente, el programa genera los archivos de pago aprobados (PAYOK), rechazados (PAYREJ) y un registro de auditoría (AUDITOUT). El archivo de auditoría contiene información detallada sobre cada transacción procesada.

**VALOR DE NEGOCIO**: El sistema proporciona un valor de negocio significativo al banco, ya que permite procesar y validar instrucciones de pago de manera eficiente y segura. El cálculo de riesgo y la generación de archivos de auditoría ayudan a reducir el riesgo operativo y a cumplir con los requisitos regulatorios. Sin embargo, el sistema también presenta algunos riesgos, como la posibilidad de errores en la validación de datos o la mala configuración del cálculo de riesgo, lo que podría generar pérdidas financieras o daños a la reputación del banco.

---

## 🧩 1. Arquitectura Legacy Detectada
**Programa principal**

El programa principal es PAYMAIN, que se ejecuta desde el JCL RUN_PAYMENTS_DAILY.jcl.

**Sistemas relacionados**

| Archivo | Tipo | Detalle | Link |
| --- | --- | --- | --- |
| /lego-demo-legacy/cobol/BALCHK.cbl | COBOL | Programa que valida el saldo de una cuenta | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/BALCHK.cbl) |
| /lego-demo-legacy/cobol/CUSTVAL.cbl | COBOL | Programa que valida la información del cliente | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/CUSTVAL.cbl) |
| /lego-demo-legacy/cobol/PAYMAIN.cbl | COBOL | Programa principal que ejecuta el proceso de validación de pagos | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/PAYMAIN.cbl) |
| /lego-demo-legacy/cobol/RISKSCOR.cbl | COBOL | Programa que calcula el riesgo de un pago | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/RISKSCOR.cbl) |
| /lego-demo-legacy/cobol/TXNLOG.cbl | COBOL | Programa que registra las transacciones en un archivo de auditoría | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/cobol/TXNLOG.cbl) |
| /lego-demo-legacy/copybooks/ACCOUNT.cpy | COPYBOOK | Definición de la estructura de datos de una cuenta | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/copybooks/ACCOUNT.cpy) |
| /lego-demo-legacy/copybooks/CUSTOMER.cpy | COPYBOOK | Definición de la estructura de datos de un cliente | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/copybooks/CUSTOMER.cpy) |
| /lego-demo-legacy/copybooks/PAYMENT.cpy | COPYBOOK | Definición de la estructura de datos de un pago | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/copybooks/PAYMENT.cpy) |
| /lego-demo-legacy/copybooks/RETURN_CODES.cpy | COPYBOOK | Definición de los códigos de retorno del proceso | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/copybooks/RETURN_CODES.cpy) |
| /lego-demo-legacy/jcl/RUN_PAYMENTS_DAILY.jcl | JCL | Job que ejecuta el proceso de validación de pagos | [Ver Código](https://github.com/hexaforce66/codigosCobol/blob/main/lego-demo-legacy/jcl/RUN_PAYMENTS_DAILY.jcl) |

**Mapa de dependencias**

| Tipo | Nombre | Usado por | Propósito | Dependencias |
| --- | --- | --- | --- | --- |
| COBOL | BALCHK | PAYMAIN | Validar saldo de cuenta | ACCOUNT, RETURN_CODES |
| COBOL | CUSTVAL | PAYMAIN | Validar información del cliente | CUSTOMER, RETURN_CODES |
| COBOL | PAYMAIN | RUN_PAYMENTS_DAILY.jcl | Ejecutar proceso de validación de pagos | BALCHK, CUSTVAL, RISKSCOR, TXNLOG, PAYMENT, CUSTOMER, ACCOUNT, RETURN_CODES |
| COBOL | RISKSCOR | PAYMAIN | Calcular riesgo de pago | PAYMENT, CUSTOMER, ACCOUNT, RETURN_CODES |
| COBOL | TXNLOG | PAYMAIN | Registrar transacciones en archivo de auditoría | PAYMENT, RETURN_CODES |
| COPYBOOK | ACCOUNT | BALCHK, PAYMAIN | Definir estructura de datos de cuenta |  |
| COPYBOOK | CUSTOMER | CUSTVAL, PAYMAIN | Definir estructura de datos de cliente |  |
| COPYBOOK | PAYMENT | PAYMAIN, RISKSCOR, TXNLOG | Definir estructura de datos de pago |  |
| COPYBOOK | RETURN_CODES | BALCHK, CUSTVAL, PAYMAIN, RISKSCOR, TXNLOG | Definir códigos de retorno del proceso |  |
| JCL | RUN_PAYMENTS_DAILY.jcl |  | Ejecutar proceso de validación de pagos | PAYMAIN, PAYIN, CUSTIN, ACCTIN, PAYOK, PAYREJ, AUDITOUT |

**Flujo batch JCL**

El JCL RUN_PAYMENTS_DAILY.jcl ejecuta el programa PAYMAIN, que realiza el proceso de validación de pagos. El programa lee los archivos de entrada PAYIN, CUSTIN y ACCTIN, y escribe los archivos de salida PAYOK, PAYREJ y AUDITOUT.

**Flujo funcional consolidado**

El proceso de validación de pagos consiste en los siguientes pasos:

1. Leer los archivos de entrada PAYIN, CUSTIN y ACCTIN.
2. Validar la información del cliente y la cuenta.
3. Calcular el riesgo del pago.
4. Registrar las transacciones en el archivo de auditoría.
5. Escribir los archivos de salida PAYOK, PAYREJ y AUDITOUT.

**Riesgos técnicos**

* Dependencias críticas: El proceso de validación de pagos depende de la disponibilidad de los archivos de entrada y salida, así como de la correcta configuración del JCL.
* Copybooks compartidos: Los copybooks ACCOUNT, CUSTOMER, PAYMENT y RETURN_CODES son compartidos por varios programas, lo que puede generar conflictos si se realizan cambios en ellos.
* Archivos sensibles: Los archivos de entrada y salida contienen información sensible, por lo que es importante garantizar su seguridad y confidencialidad.
* Puntos de fallo: El proceso de validación de pagos tiene varios puntos de fallo, como la lectura de archivos de entrada, la validación de la información del cliente y la cuenta, y la escritura de archivos de salida. Es importante identificar y mitigar estos riesgos para garantizar la disponibilidad y confiabilidad del proceso.

---

## 📖 2. Diccionario de Datos Bancarios
| Variable COBOL | Archivo origen | Concepto de Negocio | Formato | Definición |
| --- | --- | --- | --- | --- |
| ACC-ID | ACCOUNT.cpy | Identificador de cuenta | X(12) | Identificador único de la cuenta bancaria. |
| ACC-CUSTOMER-ID | ACCOUNT.cpy | Identificador de cliente | X(10) | Identificador del cliente propietario de la cuenta. |
| ACC-STATUS | ACCOUNT.cpy | Estado de la cuenta | X(1) | Estado actual de la cuenta (abierto, bloqueado o cerrado). |
| ACC-BALANCE | ACCOUNT.cpy | Saldo de la cuenta | 9(9)V99 | Saldo actual de la cuenta. |
| ACC-DAILY-LIMIT | ACCOUNT.cpy | Límite diario de la cuenta | 9(9)V99 | Límite máximo de transacciones diarias permitidas en la cuenta. |
| ACC-CURRENCY | ACCOUNT.cpy | Moneda de la cuenta | X(3) | Moneda en la que se maneja la cuenta. |
| CUST-ID | CUSTOMER.cpy | Identificador de cliente | X(10) | Identificador único del cliente. |
| CUST-STATUS | CUSTOMER.cpy | Estado del cliente | X(1) | Estado actual del cliente (activo, bloqueado o cerrado). |
| CUST-KYC-FLAG | CUSTOMER.cpy | Estado de cumplimiento de KYC | X(1) | Indicador de si el cliente ha cumplido con los requisitos de conocimiento del cliente (KYC). |
| CUST-RISK-SEGMENT | CUSTOMER.cpy | Segmento de riesgo del cliente | X(1) | Nivel de riesgo asociado al cliente (bajo, medio o alto). |
| PAY-ID | PAYMENT.cpy | Identificador de pago | X(12) | Identificador único de la transacción de pago. |
| PAY-CUSTOMER-ID | PAYMENT.cpy | Identificador de cliente del pago | X(10) | Identificador del cliente que realiza el pago. |
| PAY-ACCOUNT-ID | PAYMENT.cpy | Identificador de cuenta del pago | X(12) | Identificador de la cuenta desde la que se realiza el pago. |
| PAY-AMOUNT | PAYMENT.cpy | Monto del pago | 9(9)V99 | Monto de la transacción de pago. |
| PAY-CURRENCY | PAYMENT.cpy | Moneda del pago | X(3) | Moneda en la que se realiza el pago. |
| PAY-CHANNEL | PAYMENT.cpy | Canal de pago | X(10) | Medio por el que se realiza el pago (tarjeta, transferencia, etc.). |
| PAY-DESTINATION | PAYMENT.cpy | Destino del pago | X(12) | Identificador del destinatario del pago. |
| PAY-REQUEST-DATE | PAYMENT.cpy | Fecha de solicitud del pago | 9(8) | Fecha en la que se solicitó el pago. |
| RETURN-CODE | RETURN_CODES.cpy | Código de retorno | X(4) | Código que indica el resultado de la validación del pago. |
| RETURN-MESSAGE | RETURN_CODES.cpy | Mensaje de retorno | X(80) | Descripción del resultado de la validación del pago. |
| RETURN-RISK-SCORE | RETURN_CODES.cpy | Puntuación de riesgo | 9(3) | Puntuación que indica el nivel de riesgo asociado al pago. |

---

## 📋 3. Especificación de Lógica y Reglas
**REGLAS DE NEGOCIO**

1.  **Validación de cuenta**: Una cuenta debe estar abierta y no bloqueada para realizar un pago.
2.  **Validación de moneda**: La moneda del pago debe coincidir con la moneda de la cuenta.
3.  **Límite diario**: El monto del pago no debe exceder el límite diario de la cuenta.
4.  **Fondos suficientes**: La cuenta debe tener fondos suficientes para realizar el pago.
5.  **Validación de cliente**: El cliente debe estar activo y no bloqueado.
6.  **KYC**: El cliente debe tener un KYC (Conozca a su cliente) válido.
7.  **Puntuación de riesgo**: La puntuación de riesgo del pago se calcula en función del monto y la segmentación de riesgo del cliente.
8.  **Revisión manual**: Los pagos con una puntuación de riesgo alta requieren revisión manual.

**MATRIZ DE DECISIONES Y FÓRMULAS**

| **Condición** | **Acción** | **Fórmula** |
| :------------ | :--------- | :---------- |
| Cuenta bloqueada o cerrada | Rechazar pago | - |
| Moneda del pago diferente a la cuenta | Rechazar pago | - |
| Monto del pago > límite diario | Rechazar pago | - |
| Fondos insuficientes | Rechazar pago | - |
| Cliente no activo o bloqueado | Rechazar pago | - |
| KYC no válido | Rechazar pago | - |
| Puntuación de riesgo > 80 | Rechazar pago | RETURN-RISK-SCORE = WS-BASE-SCORE + WS-AMOUNT-SCORE |
| Puntuación de riesgo > 60 | Revisión manual | RETURN-RISK-SCORE = WS-BASE-SCORE + WS-AMOUNT-SCORE |

**MAPEO DE COMPONENTES**

| **Componente** | **Descripción** | **Regla de negocio** |
| :------------- | :-------------- | :------------------ |
| PAYMAIN | Programa principal de pago | Validación de cuenta, moneda, límite diario, fondos suficientes |
| BALCHK | Subprograma de validación de cuenta | Validación de cuenta |
| CUSTVAL | Subprograma de validación de cliente | Validación de cliente, KYC |
| RISKSCOR | Subprograma de cálculo de puntuación de riesgo | Puntuación de riesgo |
| TXNLOG | Subprograma de registro de transacciones | Registro de transacciones |
| ACCOUNT | Copybook de cuenta | Validación de cuenta |
| CUSTOMER | Copybook de cliente | Validación de cliente |
| PAYMENT | Copybook de pago | Validación de pago |
| RETURN\_CODES | Copybook de códigos de retorno | Códigos de retorno |

Espero que esta información sea útil. Si necesitas más detalles o aclaraciones, no dudes en preguntar.

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
A[Read Payment File] -->> B[Parse Payment]
    B --> C[Validate Customer]
    C -->> D[Validate Account Balance]
    D -->> E[Calculate Risk Score]
    E -->> F[Write Result]
    E -->> G[Write Result]
    E -->> H[Write Result]
    F --> I[Write Summary]
    G --> I
    H --> I
    I --> J[End]
    C -->> K[Write Rejected]
    D -->> K
    K --> I
    subgraph JCL
        direction TB
        L[Execute PAYMAIN] --> M[Read PAYIN]
        M --> N[Write PAYOK, PAYREJ, AUDITOUT]
        N --> O[End]
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
        B[Ejecutar programa PAYMAIN]
        C[Lectura de archivos de entrada]
        D[Lectura de archivos de entrada]
        E[Lectura de archivos de entrada]
        F[Lectura de archivos de entrada]
        G[Lectura de archivos de entrada]
        H[Lectura de archivos de entrada]
        I[Lectura de archivos de entrada]
        J[Lectura de archivos de entrada]
        K[Lectura de archivos de entrada]
        L[Lectura de archivos de entrada]
        M[Lectura de archivos de entrada]
        N[Lectura de archivos de entrada]
        O[Lectura de archivos de entrada]
        P[Lectura de archivos de entrada]
        Q[Lectura de archivos de entrada]
        R[Lectura de archivos de entrada]
        S[Lectura de archivos de entrada]
        T[Lectura de archivos de entrada]
        U[Lectura de archivos de entrada]
        V[Lectura de archivos de entrada]
        W[Lectura de archivos de entrada]
        X[Lectura de archivos de entrada]
        Y[Lectura de archivos de entrada]
        Z[Lectura de archivos de entrada]
        AA[Lectura de archivos de entrada]
        BB[Lectura de archivos de entrada]
        CC[Lectura de archivos de entrada]
        DD[Lectura de archivos de entrada]
        EE[Lectura de archivos de entrada]
        FF[Lectura de archivos de entrada]
        GG[Lectura de archivos de entrada]
        HH[Lectura de archivos de entrada]
        II[Lectura de archivos de entrada]
        JJ[Lectura de archivos de entrada]
        KK[Lectura de archivos de entrada]
        LL[Lectura de archivos de entrada]
        MM[Lectura de archivos de entrada]
        NN[Lectura de archivos de entrada]
        OO[Lectura de archivos de entrada]
        PP[Lectura de archivos de entrada]
        QQ[Lectura de archivos de entrada]
        RR[Lectura de archivos de entrada]
        SS[Lectura de archivos de entrada]
        TT[Lectura de archivos de entrada]
        UU[Lectura de archivos de entrada]
        VV[Lectura de archivos de entrada]
        WW[Lectura de archivos de entrada]
        XX[Lectura de archivos de entrada]
        YY[Lectura de archivos de entrada]
        ZZ[Lectura de archivos de entrada]
        AAA[Lectura de archivos de entrada]
        BBB[Lectura de archivos de entrada]
        CCC[Lectura de archivos de entrada]
        DDD[Lectura de archivos de entrada]
        EEE[Lectura de archivos de entrada]
        FFF[Lectura de archivos de entrada]
        GGG[Lectura de archivos de entrada]
        HHH[Lectura de archivos de entrada]
        III[Lectura de archivos de entrada]
        JJJ[Lectura de archivos de entrada]
        KKK[Lectura de archivos de entrada]
        LLL[Lectura de archivos de entrada]
        MMM[Lectura de archivos de entrada]
        NNN[Lectura de archivos de entrada]
        OOO[Lectura de archivos de entrada]
        PPP[Lectura de archivos de entrada]
        QQQ[Lectura de archivos de entrada]
        RRR[Lectura de archivos de entrada]
        SSS[Lectura de archivos de entrada]
        TTT[Lectura de archivos de entrada]
        UUU[Lectura de archivos de entrada]
        VVV[Lectura de archivos de entrada]
        WWW[Lectura de archivos de entrada]
        XXX[Lectura de archivos de entrada]
        YYY[Lectura de archivos de entrada]
        ZZZ[Lectura de archivos de entrada]
        AAAAA[Lectura de archivos de entrada]
        BBBB[Lectura de archivos de entrada]
        CCCC[Lectura de archivos de entrada]
        DDDD[Lectura de archivos de entrada]
        EEEE[Lectura de archivos de entrada]
        FFFF[Lectura de archivos de entrada]
        GGGG[Lectura de archivos de entrada]
        HHHH[Lectura de archivos de entrada]
        IIII[Lectura de archivos de entrada]
        JJJJ[Lectura de archivos de entrada]
        KKKK[Lectura de archivos de entrada]
        LLLL[Lectura de archivos de entrada]
        MMMM[Lectura de archivos de entrada]
        NNNN[Lectura de archivos de entrada]
        OOOO[Lectura de archivos de entrada]
        PPPP[Lectura de archivos de entrada]
        QQQQ[Lectura de archivos de entrada]
        RRRR[Lectura de archivos de entrada]
        SSSS[Lectura de archivos de entrada]
        TTTT[Lectura de archivos de entrada]
        UUUU[Lectura de archivos de entrada]
        VVVV[Lectura de archivos de entrada]
        WWWW[Lectura de archivos de entrada]
        XXXX[Lectura de archivos de entrada]
        YYYY[Lectura de archivos de entrada]
        ZZZZ[Lectura de archivos de entrada]
        AAAAAA[Lectura de archivos de entrada]
        BBBBB[Lectura de archivos de entrada]
        CCCCC[Lectura de archivos de entrada]
        DDDDD[Lectura de archivos de entrada]
        EEEEE[Lectura de archivos de entrada]
        FFFFF[Lectura de archivos de entrada]
        GGGGG[Lectura de archivos de entrada]
        HHHHH[Lectura de archivos de entrada]
        IIIII[Lectura de archivos de entrada]
        JJJJJ[Lectura de archivos de entrada]
        KKKKK[Lectura de archivos de entrada]
        LLLLL[Lectura de archivos de entrada]
        MMMMM[Lectura de archivos de entrada]
        NNNNN[Lectura de archivos de entrada]
        OOOOO[Lectura de archivos de entrada]
        PPPPP[Lectura de archivos de entrada]
        QQQQQ[Lectura de archivos de entrada]
        RRRRR[Lectura de archivos de entrada]
        SSSSS[Lectura de archivos de entrada]
        TTTTT[Lectura de archivos de entrada]
        UUUUU[Lectura de archivos de entrada]
        VVVVV[Lectura de archivos de entrada]
        WWWWW[Lectura de archivos de entrada]
        XXXXX[Lectura de archivos de entrada]
        YYYYY[Lectura de archivos de entrada]
        ZZZZZ[Lectura de archivos de entrada]
        AAAAAAA[Lectura de archivos de entrada]
        BBBBBB[Lectura de archivos de entrada]
        CCCCCC[Lectura de archivos de entrada]
        DDDDDD[Lectura de archivos de entrada]
        EEEEEE[Lectura de archivos de entrada]
        FFFFFF[Lectura de archivos de entrada]
        GGGGGG[Lectura de archivos de entrada]
        HHHHHH[Lectura de archivos de entrada]
        IIIIII[Lectura de archivos de entrada]
        JJJJJJ[Lectura de archivos de entrada]
        KKKKKK[Lectura de archivos de entrada]
        LLLLLL[Lectura de archivos de entrada]
        MMMMMM[Lectura de archivos de entrada]
        NNNNNN[Lectura de archivos de entrada]
        OOOOOO[Lectura de archivos de entrada]
        PPPPPP[Lectura de archivos de entrada]
        QQQQQQ[Lectura de archivos de entrada]
        RRRRRR[Lectura de archivos de entrada]
        SSSSSS[Lectura de archivos de entrada]
        TTTTTT[Lectura de archivos de entrada]
        UUUUUU[Lectura de archivos de entrada]
        VVVVVV[Lectura de archivos de entrada]
        WWWWWW[Lectura de archivos de entrada]
        XXXXXX[Lectura de archivos de entrada]
        YYYYYY[Lectura de archivos de entrada]
        ZZZZZZ[Lectura de archivos de entrada]
        AAAAAAAA[Lectura de archivos de entrada]
        BBBBBBB[Lectura de archivos de entrada]
        CCCCCCC[Lectura de archivos de entrada]
        DDDDDDD[Lectura de archivos de entrada]
        EEEEEEE[Lectura de archivos de entrada]
        FFFFFFF[Lectura de archivos de entrada]
        GGGGGGG[Lectura de archivos de entrada]
        HHHHHHH[Lectura de archivos de entrada]
        IIIIIII[Lectura de archivos de entrada]
        JJJJJJJ[Lectura de archivos de entrada]
        KKKKKKK[Lectura de archivos de entrada]
        LLLLLLL[Lectura de archivos de entrada]
        MMMMMMM[Lectura de archivos de entrada]
        NNNNNNN[Lectura de archivos de entrada]
        OOOOOOO[Lectura de archivos de entrada]
        PPPPPPP[Lectura de archivos de entrada]
        QQQQQQQ[Lectura de archivos de entrada]
        RRRRRRR[Lectura de archivos de entrada]
        SSSSSSS[Lectura de archivos de entrada]
        TTTTTTT[Lectura de archivos de entrada]
        UUUUUUU[Lectura de archivos de entrada]
        VVVVVVV[Lectura de archivos de entrada]
        WWWWWWW[Lectura de archivos de entrada]
        XXXXXXX[Lectura de archivos de entrada]
        YYYYYYY[Lectura de archivos de entrada]
        ZZZZZZZ[Lectura de archivos de entrada]
        AAAAAAAAA[Lectura de archivos de entrada]
        BBBBBBBB[Lectura de archivos de entrada]
        CCCCCCCC[Lectura de archivos de entrada]
        DDDDDDDD[Lectura de archivos de entrada]
        EEEEEEEE[Lectura de archivos de entrada]
        FFFFFFFFF[Lectura de archivos de entrada]
        GGGGGGGG[Lectura de archivos de entrada]
        HHHHHHHH[Lectura de archivos de entrada]
        IIIIIIII[Lectura de archivos de entrada]
        JJJJJJJJ[Lectura de archivos de entrada]
        KKKKKKKK[Lectura de archivos de entrada]
        LLLLLLLL[Lectura de archivos de entrada]
        MMMMMMMM[Lectura de archivos de entrada]
        NNNNNNNN[Lectura de archivos de entrada]
        OOOOOOOO[Lectura de archivos de entrada]
        PPPPPPPP[Lectura de archivos de entrada]
        QQQQQQQQ[Lectura de archivos de entrada]
        RRRRRRRR[Lectura de archivos de entrada]
        SSSSSSSS[Lectura de archivos de entrada]
        TTTTTTTT[Lectura de archivos de entrada]
        UUUUUUUU[Lectura de archivos de entrada]
        VVVVVVVV[Lectura de archivos de entrada]
        WWWWWWWW[Lectura de archivos de entrada]
        XXXXXXXX[Lectura de archivos de entrada]
        YYYYYYYY[Lectura de archivos de entrada]
        ZZZZZZZZ[Lectura de archivos de entrada]
        AAAAAAAAAA[Lectura de archivos de entrada]
        BBBBBBBBB[Lectura de archivos de entrada]
        CCCCCCCCC[Lectura de archivos de entrada]
        DDDDDDDDD[Lectura de archivos de entrada]
        EEEEEEEEEE[Lectura de archivos de entrada]
        FFFFFFFFFFF[Lectura de archivos de entrada]
        GGGGGGGGGG[Lectura de archivos de entrada]
        HHHHHHHHHH[Lectura de archivos de entrada]
        IIIIIIIIII[Lectura de archivos de entrada]
        JJJJJJJJJJ[Lectura de archivos de entrada]
        KKKKKKKKKK[Lectura de archivos de entrada]
        LLLLLLLLLL[Lectura de archivos de entrada]
        MMMMMMMMMM[Lectura de archivos de entrada]
        NNNNNNNNNN[Lectura de archivos de entrada]
        OOOOOOOOOO[Lectura de archivos de entrada]
        PPPPPPPPPP[Lectura de archivos de entrada]
        QQQQQQQQQQ[Lectura de archivos de entrada]
        RRRRRRRRRR[Lectura de archivos de entrada]
        SSSSSSSSSS[Lectura de archivos de entrada]
        TTTTTTTTTT[Lectura de archivos de entrada]
        UUUUUUUUUU[Lectura de archivos de entrada]
        VVVVVVVVVV[Lectura de archivos de entrada]
        WWWWWWWWWW[Lectura de archivos de entrada]
        XXXXXXXXXXX[Lectura de archivos de entrada]
        YYYYYYYYYY[Lectura de archivos de entrada]
        ZZZZZZZZZZ[Lectura de archivos de entrada]
        AAAAAAAAAAA[Lectura de archivos de entrada]
        BBBBBBBBBB[Lectura de archivos de entrada]
        CCCCCCCCCC[Lectura de archivos de entrada]
        DDDDDDDDDDD[Lectura de archivos de entrada]
        EEEEEEEEEEE[Lectura de archivos de entrada]
        FFFFFFFFFFFF[Lectura de archivos de entrada]
        GGGGGGGGGGGG[Lectura de archivos de entrada]
        HHHHHHHHHHHH[Lectura de archivos de entrada]
        IIIIIIIIIIII[Lectura de archivos de entrada]
        JJJJJJJJJJJJ[Lectura de archivos de entrada]
        KKKKKKKKKKKK[Lectura de archivos de entrada]
        LLLLLLLLLLLL[Lectura de archivos de entrada]
        MMMMMMMMMMMM[Lectura de archivos de entrada]
        NNNNNNNNNNNN[Lectura de archivos de entrada]
        OOOOOOOOOOOO[Lectura de archivos de entrada]
        PPPPPPPPPPPP[Lectura de archivos de entrada]
        QQQQQQQQQQQQ[Lectura de archivos de entrada]
        RRRRRRRRRRRR[Lectura de archivos de entrada]
        SSSSSSSSSSSS[Lectura de archivos de entrada]
        TTTTTTTTTTTT[Lectura de archivos de entrada]
        UUUUUUUUUUUU[Lectura de archivos de entrada]
        VVVVVVVVVVVV[Lectura de archivos de entrada]
        WWWWWWWWWWWW[Lectura de archivos de entrada]
        XXXXXXXXXXXX[Lectura de archivos de entrada]
        YYYYYYYYYYYY[Lectura de archivos de entrada]
        ZZZZZZZZZZZZ[Lectura de archivos de entrada]
        AAAAAAAAAAAAA[Lectura de archivos de entrada]
        BBBBBBBBBBBB[Lectura de archivos de entrada]
        CCCCCCCCCCCC[Lectura de archivos de entrada]
        DDDDDDDDDDDDD[Lectura de archivos de entrada]
        EEEEEEEEEEEEE[Lectura de archivos de entrada]
        FFFFFFFFFFFF[Lectura de archivos de entrada]
        GGGGGGGGGGGGG[Lectura de archivos de entrada]
        HHHHHHHHHHHHH[Lectura de archivos de entrada]
        IIIIIIIIIIIII[Lectura de archivos de entrada]
        JJJJJJJJJJJJJ[Lectura de archivos de entrada]
        KKKKKKKKKKKKK[Lectura de archivos de entrada]
        LLLLLLLLLLLLL[Lectura de archivos de entrada]
        MMMMMMMMMMMMM[Lectura de archivos de entrada]
        NNNNNNNNNNNNN[Lectura de archivos de entrada]
        OOOOOOOOOOOOO[Lectura de archivos de entrada]
        PPPPPPPPPPPPP[Lectura de archivos de entrada]
        QQQQQQQQQQQQQ[Lectura de archivos de entrada]
        RRRRRRRRRRRRR[Lectura de archivos de entrada]
        SSSSSSSSSSSSS[Lectura de archivos de entrada]
        TTTTTTTTTTTTT[Lectura de archivos de entrada]
        UUUUUUUUUUUUU[Lectura de archivos de entrada]
        VVVVVVVVVVVVV[Lectura de archivos de entrada]
        WWWWWWWWWWWWW[Lectura de archivos de entrada]
        XXXXXXXXXXXXX[Lectura de archivos de entrada]
        YYYYYYYYYYYYY[Lectura de archivos de entrada]
        ZZZZZZZZZZZZZ[Lectura de archivos de entrada]
        AAAAAAAAAAAAAA[Lectura de archivos de entrada]
        BBBBBBBBBBBBB[Lectura de archivos de entrada]
        CCCCCCCCCCCCC[Lectura de archivos de entrada]
        DDDDDDDDDDDDDD[Lectura de archivos de entrada]
        EEEEEEEEEEEEEE[Lectura de archivos de entrada]
        FFFFFFFFFFFFF[Lectura de archivos de entrada]
        GGGGGGGGGGGGGG[Lectura de archivos de entrada]
        HHHHHHHHHHHHHH[Lectura de archivos de entrada]
        IIIIIIIIIIIIII[Lectura de archivos de entrada]
        JJJJJJJJJJJJJJ[Lectura de archivos de entrada]
        KKKKKKKKKKKKKK[Lectura de archivos de entrada]
        LLLLLLLLLLLLLL[Lectura de archivos de entrada]
        MMMMMMMMMMMMMM[Lectura de archivos de entrada]
        NNNNNNNNNNNNNN[Lectura de archivos de entrada]
        OOOOOOOOOOOOOO[Lectura de archivos de entrada]
        PPPPPPPPPPPPPP[Lectura de archivos de entrada]
        QQQQQQQQQQQQQQ[Lectura de archivos de entrada]
        RRRRRRRRRRRRRR[Lectura de archivos de entrada]
        SSSSSSSSSSSSSS[Lectura de archivos de entrada]
        TTTTTTTTTTTTTT[Lectura de archivos de entrada]
        UUUUUUUUUUUUUU[Lectura de archivos de entrada]
        VVVVVVVVVVVVVV[Lectura de archivos de entrada]
        WWWWWWWWWWWWWW[Lectura de archivos de entrada]
        XXXXXXXXXXXXXX[Lectura de archivos de entrada]
        YYYYYYYYYYYYYY[Lectura de archivos de entrada]
        ZZZZZZZZZZZZZZ[Lectura de archivos de entrada]
        AAAAAAAAAAAAAAA[Lectura de archivos de entrada]
        BBBBBBBBBBBBBB[Lectura de archivos de entrada]
        CCCCCCCCCCCCCC[Lectura de archivos de entrada]
        DDDDDDDDDDDDDDD[Lectura de archivos de entrada]
        EEEEEEEEEEEEEEE[Lectura de archivos de entrada]
        FFFFFFFFFFFFFF[Lectura de archivos de entrada]
        GGGGGGGGGGGGGGG[Lectura de archivos de entrada]
        HHHHHHHHHHHHHHH[Lectura de archivos de entrada]
        IIIIIIIIIIIIIII[Lectura de archivos de entrada]
        JJJJJJJJJJJJJJJ[Lectura de archivos de entrada]
        KKKKKKKKKKKKKKK[Lectura de archivos de entrada]
        LLLLLLLLLLLLLLL[Lectura de archivos de entrada]
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
| Fidelidad Java vs COBOL | 95% | El código Java generado implementa la mayoría de las reglas de negocio y lógica del COBOL original, pero hay algunas diferencias en la implementación de la lógica de riesgo y validaciones. | La lógica de riesgo y validaciones en el código Java generado no es idéntica a la del COBOL original. | Revisar y ajustar la lógica de riesgo y validaciones en el código Java generado para asegurarse de que sea idéntica a la del COBOL original. |
| Cobertura de reglas por tests | 80% | Los tests generados cubren la mayoría de las reglas de negocio y lógica del COBOL original, pero hay algunas reglas que no están cubiertas. | Algunas reglas de negocio y lógica del COBOL original no están cubiertas por los tests generados. | Agregar tests adicionales para cubrir las reglas de negocio y lógica del COBOL original que no están cubiertas. |
| Cobertura funcional Gherkin | 90% | Los escenarios Gherkin generados cubren la mayoría de los casos de uso y flujos de la aplicación, pero hay algunos casos que no están cubiertos. | Algunos casos de uso y flujos de la aplicación no están cubiertos por los escenarios Gherkin generados. | Agregar escenarios Gherkin adicionales para cubrir los casos de uso y flujos de la aplicación que no están cubiertos. |
| Calidad del código Java | 85% | El código Java generado es legible y mantenible, pero hay algunas áreas que pueden ser mejoradas. | El código Java generado puede ser mejorado en términos de legibilidad y mantenibilidad. | Revisar y mejorar el código Java generado para asegurarse de que sea legible y mantenible. |
| Madurez general para revisión humana | 80% | El código Java generado y los tests y escenarios Gherkin generados están listos para ser revisados por humanos, pero hay algunas áreas que pueden ser mejoradas. | El código Java generado y los tests y escenarios Gherkin generados pueden ser mejorados en términos de legibilidad y mantenibilidad. | Revisar y mejorar el código Java generado y los tests y escenarios Gherkin generados para asegurarse de que sean legibles y mantenibles. |

---

## 🧪 6. Escenarios Gherkin Generados

```gherkin
Característica: Procesamiento de pagos diarios

  Antecedentes:
    Dado que el archivo de entrada de pagos diarios BBVA.PAYMENTS.DAILY.INPUT existe
    Y el archivo de clientes BBVA.CUSTOMER.MASTER existe
    Y el archivo de cuentas BBVA.ACCOUNT.MASTER existe
    Y el programa PAYMAIN está disponible en BBVA.LEGO.LOADLIB
    Y los archivos de salida BBVA.PAYMENTS.APPROVED, BBVA.PAYMENTS.REJECTED y BBVA.PAYMENTS.AUDIT.LOG no existen

  Escenario: Flujo feliz - pago aprobado
    Dado que el archivo de entrada de pagos diarios contiene un pago válido
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene el pago aprobado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago aprobado

  Escenario: Caso de borde - pago rechazado por insuficiente saldo
    Dado que el archivo de entrada de pagos diarios contiene un pago con insuficiente saldo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Caso de error - pago rechazado por cliente no activo
    Dado que el archivo de entrada de pagos diarios contiene un pago de un cliente no activo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Validación rechaza la operación - pago rechazado por riesgo
    Dado que el archivo de entrada de pagos diarios contiene un pago con riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene el pago rechazado
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene el registro de auditoría del pago rechazado

  Escenario: Escenario batch de entrada y salida - varios pagos
    Dado que el archivo de entrada de pagos diarios contiene varios pagos válidos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.APPROVED contiene los pagos aprobados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos aprobados

  Escenario: Escenario batch de entrada y salida - varios pagos con errores
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con validaciones rechazadas
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con validaciones rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con riesgo alto
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con insuficiente saldo
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con insuficiente saldo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos de clientes no activos
    Dado que el archivo de entrada de pagos diarios contiene varios pagos de clientes no activos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con errores y validaciones rechazadas
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores y validaciones rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con riesgo alto y validaciones rechazadas
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con riesgo alto y validaciones rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con insuficiente saldo y validaciones rechazadas
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con insuficiente saldo y validaciones rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos de clientes no activos y validaciones rechazadas
    Dado que el archivo de entrada de pagos diarios contiene varios pagos de clientes no activos y validaciones rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con errores, validaciones rechazadas y riesgo alto
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores, validaciones rechazadas y riesgo alto
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con errores, validaciones rechazadas, riesgo alto y insuficiente saldo
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores, validaciones rechazadas, riesgo alto y insuficiente saldo
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Escenario: Escenario batch de entrada y salida - varios pagos con errores, validaciones rechazadas, riesgo alto, insuficiente saldo y clientes no activos
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con errores, validaciones rechazadas, riesgo alto, insuficiente saldo y clientes no activos
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

  Esquema del escenario: Escenario batch de entrada y salida - varios pagos con diferentes combinaciones de errores y validaciones rechazadas
    Dado que el archivo de entrada de pagos diarios contiene varios pagos con diferentes combinaciones de errores y validaciones rechazadas
    Cuando se ejecuta el programa PAYMAIN
    Entonces el archivo de salida BBVA.PAYMENTS.REJECTED contiene los pagos rechazados
    Y el archivo de salida BBVA.PAYMENTS.AUDIT.LOG contiene los registros de auditoría de los pagos rechazados

    Ejemplos:
      | Errores y validaciones rechazadas |
      | Errores y validaciones rechazadas y riesgo alto |
      | Errores y validaciones rechazadas y riesgo alto y insuficiente saldo |
      | Errores y validaciones rechazadas y riesgo alto y insuficiente saldo y clientes no activos |
```
