/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.User;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import pe.utils.DBUtils;

/**
 *
 * @author Norah
 */
public class UserDAO implements Serializable {

    private List<UserDTO> accounts;

    public List<UserDTO> getAccounts() {
        return accounts;
    }

    public UserDTO checkLogin(String username, String password) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {

                String sql = "Select name "
                        + "From tblUser "
                        + "Where username = ? "
                        + "And password = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);

                rs = stm.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    result = new UserDTO(username, name, password);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }
}
