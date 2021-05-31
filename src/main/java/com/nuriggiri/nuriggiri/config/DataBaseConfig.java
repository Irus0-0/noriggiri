package com.nuriggiri.nuriggiri.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
@ComponentScan(basePackages = "com.nuriggiri.nuriggiri")
public class DataBaseConfig {

    //커넥션 풀 및 연결정보 설정
    @Bean
    public DataSource dataSource() {
        HikariConfig config = new HikariConfig();
        config.setDriverClassName("oracle.jdbc.driver.OracleDriver");
//        config.setJdbcUrl("jdbc:oracle:thin:@192.168.1.67:1521:xe");
        config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
        config.setUsername("java_web2");
        config.setPassword("202104");

        return new HikariDataSource(config);
    }
}

