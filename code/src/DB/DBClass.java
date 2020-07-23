package DB;
//这是数据库连接模块
import java.sql.*;
public class DBClass {
    static String DBDRIVER= "com.mysql.jdbc.Driver";
    static String DBURL="jdbc:mysql://localhost:3306/db_jsp?characterEncoding=utf-8";
    static String DBUSER= "root";
    static String DBPASSWORD= "az192412";
    public Connection get_con(){
        Connection conn=null;
        try{
            Class.forName(DBDRIVER);
            conn=DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
        }catch (Exception e){
            System.out.println("数据库连接失败：" + e.getMessage());
        }
        return conn;
    }
}
