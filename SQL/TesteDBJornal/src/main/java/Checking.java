import com.github.javafaker.Faker;
import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;

import java.sql.*;
import java.util.Random;

public class Checking {


    public static void main(String[] args) throws SQLException {
        OracleDataSource ods = new OracleDataSource();
        String url = "jdbc:oracle:thin:@vsrvbd1.dei.isep.ipp.pt:1521/pdborcl";
        ods.setURL(url);
        ods.setUser("UPSKILL_BD_TURMA1_14");
        ods.setPassword("qwerty");
        Connection conn = ods.getConnection();

        Statement stmt = conn.createStatement();

        ResultSet rset = stmt.executeQuery("SELECT * FROM Pessoa");
        int idCounter = 0;
        while(rset.next()) {
            System.out.println(rset.getString(1));
            System.out.println(rset.getString(2));
            System.out.println(rset.getString(3));
            System.out.println(rset.getString(4));
        }

        System.out.println(idCounter);


        conn.close();

    }
}


