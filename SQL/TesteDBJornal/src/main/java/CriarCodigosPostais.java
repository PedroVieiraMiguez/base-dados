import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;

import java.sql.*;
import java.util.Random;

public class CriarCodigosPostais {


    public static void main(String[] args) throws SQLException {
        OracleDataSource ods = new OracleDataSource();
        String url = "jdbc:oracle:thin:@vsrvbd1.dei.isep.ipp.pt:1521/pdborcl";
        ods.setURL(url);
        ods.setUser("UPSKILL_BD_TURMA1_14");
        ods.setPassword("qwerty");
        Connection conn = ods.getConnection();

        Statement stmt = conn.createStatement();

        char[] localidades = new char[]{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'};
        Random random = new Random();
        String codigoPostal;


        PreparedStatement pstmt = conn.prepareStatement ("Insert into CodigoPostal (nrCodigoPostal, localidade) " +
                "Values ( ?, ?)");

        for (char localidade : localidades) {
            codigoPostal = random.nextInt(9999) + "-" + random.nextInt(999);
            pstmt.setString(1, codigoPostal);
            pstmt.setString(2, String.valueOf(localidade));
            pstmt.execute();
        }

        conn.close();

    }
}


