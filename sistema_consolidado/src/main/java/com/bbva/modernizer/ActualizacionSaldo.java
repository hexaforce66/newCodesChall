// ActualizacionSaldo.java
@Repository
public class ActualizacionSaldo {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void actualizarSaldo(int id, BigDecimal nuevoSaldo) {
        jdbcTemplate.update("UPDATE cuentas SET saldo = ? WHERE id = ?", nuevoSaldo, id);
    }
}