package Persistencia;

import Logica.Camping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by LEIDY on 28/09/2015.
 */
public class CampingDao {

    private ConexionDB conexionDB;
    private Connection conn;

    /**
     * Metodo que permite actualizar la informacion
     * de un camping
     * @param idCamping
     * @return
     */
    public boolean actualizarCamping(int idCamping){
        return false;
    }

    /**
     * Metodo que permite crear un camping con foto
     * @param camping
     * @return
     */
    public boolean crearCamping(Camping camping){
        try {
            conn = conexionDB.getConexion();

            String queryInsertar = "INSERT INTO camping VALUES(null,?,?,?)";

            PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
            ppStm.setInt(1, camping.getCantidadPersonas());
            ppStm.setDouble(2, camping.getValor_servicio_dia());
            ppStm.setString(3, camping.getFoto_zona());

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
     * Metodo que permite crear camping sin foto
     * @param camping
     * @return
     */
    public boolean crearCampingSinFoto(Camping camping){
        try {
            conn = conexionDB.getConexion();

            String queryInsertar = "INSERT INTO camping VALUES(null,?,?,null)";

            PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
            ppStm.setInt(1, camping.getCantidadPersonas());
            ppStm.setDouble(2, camping.getValor_servicio_dia());

            ppStm.executeUpdate();

//            conn.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;

        }
        return true;
    }

    /**
     * Metodo que permite obtener toda la lista de camping
     * y los afiliados que la realizaron asi como el estado en que esta la
     * reserva
     * @return
     */
    public ArrayList<Camping> obtenerListaCamping(){
        ArrayList<Camping> listasCampingGeneral = null;
        try {
            conn = conexionDB.getConexion();
            String querySearch = "SELECT * FROM camping";

            PreparedStatement ppStm = conn.prepareStatement(querySearch);

            ResultSet resultSet = ppStm.executeQuery();
            listasCampingGeneral = new ArrayList<>();
            while(resultSet.next()){

                listasCampingGeneral.add(new Camping(resultSet.getString(4),resultSet.getInt(2),resultSet.getDouble(3)));
            }
  //          conn.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }
        return listasCampingGeneral;
    }

    public ConexionDB getConexionDB() {
        return conexionDB;
    }

    public void setConexionDB(ConexionDB conexionDB) {
        this.conexionDB = conexionDB;
    }
}
