package Logica;

/**
 * Clase que permite manejar el camping
 * Created by LEIDY on 28/09/2015.
 */
public class Camping extends  Servicio{


    /**
     * Atributo que permite almacenar la cantidad de personas
     */
    private int cantidadPersonas;

    public Camping(String fotoZona,  int cantidadPersonas,double valorCamping) {
        this.setFoto_zona(fotoZona);
        //this.setId_servicio(idCamping);
        this.cantidadPersonas = cantidadPersonas;
        this.setValor_servicio_dia(valorCamping);
    }

    public Camping(int idCamping, int cantidadPersonas,double valorCamping) {
        this.setId_servicio(idCamping);
        this.cantidadPersonas = cantidadPersonas;
        this.setValor_servicio_dia(valorCamping);
    }

    public Camping( int cantidadPersonas) {
        this.cantidadPersonas = cantidadPersonas;
        this.setValor_servicio_dia(20000);
    }

    public int getCantidadPersonas() {
        return cantidadPersonas;
    }

    public void setCantidadPersonas(int cantidadPersonas) {
        this.cantidadPersonas = cantidadPersonas;
    }
}
