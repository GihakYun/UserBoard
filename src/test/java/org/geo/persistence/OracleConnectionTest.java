package org.geo.persistence;

import static org.junit.Assert.fail;

import java.lang.System.Logger;
import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class OracleConnectionTest {
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@BoardDB_medium?TNS_ADMIN=C:/Users/adad0/oracle_key";
	
	private static final String USER = "admin";
	private static final String PW = "Asd7144084!@";
	
	
    org.slf4j.Logger logger = LoggerFactory.getLogger(OracleConnectionTest.class);

	
	public void testConnection() throws Exception{
		Class.forName(DRIVER);
		
		try(Connection conn = DriverManager.getConnection(URL, USER, PW)){
			logger.info(conn.toString());
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
    
	
}
