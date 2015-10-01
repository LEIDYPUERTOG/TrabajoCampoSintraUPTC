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
     * Metodo que permite crear un camping
     * @param camping
     * @return
     */
    public boolean crearCamping(Camping camping){
        try {
            Connection conn = ConexionDB.getConexion();

            String queryInsertar = "INSERT INTO camping VALUES(null,?,?,?)";

            PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
            ppStm.setString(1, camping.getFoto_zona());
            ppStm.setInt(2, camping.getCantidadPersonas());
            ppStm.setDouble(3, camping.getValor_servicio_dia());
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
     * Metodo que permite obtener toda la lista de camping
     * y los afiliados que la realizaron asi como el estado en que esta la
     * reserva
     * @return
     */
    public ArrayList<Camping> obtenerListaCamping(){
        ArrayList<Camping> listasCampingGeneral = null;
        try {
            Connection conn = ConexionDB.getConexion();
            String querySearch = "SELECT * FROM camping";

            PreparedStatement ppStm = conn.prepareStatement(querySearch);

            ResultSet resultSet = ppStm.executeQuery();

            if(resultSet.next()){
                listasCampingGeneral = new ArrayList<>();
                listasCampingGeneral.add(new Camping(resultSet.getString(4),resultSet.getInt(1),
                        resultSet.getInt(2)));
            }else{
                return listasCampingGeneral;
            }
            conn.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }
        return listasCampingGeneral;
    }
}
