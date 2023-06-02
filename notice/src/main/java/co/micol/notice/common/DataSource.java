package co.micol.notice.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DataSource {
//	private static DataSource dataSource;
//	private String driver = "oracle.jdbc.driver.OracleDriver";
//	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
//	private String user = "songi";
//	private String password = "1234";
//	private Connection conn;
//	
//	
//	private DataSource() {		
//	}
//	
//	public static DataSource getInstance() {
//		dataSource = new DataSource();
//		return dataSource;
//	}
//	
//	public Connection getConnection() {
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url,user,password);
//		}catch(ClassNotFoundException | SQLException e) {
//			e.printStackTrace();
//		}
//		return conn;
//	}
	
	
	//Mybatis로 연결하기
	private static SqlSessionFactory sqlSessionFactory;
	
	private DataSource() {		
	}
	
	public static SqlSessionFactory getInstance() {
		String resource = "mybatis/mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlSessionFactory;
	}




}
