package org.iotc.observer.forms.sql;

import java.io.IOException;
import java.sql.Connection;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisSqlSessionFactory {
	private static SqlSessionFactory sqlSessionFactory;
	public static SqlSessionFactory getSqlSessionFactory() {
		if(sqlSessionFactory==null) {
			try {
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(
						Resources.getResourceAsStream("org/iotc/observer/sql/mybatis/mybatis-config.xml"));
			} catch (IOException e) {
				return null;
				
			}
		}
		return sqlSessionFactory;
	}
	
	public static Connection getConnection() {
		getSqlSessionFactory();
		if (sqlSessionFactory != null) {
			return sqlSessionFactory.openSession().getConnection();
		}
		return null;
	}

}
