/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.util.HashMap;
import java.sql.SQLException;

/**
 *
 * @author IVAN
 */
public class Sangre {
    private int id_tipo;
    private String sangre;
    private Conexion cn;

    public Sangre(){}
    public Sangre(int id_sangre, String sangre) {
        this.id_tipo = id_tipo;
        this.sangre = sangre;
    }

    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public String getSangre() {
        return sangre;
    }

    public void setSangre(String sangre) {
        this.sangre = sangre;
    }
    
    public HashMap drop_sangre(){
        HashMap<String,String> drop = new HashMap();
        try{
            cn = new Conexion();
            String query="SELECT id_sangre as id,sangre FROM sangre;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()){
                 drop.put(consulta.getString("id"), consulta.getString("sangre"));
             }
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return drop;
            
    
    }
    
    
}
