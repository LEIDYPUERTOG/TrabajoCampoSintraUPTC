package Persistencia;

import Logica.InformacionReserva;
import Logica.Persona;
import Logica.Reserva;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by LEIDY on 28/09/2015.
 */
public class InformacionReservaDao {

    private ConexionDB conexionDB;
    private Connection conn;

    /**
     * Metodo que permite actualizar la informacion de una reserva
     * @param idReserva
     * @return
     */
    public boolean actualizarInformacionReserva(int idReserva,Date fechaInicio, Date fechaFin){
        boolean actualizacion = false;
        InformacionReserva informacionReserva = this.obtenerInfo(idReserva);
        if(informacionReserva != null){
            try {
                conn = conexionDB.getConexion();
                String queryUpdate = "UPDATE informacion_reserva SET  fecha_inicio_reserva = ?, fecha_fin_reserva = ?"
                        + " WHERE id_reserva = ?";

                PreparedStatement ppStm = conn.prepareStatement(queryUpdate);

                ppStm.setDate(1,fechaInicio);
                ppStm.setDate(2,fechaFin);
                ppStm.setInt(3, idReserva);

                ppStm.executeUpdate();

                //conn.close();
                actualizacion = true;

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                actualizacion = false;
            }
        }
        return actualizacion;
    }



    /**
     * Metodo que permite crear la informacion de una reserva
     * @param informacionReserva
     * @return
     */
    public  boolean crearInformacionReserva(InformacionReserva informacionReserva){
        try {
            conn = conexionDB.getConexion();

            String queryInsertar = "INSERT INTO informacion_reserva VALUES(?,?,?,?,?)";

            PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
            ppStm.setInt(1, informacionReserva.getReserva().getIdReserva());
            if (informacionReserva.getInvitado()!=null){
                ppStm.setInt(2, informacionReserva.getInvitado().getCedula());
            }

            ppStm.setDate(3, informacionReserva.getFechaInicioReserva());
            ppStm.setDate(4,informacionReserva.getFechaFinReserva());
            ppStm.setDate(5, informacionReserva.getFechaRealSalida());
            ppStm.executeUpdate();

            //conn.close();

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
            conn = conexionDB.getConexion();
            String querySearch = "SELECT * FROM informacion_reserva WHERE documento_persona =?";

            PreparedStatement ppStm = conn.prepareStatement(querySearch);
            ppStm.setInt(1,documentoPersona);
            ResultSet resultSet = ppStm.executeQuery();


            while(resultSet.next()){
                PersonaDao personaDao = new PersonaDao();
                Persona persona = personaDao.consultarPersona(documentoPersona);


                listaInfoReserva = new ArrayList<>();

               /* listaInfoReserva.add(new InformacionReserva
                        (resultSet.getDate(3),resultSet.getDate(4),resultSet.getDate(5),persona));//----------------FALTA LA RESERVA*/
            }
            //conn.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }
        return listaInfoReserva;
    }

    /**
     * Obtener la informacion de una reserva
     * @param idReserva
     * @return
     */

    public InformacionReserva obtenerInfo(int idReserva){
        InformacionReserva informacionReserva = null;
        try {
            conn = conexionDB.getConexion();
            String querySearch = "SELECT * FROM informacion_reserva WHERE id_reserva =?";

            PreparedStatement ppStm = conn.prepareStatement(querySearch);
            ppStm.setInt(1,idReserva);
            ResultSet resultSet = ppStm.executeQuery();

            if(resultSet.next()){

                ReservaDao reservaDao = new ReservaDao();
                Reserva reserva = reservaDao.consultarReservaIdReserva(idReserva);
                reserva.setIdReserva(resultSet.getInt(1));
                informacionReserva = new InformacionReserva(resultSet.getDate(3),
                        resultSet.getDate(4),resultSet.getDate(4),reserva);


            }else{
                return informacionReserva;
            }
            //conn.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }
        return informacionReserva;
    }

    public ConexionDB getConexionDB() {
        return conexionDB;
    }

    public void setConexionDB(ConexionDB conexionDB) {
        this.conexionDB = conexionDB;
    }
}
