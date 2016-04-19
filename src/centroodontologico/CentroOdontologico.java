package centroodontologico;

import models.Conexion;

/*
 * @author Daniel M. Sánchez
 * @website http://dmsanchez86.github.io
 */
public class CentroOdontologico {
    
    public static void main(String[] args) {
        // TODO code application logic here
        
        Conexion c = new Conexion();
        c.conectToDatabase();
    }
    
}
