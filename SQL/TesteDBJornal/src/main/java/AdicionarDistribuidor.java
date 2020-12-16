import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;

import java.sql.*;

public class AdicionarDistribuidor {


    public static void main(String[] args) throws SQLException {
        OracleDataSource ods = new OracleDataSource();
        String url = "jdbc:oracle:thin:@vsrvbd1.dei.isep.ipp.pt:1521/pdborcl";
        ods.setURL(url);
        ods.setUser("UPSKILL_BD_TURMA1_14");
        ods.setPassword("qwerty");
        Connection conn = ods.getConnection();

        Statement stmt = conn.createStatement();

        //PreparedStatement pstmt2 = conn.prepareStatement ("DROP TABLE Distribuidor CASCADE CONSTRAINTS PURGE");

        //pstmt2.execute();

        //PreparedStatement pstmt = conn.prepareStatement ("CREATE TABLE Distribuidor (" +
        /*        "distribuidorID INTEGER PRIMARY KEY, " +
                "idPessoa INTEGER " +
                "CONSTRAINT uk_Distribuidor_idPessoa UNIQUE " +
                "CONSTRAINT nn_Distribuidor_idPessoa NOT NULL, " +
                "dataContrato DATE " +
                "CONSTRAINT nn_Distribuidor_DataContrato NOT NULL " +
                "CONSTRAINT ck_Distribuidor_DataContrato CHECK ( dataContrato >= TO_DATE('01-01-1940', 'mm-dd-yyyy')))");

        //pstmt.execute();*/

        PreparedStatement ptmt2 = conn.prepareStatement("ALTER TABLE Distribuidor " +
                "ADD CONSTRAINT fk_Distribuidor_idPessoa FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa)");

        ptmt2.execute();

        conn.close();

    }
}


