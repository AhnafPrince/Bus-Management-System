
package project;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author User
 */
public class DBHandler {
    Connection connect = null;
    Statement statement = null;
    ResultSet result = null;
    PreparedStatement pStatement = null;
    
    private int sz_insertion;
    
    public void setConnection(String name,String u, String p){
        
        try{
            
            
            String dbName = name;
            String user = u;
            String password =p;
            String url ="jdbc:mysql://localhost/"+dbName;
            
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.
                        getConnection(url, user, password);
            
            System.out.println("Successfully Connected..");
            
        }catch(Exception e){
            System.out.println("Problem in Connection..");
            e.printStackTrace();
        }
        
        
    }
    
    public ResultSet testQuery(String tableName){
        try{
            
            String query ="SELECT * FROM "+tableName;
            statement = connect.createStatement();
            result = statement.executeQuery(query);
            
            System.out.println("Query is successful");
            
        }catch(Exception e){
            System.out.println("Error in query..");
            e.printStackTrace();
        }
        return result;
    }
    
    
    
    public ResultSet searchQuery(String tableName, String colName, String colValue){
        try{
            
            String query = "SELECT * FROM "+tableName+" where "+colName+" = '"+colValue+"'";
            statement = connect.createStatement();
            result = statement.executeQuery(query);
            
            System.out.println("Query is successful");
            
        }catch(Exception e){
            System.out.println("Error in query..");
            e.printStackTrace();
        }
        return result;
    }
    
    public ResultSet searchVacantSeat(String tableName , String busID){
        try {
            
            String query = "select seat_no from ticket where bus_id = '"+busID+"' " ;
            statement = connect.createStatement();
            result =statement.executeQuery(query);
            
            System.out.println("Query is successful");
            
        } catch (Exception e) {
            System.out.println("Error in query..");
            e.printStackTrace();
        }
        return result; 
    }
    
    public ArrayList<String> tableName(){
        String catalogue = null;
        String schemaPattern = null;
        String tableNamePattern = null;
        String columnNamePattern = null;
        String[] types = null;
        ArrayList<String> tname = new ArrayList<String>();
        int count = 0;
        
        try{
            DatabaseMetaData databaseMetadata = connect.getMetaData();
            
            System.out.println("List Of Tables");
            result = databaseMetadata.getTables(catalogue, schemaPattern,
                     tableNamePattern, types);
                                  
            while(result.next()){
                tname.add(result.getString("TABLE_NAME"));
                //System.out.println(result.getString("TABLE_NAME"));
                count++;
            }
            System.out.println(count);
        }catch(Exception e){
            System.out.println("Error in query..");
        }
        
        return tname;        
    }
    
    public void deleteQuery(String tName){
        try{            
            String sql ="truncate table "+tName;
            statement = connect.createStatement();            
            int rowAffected = statement.executeUpdate(sql);
            
            System.out.println("All Delete successful");
            System.out.println("Row Affected " + rowAffected);
            
        }catch(Exception e){
            System.out.println("Error in deleting query..");
            e.printStackTrace();
        }
    }
    
    
    public void deleteRowQuery(String tName, String colName, String colVal){
        try{            
            String sql ="delete from "+tName+" where "+colName+" = '"+colVal+"'";
            statement = connect.createStatement();           
            int rowAffected = statement.executeUpdate(sql);
            
            System.out.println("Delete successful");
            System.out.println("Row Affected " + rowAffected);
            
        }catch(Exception e){
            System.out.println("Error in deleting query..");
            e.printStackTrace();
        }
    }
    
    public void addColQuery(String tName, String colName, String dType){
        try{            
            String sql ="alter table "+tName+" add "+colName+" "+dType;
            statement = connect.createStatement();            
            int rowAffected = statement.executeUpdate(sql);
            
            System.out.println("Delete column successfully");
            System.out.println("Row Affected " + rowAffected);
            
        }catch(Exception e){
            System.out.println("Error in deleting query..");
            e.printStackTrace();
        }
    }
    
    public void deleteColQuery(String tName, String colName){
        try{            
            String sql ="alter table "+tName+" drop column "+colName;
            statement = connect.createStatement();
            //result = statement.executeQuery(query);
            int rowAffected = statement.executeUpdate(sql);
            
            System.out.println("Delete column successfully");
            System.out.println("Row Affected " + rowAffected);
            
        }catch(Exception e){
            System.out.println("Error in deleting query..");
            e.printStackTrace();
        }
    }
    
    
    public void updateQuery(String tName, String col1Name, String col1Val, String col2Name, String col2Val){
        try{            
            String sql ="update "+tName+" set "+col2Name+" = '"+col2Val+"' where "
                         +col1Name+" = '"+col1Val+"'";
            
            statement = connect.createStatement();            
            int rowAffected = statement.executeUpdate(sql);
            
            System.out.println("Update successful");
            System.out.println("Row Affected " + rowAffected);
            
        }catch(Exception e){
            System.out.println("Error in updating query..");
            e.printStackTrace();
        }
    }
    
   
    
    public ArrayList<ArrayList<String>> getResult(ResultSet result){
        
        ArrayList<ArrayList<String>> records = new ArrayList<ArrayList<String>>();
        try{
            
            
            ArrayList<String> colName = new ArrayList<String>();
            for(int i = 1 ; i <= result.getMetaData().getColumnCount() ; i++){
                colName.add(result.getMetaData().getColumnName(i));
            }
            
            for(String cc : colName){
                //System.out.print(cc+" ");
            }
            //System.out.println("");
            
            while(result.next()){
                ArrayList<String> r = new ArrayList<String>();
                for(String cc : colName){
                    r.add(result.getString(cc));
                }
                records.add(r);
            }
                                   
        }catch(Exception e){
            e.printStackTrace();
        }       
        return records;
    }
    
    
    public ArrayList<String> columnName(ResultSet result){
           ArrayList<String> colName = new ArrayList<String>();   
           try{                        
                for(int i = 1 ; i <= result.getMetaData().getColumnCount() ; i++){
                colName.add(result.getMetaData().getColumnName(i));
            }            
            for(String cc : colName){
                //System.out.print(cc+" ");
            }
            //System.out.println("");                                                          
        }catch(Exception e){
            e.printStackTrace();
        }       
        return colName;
    }              
    
    public void insertData(String table_name, String[] val) {
        try {
            String query = "INSERT INTO " + table_name + " VALUES(";

            sz_insertion = val.length - 1;
             
            for (int i = 1; i <= sz_insertion; i++) {
                query += "?";
                if (i < sz_insertion) {
                    query += ",";
                }
            }
            query += ")";
            System.out.println(query);

            pStatement = connect.prepareStatement(query);

            for (int i = 0; i < sz_insertion; i++) {
                pStatement.setString(i + 1, val[i]);
            }

            pStatement.executeUpdate();

            JOptionPane.showMessageDialog(null, "Insertion Successfull");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            e.printStackTrace();
        }
    }
    
}

