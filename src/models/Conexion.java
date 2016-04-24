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
    
    public ResultSet getConsultorios(){
        try {
            query = conection.prepareStatement("SELECT * FROM consultorio");
            data = query.executeQuery();
            
            return data;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public int getNumberConsultorios(){
        int num = 0;
        try {
            query = conection.prepareStatement("SELECT COUNT(*) FROM consultorio");
            data = query.executeQuery();
            
            while( data.next() ){
                return data.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return num;
    }
    
    public ResultSet getTratamientosByConsultorio(String idConsultorio){
        try {
            query = conection.prepareStatement("SELECT * FROM planes_consultorio pc INNER JOIN tratamiento t ON pc.codigoTratamiento = t.codigo WHERE pc.idConsultorio = ?");
            query.setInt(1, Integer.parseInt(idConsultorio));
            data = query.executeQuery();
            
            return data;
        } catch (SQLException | NumberFormatException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public int getNumberTratamientosByConsultorio(String idConsultorio){
        int num = 0;
        try {
            query = conection.prepareStatement("SELECT COUNT(*) FROM planes_consultorio INNER JOIN tratamiento t ON pc.codigoTratamiento = t.codigo WHERE pc.idConsultorio = ?");
            query.setInt(1, Integer.parseInt(idConsultorio));
            
            while( data.next() ){
                return data.getInt(1);
            }
        } catch (SQLException | NumberFormatException e) {
            System.out.println(e.getMessage());
        }
        
        return num;
    }
    
    public ResultSet getPacientes(){
        try {
            query = conection.prepareStatement("SELECT * FROM paciente p INNER JOIN usuario u ON p.id = u.idPaciente WHERE u.idPerfil = 4");
            data = query.executeQuery();
            
            return data;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public int getNumberPacientes(){
        int num = 0;
        try {
            query = conection.prepareStatement("SELECT COUNT(*) FROM paciente p INNER JOIN usuario u ON p.id = u.idPaciente WHERE u.idPerfil = 4");
            data = query.executeQuery();
            
            while( data.next() ){
                return data.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return num;
    }
    
    public int getValueTratamientoConsultorio(String idConsultorio, String idTratamiento){
        
        try {
            query = conection.prepareStatement("SELECT valor FROM planes_consultorio WHERE idConsultorio = ? AND codigoTratamiento = ?");
            query.setInt(1, Integer.parseInt(idConsultorio));
            query.setInt(2, Integer.parseInt(idTratamiento));
            data = query.executeQuery();
            
            while( data.next() ){
                return data.getInt(1);
            }
        } catch (SQLException | NumberFormatException e) {
            System.out.println(e.getMessage());
        }
        
        return -1;
    }
    
    public boolean registerTratamientoPatient(String idTratamiento, String idConsultorio, String idPaciente, String valor){
        try {
            query = conection.prepareStatement("INSERT INTO tratamiento_paciente VALUES(?,?,?,?,?,?)");
            query.setInt(1, 0);
            query.setInt(2, Integer.parseInt(idTratamiento));
            query.setInt(3, Integer.parseInt(idConsultorio));
            query.setInt(4, Integer.parseInt(idPaciente));
            query.setInt(5, Integer.parseInt(valor));
            query.setString(6, "En Proceso");
            
            query.executeUpdate();
            
        } catch (SQLException | NumberFormatException e) {
            System.out.println(e.getMessage());
            return false;
        }
        
        return true;
    }
}
