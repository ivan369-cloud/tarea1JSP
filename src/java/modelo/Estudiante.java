/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author IVAN
 */
public class Estudiante extends Persona {
    private String carnet;
    private int id_carnet;
    private Conexion cn;

    public Estudiante() {        
    }

    public Estudiante(String carnet, int id_carnet, int id, String nombres, String apellidos, String direccion, String telefono, String email, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, email, fecha_nacimiento);
        this.carnet = carnet;
        this.id_carnet = id_carnet;
    }

    
    public String getCarnet() {
        return carnet;
    }

    public void setCarnet(String carnet) {
        this.carnet = carnet;
    }

    public int getId_carnet() {
        return id_carnet;
    }

    public void setId_carnet(int id_carnet) {
        this.id_carnet = id_carnet;
    }
    
public DefaultTableModel leer(){
DefaultTableModel tabla = new DefaultTableModel();
try{
    cn = new Conexion();
    cn.abrir_conexion();  
    String query = "SELECT e.id_estudiantes as id,e.carne,e.nombres,e.apellidos,e.direccion,e.telefono,e.correo_electronico,e.fecha_nacimiento,p.sangre,p.id_sangre FROM estudiantes as e inner join sangre as p on e.id_sangre = p.id_sangre;";
    ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
    String encabezado[] = {"id","carnet","nombres","apellidos","direccion","telefono","email","nacimiento","Tipo_Sangre","id_sangre"};
    tabla.setColumnIdentifiers(encabezado);
    String datos [] = new String [10];
    while (consulta.next()){
        datos [0] = consulta.getString("id");
        datos [1] = consulta.getString("carne");
        datos [2] = consulta.getString("nombres");
        datos [3] = consulta.getString("apellidos");
        datos [4] = consulta.getString("direccion");
        datos [5] = consulta.getString("telefono");
        datos [6] = consulta.getString("correo_electronico");
        datos [7] = consulta.getString("fecha_nacimiento");
        datos [8] = consulta.getString("sangre");
        datos [9] = consulta.getString("id_sangre");
        tabla.addRow(datos);
        }

         cn.cerrar_conexion();     
     }catch(Exception ex){
         System.out.println(ex.getMessage());
     }
     return tabla; 
     }      
    

    @Override
    public int agregar(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query="INSERT INTO estudiantes(carne,nombres,apellidos,direccion,telefono,correo_electronico,fecha_nacimiento,id_sangre)VALUES(?,?,?,?,?,?,?,?);"; 
                cn.abrir_conexion();
                parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
                parametro.setString(1, this.getCarnet());
                parametro.setString(2, this.getNombres());
                parametro.setString(3, this.getApellidos());
                parametro.setString(4, this.getDireccion());
                parametro.setString(5, this.getTelefono());
                parametro.setString(6, this.getEmail());
                parametro.setString(7, this.getFecha_nacimiento());
                parametro.setInt(8, this.getId_carnet());
                
                retorno =parametro.executeUpdate();
                
                cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno= 0;
        }
    return retorno;    
    }
    
    
    @Override
    public int modificar(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query="update estudiantes set carne=?,nombres=?,apellidos=?,direccion=?,telefono=?,correo_electronico=?,fecha_nacimiento=?,id_sangre= ? where id_estudiantes = ?;";
                cn.abrir_conexion();
                parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
                parametro.setString(1, this.getCarnet());
                parametro.setString(2, this.getNombres());
                parametro.setString(3, this.getApellidos());
                parametro.setString(4, this.getDireccion());
                parametro.setString(5, this.getTelefono());
                parametro.setString(6, this.getEmail());
                parametro.setString(7, this.getFecha_nacimiento());
                parametro.setInt(8, this.getId_carnet());
                parametro.setInt(9, this.getId());
                retorno =parametro.executeUpdate();
                
                cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno= 0;
        }
    return retorno;    
    }
    
    
    @Override
    public int eliminar(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query="delete from estudiantes where id_estudiantes = ?;";
                cn.abrir_conexion();
                parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
                parametro.setInt(1, this.getId());
                retorno =parametro.executeUpdate();
                
                cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno= 0;
        }
    return retorno;    
    }
        
//No quitar llave ingresar codigo antes de aqui     
}