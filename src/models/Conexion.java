package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * @author Daniel M. Sánchez
 * @website http://dmsanchez86.github.io
 */
public class Conexion {
    protected Connection conection;
    protected ResultSet data;
    protected PreparedStatement query;
    
    public boolean conectToDatabase(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conection = DriverManager.getConnection("jdbc:mysql://localhost/centro_odontologico", "root", "");
            System.out.println("Conected");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
        
        return true;
    }
    
    public boolean registerPatient(long id, String nombre, String apellidoPaterno, String apellidoMaterno, String direccion, String telefono){
        int affectedRows = -1;
        
        try {
            query = conection.prepareStatement("INSERT INTO paciente VALUES(?,?,?,?,?,?)");
            query.setLong(1, id);
            query.setString(2, nombre);
            query.setString(3, apellidoPaterno);
            query.setString(4, apellidoMaterno);
            query.setString(5, direccion);
            query.setString(6, telefono);
            
            affectedRows = query.executeUpdate();
            
            if(affectedRows > 0){
                return this.registerUser(id);
            }else{
                return false;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return false;
    }
    
    public boolean registerUser(long id){
        int affectedRows = -1;
        
        try {
            query = conection.prepareStatement("INSERT INTO usuario VALUES(?, ?, MD5(?), ?, ?)");
            query.setString(1, null);
            query.setString(2, ""+id);
            query.setString(3, "12345");
            query.setLong(4, id);
            query.setInt(5, 4);

            affectedRows = query.executeUpdate();

            return affectedRows > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public int validateLogin(String user, String password) {
        try {
            query = conection.prepareStatement("SELECT idPerfil FROM usuario WHERE usuario = ? AND clave =  MD5(?)");
            query.setString(1, user);
            query.setString(2, password);

            data = query.executeQuery();

            if(data.next()){
                return data.getInt("idPerfil");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return -1;
    }
}
