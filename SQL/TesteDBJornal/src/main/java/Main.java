import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;

import java.sql.*;

public class Main {


    public static void main(String[] args) throws SQLException {
        OracleDataSource ods = new OracleDataSource();
        String url = "jdbc:oracle:thin:@vsrvbd1.dei.isep.ipp.pt:1521/pdborcl";
        ods.setURL(url);
        ods.setUser("UPSKILL_BD_TURMA1_14");
        ods.setPassword("qwerty");
        Connection conn = ods.getConnection();

        Statement stmt = conn.createStatement();

        ResultSet rset = stmt.executeQuery("SELECT * FROM Jornal");


        while (rset.next()) {
            System.out.println(rset.getInt("idJornal"));
            System.out.println(rset.getInt("idMorada"));
            System.out.println(rset.getString("designacao"));
            System.out.println(rset.getString("dataFundacao"));
        }

        ResultSet rset2 = stmt.executeQuery("SELECT max(precoVenda), min(precoVenda), idPontoVenda " +
                        "FROM PontoVenda natural join EdicaoJornal group by idPontoVenda");

        while (rset2.next()) {
            System.out.println(rset2.getString(1));
            System.out.println(rset2.getFloat(2));
            System.out.println(rset2.getInt(3));
        }

        ResultSet rset3 = stmt.executeQuery("Select * FROM Pessoa");

        while (rset3.next()) {
            System.out.println(rset3.getString(1));
            System.out.println(rset3.getString(2));
            System.out.println(rset3.getString(3));
            System.out.println(rset3.getString(4));
        }

        String nome = "Roger Rogério";
        int id = 1;
        int res = stmt.executeUpdate ("UPDATE Pessoa SET nome ='" + nome + "' WHERE idPessoa = " + id);

        ResultSet rset4 = stmt.executeQuery("Select * FROM Pessoa");

        while (rset4.next()) {
            System.out.println(rset4.getString(1));
            System.out.println(rset4.getString(2));
            System.out.println(rset4.getString(3));
            System.out.println(rset4.getString(4));
        }

        ResultSet rset5 = stmt.executeQuery("Select * FROM Pessoa");

        while (rset5.next()) {
            System.out.println(rset5.getString(1));
            System.out.println(rset5.getString(2));
            System.out.println(rset5.getString(3));
            System.out.println(rset5.getString(4));
        }

        String nome2 = "Rogéria Rogeriana";
        int id2 = 2;

        PreparedStatement pstmt = conn.prepareStatement ("UPDATE Pessoa SET nome = ? WHERE idPessoa = ?");

        pstmt.setString(1, nome2);
        pstmt.setInt(2, id2);

        pstmt.execute();

        ResultSet rset6 = stmt.executeQuery("Select * FROM Pessoa");

        while (rset6.next()) {
            System.out.println(rset6.getString(1));
            System.out.println(rset6.getString(2));
            System.out.println(rset6.getString(3));
            System.out.println(rset6.getString(4));
        }

        ResultSet rset7 = stmt.executeQuery("Select * FROM Pessoa");

        while (rset7.next()) {
            System.out.println(rset7.getString(1));
            System.out.println(rset7.getString(2));
            System.out.println(rset7.getString(3));
            System.out.println(rset7.getString(4));
        }

        PreparedStatement pstmtDelete = conn.prepareStatement("Delete from Pessoa where idPessoa = 5 OR " +
                "idPessoa = 6 OR idPessoa = 7");

        pstmtDelete.execute();

        int id3 = 5;
        String nome3 = "Paulo Polarizante";
        long myDate = Date.parse("01/01/2009");
        Date sqlDate = new java.sql.Date(myDate);
        String genero = "M";

        PreparedStatement pstmt2 = conn.prepareStatement ("Insert into Pessoa (idPessoa, nome, dataNascimento, genero) " +
                "Values ( ?, ?, ?, ?)");

        pstmt2.setInt(1, id3);
        pstmt2.setString(2, nome3);
        pstmt2.setDate(3, sqlDate);
        pstmt2.setString(4, genero);

        pstmt2.execute();

        ResultSet rset8 = stmt.executeQuery("Select * FROM Pessoa");

        while (rset8.next()) {
            System.out.println(rset8.getString(1));
            System.out.println(rset8.getString(2));
            System.out.println(rset8.getString(3));
            System.out.println(rset8.getString(4));
        }
    }
}
