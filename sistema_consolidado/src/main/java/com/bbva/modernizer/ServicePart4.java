// CuentaRepository.java
public interface CuentaRepository extends JpaRepository<Cuenta, Long> {
}

// TransaccionRepository.java
public interface TransaccionRepository extends JpaRepository<Transaccion, Long> {
}