package demo_oracle_jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TesteDBConnectionHandler {

    public static void main(String[] args) {
        
        DBConnectionHandler dbConnHandler = null;
        
        try {
            String jdbcUrl = "jdbc:oracle:thin:@vsrvbd1.dei.isep.ipp.pt:1521/pdborcl";
                   
            String username = "UPSKILL_BD_TURMA1_14";
            String password = "qwerty";
            
            dbConnHandler = new DBConnectionHandler(jdbcUrl, username, password);
            
            System.out.println("\nEstabelecer a ligação à BD...");
            dbConnHandler.openConnection();
           
            System.out.println("\t... Ligação obtida.");

            dbConnHandler.insertIntoDistribuidor(1, 5, "06/07/2009");
            dbConnHandler.insertIntoDistribuidor(2, 7, "11/09/2000");
            dbConnHandler.insertIntoDistribuidor(3, 8, "23/11/2004");
            dbConnHandler.insertIntoDistribuidor(4, 9, "30/04/2012");
            dbConnHandler.insertIntoDistribuidor(5, 10, "19/01/1999");

            //dbConnHandler.deleteFromDistribuidorWithID(1);

            ResultSet rSet = dbConnHandler.selectAllFromTable("Distribuidor");

            while(rSet.next()) {
                System.out.println(rSet.getString(1));
                System.out.println(rSet.getString(2));
                System.out.println(rSet.getString(3));
            }


        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            String mensagem = dbConnHandler.closeAll();
            if (!mensagem.isEmpty())
                System.out.println(mensagem);
            System.out.println("\nTerminada a ligação à BD.");
            dbConnHandler.closeAll();
        }
        
    }

}
