import com.github.javafaker.Faker;
import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;

import java.sql.*;
import java.util.Random;

public class CriarPessoas {


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
            idCounter++;
        }

        System.out.println(idCounter);


        int idPessoa = idCounter + 1;
        char[] generos= new char[]{'M', 'F'};
        String genero;
        Random random = new Random();
        Faker faker = new Faker();
        String nome;
        long myDate;
        Date sqlDate;
        PreparedStatement pstmt = conn.prepareStatement ("Insert into Pessoa (idPessoa, nome, dataNascimento, genero) " +
                "Values ( ?, ?, ?, ?)");

        for (int i = 0; i < 10; i++) {
            //assign values
            idPessoa++;
            nome = faker.name().fullName();
            myDate = Date.parse((1 + random.nextInt(31)) + "/" +
                    (1 + random.nextInt(12)) + "/" + (random.nextInt(80) + 1940));
            sqlDate = new java.sql.Date(myDate);
            genero = String.valueOf(generos[random.nextInt(2)]);

            //set values
            pstmt.setInt(1, idPessoa);
            pstmt.setString(2, nome);
            pstmt.setDate(3, sqlDate);
            pstmt.setString(4, genero);

            //execute
            pstmt.execute();
        }

        conn.close();

    }
}


