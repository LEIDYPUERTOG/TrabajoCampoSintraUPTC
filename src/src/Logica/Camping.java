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

    public Camping(String fotoZona, int idCamping, int cantidadPersonas) {
        this.setFoto_zona(fotoZona);
        this.setId_servicio(idCamping);
        this.cantidadPersonas = cantidadPersonas;

    }

    public int getCantidadPersonas() {
        return cantidadPersonas;
    }

    public void setCantidadPersonas(int cantidadPersonas) {
        this.cantidadPersonas = cantidadPersonas;
    }
}
