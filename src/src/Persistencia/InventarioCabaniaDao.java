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


	/**
	 * Metodo que permite actualizar la cantidad de elementos en una cabania
	 *  agregando más. Como parametro ingresa la cantidad de elementos 
	 *  y el id de la cabania
	 * 
	 * @param cantidadElementos
	 * @param idCabania
	 */
	public boolean actualizarInventarioMasElementos(int cantidadElementos, 
			int idCabania){
		return false;
	}

	/**
	 * Metodo que permite quitar elementos de una cabania y actualizarlo 
	 * en la base de datos
	 * 
	 * @param cantidadElementosMenos
	 * @param idCabania
	 */
	public boolean actualizarInventarioMenosElementos(
			int cantidadElementosMenos, int idCabania){
		return false;
	}

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
				Connection conn = ConexionDB.getConexion();

				String queryInsertar = "INSERT INTO inventario_cabania VALUES(?,?,?)";

				PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
				ppStm.setInt(1, cabania.getId_servicio());
				ppStm.setInt(2, elemento.getIdElemento());
				ppStm.setInt(3, cantidad);

				ppStm.executeUpdate();

				conn.close();

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
			Connection conn = ConexionDB.getConexion();
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
			conn.close();

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
			Connection conn = ConexionDB.getConexion();
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
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

		return listaInventario;

	}

}