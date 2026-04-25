```mermaid
graph LR
    A[Introduce el número de tarjeta] -->|NUMERO-TARJETA|> B{¿MONTO-TRANSACCION > LIMITE-DIARIO?}
    B -->|SI| C[Transacción rechazada: excede límite diario]
    B -->|NO| D[Transacción aprobada]
    C --> E[FINALIZAR]
    D --> E
```