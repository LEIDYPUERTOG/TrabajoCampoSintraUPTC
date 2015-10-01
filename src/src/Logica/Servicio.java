package Logica;

/**
 * Clase que permite acceder a los atributos de un servicio
 * @author LEIDY
 * @version 1.0
 * @created 28-sep.-2015 6:20:23 p. m.
 */
public class Servicio {

    /**
     * Atributo que permite colocar la ruta en donde
     * esta la foto del lugar
     */
    private String foto_zona;
    /**
     * Atributo que permite tener el valor del servicio
     * por dia
     */
    private double valor_servicio_dia;
    /**
     * Atributo que permite tener el id del servicio
     */
    private int id_servicio;

    public Servicio(){

    }

    public Servicio(String foto_zona, double valor_servicio_dia, int id_servicio) {
        this.foto_zona = foto_zona;
        this.valor_servicio_dia = valor_servicio_dia;
        this.id_servicio = id_servicio;
    }

    /**
     * Constructor de la clase que permite crear un servicio de tipo cabania
     * @param cabania
     * @param foto_zona
     * @param valor_servicio_dia
     * @param id_servicio
     */
    public Servicio(Cabania cabania, String foto_zona, double valor_servicio_dia, int id_servicio) {
        this.foto_zona = foto_zona;
        this.valor_servicio_dia = valor_servicio_dia;
        this.id_servicio = id_servicio;
    }

    /**
     * Constructo de la clase que permite crear un servicio de tipo camping
     * @param camping
     * @param foto_zona
     * @param valor_servicio_dia
     * @param id_servicio
     */
    public Servicio(Camping camping,String foto_zona, double valor_servicio_dia, int id_servicio) {
        this.foto_zona = foto_zona;
        this.valor_servicio_dia = valor_servicio_dia;
        this.id_servicio = id_servicio;
    }

    public String getFoto_zona() {
        return foto_zona;
    }

    public void setFoto_zona(String foto_zona) {
        this.foto_zona = foto_zona;
    }

    public double getValor_servicio_dia() {
        return valor_servicio_dia;
    }

    public void setValor_servicio_dia(double valor_servicio_dia) {
        this.valor_servicio_dia = valor_servicio_dia;
    }

    public int getId_servicio() {
        return id_servicio;
    }

    public void setId_servicio(int id_servicio) {
        this.id_servicio = id_servicio;
    }

}
