// Cuenta.java
@Entity
public class Cuenta {
    @Id
    private Long id;
    private BigDecimal saldo;
    // Getters y setters
}

// Transaccion.java
@Entity
public class Transaccion {
    @Id
    private Long id;
    private BigDecimal monto;
    // Getters y setters
}