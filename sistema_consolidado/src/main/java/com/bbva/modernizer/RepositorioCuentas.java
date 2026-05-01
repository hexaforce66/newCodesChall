// RepositorioCuentas.java
@Repository
public class RepositorioCuentas {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public Cuenta findById(Long id) {
        return jdbcTemplate.queryForObject("SELECT * FROM cuentas WHERE id = ?", new Object[]{id}, new CuentaRowMapper());
    }
    
    public void actualizarSaldo(Long id, double nuevoSaldo) {
        jdbcTemplate.update("UPDATE cuentas SET saldo = ? WHERE id = ?", nuevoSaldo, id);
    }
}