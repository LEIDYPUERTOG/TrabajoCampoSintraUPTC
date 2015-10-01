package Persistencia;

import Logica.InformacionReserva;
import Logica.Persona;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by LEIDY on 28/09/2015.
 */
public class InformacionReservaDao {

    private ConexionDB conexionDB;

    /**
     * Metodo que permite actualizar la informacion de una reserva
     * @param informacionReservaDao
     * @return
     */
    public boolean actualizarInformacionReserva(InformacionReservaDao informacionReservaDao){
        return false;
    }

    /**
     * Metodo que permite crear la informacion de una reserva
     * @param informacionReserva
     * @return
     */
    public  boolean crearInformacionReserva(InformacionReserva informacionReserva){
        try {
            Connection conn = ConexionDB.getConexion();

            String queryInsertar = "INSERT INTO informacion_reserva VALUES(?,?,?,?,?)";

            PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
            //ppStm.setInt(1, informacionReserva.getReserva().getServicio().getId_servicio());
            ppStm.setInt(2,informacionReserva.getInvitado().getCedula());
            ppStm.setDate(3, informacionReserva.getFechaInicioReserva());
            ppStm.setDate(4,informacionReserva.getFechaFinReserva());
            ppStm.setDate(5,informacionReserva.getFechaRealSalida());
            ppStm.executeUpdate();

            conn.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;

        }
        return true;
    }

    /**
     * Metodo que permite obtener la lista de informacion
     * de reservas teniendo el documento de la persona que lo
     * realizo
     * @param documentoPersona
     * @return
     */
    public ArrayList<InformacionReserva> obtenerInformacion(int documentoPersona){
        ArrayList<InformacionReserva> listaInfoReserva = null;
        try {
            Connection conn = ConexionDB.getConexion();
            String querySearch = "SELECT * FROM informacion_reserva WHERE documento_persona =?";

            PreparedStatement ppStm = conn.prepareStatement(querySearch);
            ppStm.setInt(1,documentoPersona);
            ResultSet resultSet = ppStm.executeQuery();

            if(resultSet.next()){
                PersonaDao personaDao = new PersonaDao();
                Persona persona = personaDao.consultarPersona(documentoPersona);


                listaInfoReserva = new ArrayList<>();

              //  listaInfoReserva.add(new InformacionReserva
                //        (resultSet.getDate(3),resultSet.getDate(4),resultSet.getDate(5),persona));//----------------FALTA LA RESERVA
            }else{
                return listaInfoReserva;
            }
            conn.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }
        return listaInfoReserva;
    }
}
