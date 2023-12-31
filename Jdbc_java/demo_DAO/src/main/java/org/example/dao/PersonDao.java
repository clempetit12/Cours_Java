package org.example.dao;

import lombok.Data;
import org.example.models.Person;


import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class PersonDao extends BaseDAO<Person> {

    public PersonDao(Connection connection) {
        super(connection);
    }

    @Override
    public boolean save(Person element) throws SQLException {
        request = "INSERT INTO persons (first_name, last_name) VALUES (?, ?) ";
        statement = _connection.prepareStatement(request, Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, element.getFirstName());
        statement.setString(2, element.getLastName());
        int nbRows = statement.executeUpdate();
        resultSet = statement.getGeneratedKeys();
        if(resultSet.next()){
            element.setId(resultSet.getInt(1));
        }
        return nbRows>0;
    }

    @Override
    public boolean update(Person element) throws SQLException {
        request = "UPDATE persons SET first_name = ?, last_name = ? WHERE id = ?";
        statement = _connection.prepareStatement(request);
        statement.setString(1, element.getFirstName());
        statement.setString(2, element.getLastName());
        statement.setInt(3, element.getId());
        int nbRows = statement.executeUpdate();
        return nbRows>0;
    }

    @Override
    public boolean delete(Person element) throws SQLException {
        request = "DELETE FROM persons WHERE id = ?";
        statement = _connection.prepareStatement(request);
        statement.setInt(1, element.getId());
        int nbRows = statement.executeUpdate();
        return nbRows>0;
    }

    @Override
    public Person get(int id) throws SQLException {
        Person person = null;
        request = "SELECT * FROM persons WHERE id = ?";
        statement = _connection.prepareStatement(request);
        statement.setInt(1, id);
        resultSet = statement.executeQuery();
        if(resultSet.next()){
          person = new Person(resultSet.getInt("id"),
                  resultSet.getString("first_name"),
                  resultSet.getString("last_name") );
        }
        return person;
    }

    @Override
    public List<Person> get() throws SQLException {
        List<Person> results = new ArrayList<>();
        request = "SELECT * FROM persons ";
        statement = _connection.prepareStatement(request);
        resultSet = statement.executeQuery();
        while (resultSet.next()){
            Person person = new Person(resultSet.getInt("id"),
                    resultSet.getString("first_name"),
                    resultSet.getString("last_name") );
            results.add(person);
        }
        return results;
    }
}
