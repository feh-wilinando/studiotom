package br.com.studiotom.configuration;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * Created by Nando on 12/03/16.
 */
public interface DataBaseConfiguration {

    DataSource dataSource();
    Properties aditionalProperties();
}
