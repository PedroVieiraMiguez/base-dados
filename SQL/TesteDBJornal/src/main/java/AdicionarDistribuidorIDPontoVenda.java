import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;

import java.sql.*;

public class AdicionarDistribuidorIDPontoVenda {


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

        PreparedStatement pstmt = conn.prepareStatement ("ALTER TABLE PontoVenda " +
                "ADD distribuidorID INTEGER");


        pstmt.execute();

        PreparedStatement ptmt2 = conn.prepareStatement("ALTER TABLE PontoVenda " +
                "ADD CONSTRAINT fk_PontoVenda_distribuidorID FOREIGN KEY (distribuidorID) " +
                "REFERENCES Distribuidor (DistribuidorID)");

        ptmt2.execute();


        conn.close();

    }
}


