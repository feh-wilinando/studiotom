package br.com.studiotom.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Properties;

/**
 * Created by Nando on 12/03/16.
 */
@Profile("live")
@Configuration
public class DataSourceLive implements DataBaseConfiguration{

    @Autowired
    Environment environment;

    @Bean
    @Override
    public DataSource dataSource() {
        try {
            URI uri = new URI(environment.getProperty("DATABASE_URL"));

            String jdbcUrl = "jdbc:postgresql://" + uri.getHost() + ":" + uri.getPort() + uri.getPath();
            String userName = uri.getUserInfo().split(":")[0];
            String password = uri.getUserInfo().split(":")[1];


            DriverManagerDataSource dataSource = new DriverManagerDataSource();
            dataSource.setDriverClassName("org.postgresql.Driver");
            dataSource.setUrl(jdbcUrl);
            dataSource.setUsername(userName);
            dataSource.setPassword(password);
            return dataSource;

        } catch (URISyntaxException e) {
            throw new RuntimeException(e);
        }




    }

    @Bean
    @Override
    public Properties aditionalProperties() {
        Properties properties = new Properties();

        properties.setProperty("hibernate.hbm2ddl.auto", "update");
        properties.setProperty("hibernate.show_sql", "true");
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");

        return properties;
    }
}
