// ConsultaSaldo.java
@Repository
public class ConsultaSaldo {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public BigDecimal consultarSaldo(int id) {
        return jdbcTemplate.queryForObject("SELECT saldo FROM cuentas WHERE id = ?", BigDecimal.class, id);
    }
}