```mermaid
graph LR
    A[Introduce el número de tarjeta] -->|NUMERO-TARJETA|> B{¿MONTO-TRANSACCION > LIMITE-DIARIO?}
    B -->|SI| C[Transacción rechazada: excede límite diario]
    B -->|NO| D[Transacción aprobada]
    C --> E[FINALIZAR]
    D --> E
    style A fill:#f9f,stroke:#333,stroke-width:4px
    style B fill:#f9f,stroke:#333,stroke-width:4px
    style C fill:#f9f,stroke:#333,stroke-width:4px
    style D fill:#f9f,stroke:#333,stroke-width:4px
    style E fill:#f9f,stroke:#333,stroke-width:4px
```