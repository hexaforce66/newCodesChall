// ResultadoTransaccion.java
public class ResultadoTransaccion {

    private boolean exitosa;
    private BigDecimal nuevoSaldo;
    private String codigoError;

    public ResultadoTransaccion(boolean exitosa, BigDecimal nuevoSaldo, String codigoError) {
        this.exitosa = exitosa;
        this.nuevoSaldo = nuevoSaldo;
        this.codigoError = codigoError;
    }

    public boolean esExitosa() {
        return exitosa;
    }

    public BigDecimal getNuevoSaldo() {
        return nuevoSaldo;
    }

    public String getCodigoError() {
        return codigoError;
    }
}