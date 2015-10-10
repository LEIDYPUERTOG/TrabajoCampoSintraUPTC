package Persistencia;

import Logica.Cabania;
import Logica.Elemento;
import Logica.InventarioCabania;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 * Clase que permite realizar operaciones sobre la base de datos con respecto a la
 * entidad Inventario
 * @author LEIDY
 * @version 1.0
 * @created 24-sep.-2015 8:54:08 a. m.
 */
public class InventarioCabaniaDao {

	private ConexionDB conexionDB;
	private Connection conn;


	/**
	 * Metodo que permite actualizar la cantidad de elementos en una cabania
	 *  agregando más. Como parametro ingresa la cantidad de elementos 
	 *  y el id de la cabania
	 * 
	 * @param cantidadElementos
	 * @param idCabania
	 */
//	public boolean actualizarInventario(int cantidadElementos,
//			int idCabania){

		/*boolean actualizacion = false;
		Persona persona = this.consultarPersona(documento);
		if(persona != null){
			try {
				conn = conexionDB.getConexion();
				String queryUpdate = "UPDATE persona SET  contrasenia = ? "
						+ "WHERE documento_persona = ?";

				PreparedStatement ppStm = conn.prepareStatement(queryUpdate);

				ppStm.setString(1, contrasenia);
				ppStm.setInt(2, documento);

				ppStm.executeUpdate();

				//conn.close();
				actualizacion = true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				actualizacion = false;
			}
		}
		return actualizacion;*/
	//}

	/**
	 * Metodo que permite agregar un nuevo elemento al inventario,
	 *  teniendo en cuenta el id del elemento y el id de la cabania
	 * 
	 * @param nombreElemento
	 * @param idCabania
	 * @param cantidad
	 */
	public boolean agregarElemento(String nombreElemento, int idCabania, int cantidad){
		boolean insercion = false;
		ElementoDao elementoDao = new ElementoDao();
		Elemento elemento = elementoDao.obtenerElemento(nombreElemento);

		CabaniaDao cabaniaDao = new CabaniaDao();
		Cabania cabania = cabaniaDao.obtenerInfoCabania(idCabania);

		if(elemento != null && cabania != null){
			try {
				conn = conexionDB.getConexion();

				String queryInsertar = "INSERT INTO inventario_cabania VALUES(?,?,?)";

				PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
				ppStm.setInt(1, cabania.getId_servicio());
				ppStm.setInt(2, elemento.getIdElemento());
				ppStm.setInt(3, cantidad);

				ppStm.executeUpdate();

				//conn.close();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				insercion = false;

			}
			insercion = true;
		}
		return  insercion;
	}

	/**
	 * Metodo que permite obtener el inventario total por elementos en 
	 * todas las cabanias
	 */
	public ArrayList<InventarioCabania> obtenerInventarioGeneral(){
		ArrayList<InventarioCabania> listaInventario = null;

		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT id_elemento,sum(cantidad) FROM inventario_cabania";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ResultSet resultSet = ppStm.executeQuery();
			ElementoDao elementoDao = new ElementoDao();
			if(resultSet.next()){
				Elemento elemento = elementoDao.obtenerElementoPorId(resultSet.getInt(1));

				listaInventario = new ArrayList<>();
				listaInventario.add(new InventarioCabania(resultSet.getInt(2),elemento));
			}else{
				return listaInventario;
			}
			//conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

		return listaInventario;
	}

	/**
	 * Metodo que permite obtener el listado de elementos que hay en
	 *  una cabania, ingresando por parametro el id de la cabania
	 * 
	 * @param idCabania
	 */
	public ArrayList<InventarioCabania> obtenerInventarioPorCabania(int idCabania){
		ArrayList<InventarioCabania> listaInventario = null;

		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM inventario_cabania WHERE id_cabania=?";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ResultSet resultSet = ppStm.executeQuery();
			ElementoDao elementoDao = new ElementoDao();
			CabaniaDao cabaniaDao = new CabaniaDao();
			if(resultSet.next()){
				Elemento elemento = elementoDao.obtenerElementoPorId(resultSet.getInt(2));
				Cabania cabania = cabaniaDao.obtenerInfoCabania(idCabania);

				listaInventario = new ArrayList<>();
				listaInventario.add(new InventarioCabania(resultSet.getInt(2),cabania,elemento));
			}else{
				return listaInventario;
			}
			//conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

		return listaInventario;

	}

	public ConexionDB getConexionDB() {
		return conexionDB;
	}

	public void setConexionDB(ConexionDB conexionDB) {
		this.conexionDB = conexionDB;
	}
}