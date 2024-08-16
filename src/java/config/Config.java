package config;
//confguration de la base de donnée
public class Config {
	//declaration constant==>static final
	public static final String driver="com.mysql.jdbc.Driver";//Ex."oracle.jdbc.OracleDriver"; 
	public static final String url="jdbc:mysql://localhost/evenement";
	//Ex:"jdbc:oracle:thin:@192.168.0.1:1521:DATA 10G"==>port du base du donnée :1521
	public static final String user="root";										
	public static final String password="";
}
