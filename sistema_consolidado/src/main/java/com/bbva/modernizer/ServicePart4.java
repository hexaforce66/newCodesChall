// Transaccion.java
public record Transaccion(Long id, double monto) {}

// Cuenta.java
public record Cuenta(Long id, double saldo) {}

// ResultadoValidacion.java
public record ResultadoValidacion(boolean valido, double nuevoSaldo, String codigoError) {}