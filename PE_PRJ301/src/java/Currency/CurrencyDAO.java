package Currency;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import pe.utils.DBUtils;
// Import the DBUtils class if it's used for database connection
// import pe.utils.DBUtils; 

/**
 *
 * @author Norah
 */
public class CurrencyDAO {

    private List<CurrencyDTO> currencies;

    public List<CurrencyDTO> getCurrencies() {
        return currencies;
    }

    public void searchCurrencies(String name, String code) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            // 1. Get connection
            con = DBUtils.getConnection();
            if (con != null) {
                // 2. Create SQL String with dynamic parameters for code and name (if provided)
                StringBuilder sql = new StringBuilder("SELECT * FROM tblCurrency WHERE 1=1"); // Base query
                if (code != null && !code.isEmpty()) {
                    sql.append(" AND code like ?"); // Add condition for code if provided
                }
                if (name != null && !name.isEmpty()) {
                    sql.append(" AND name LIKE ?"); // Add condition for name (like search)
                }
                String preparedSql = sql.toString();

                // 3. Create PreparedStatement object
                stm = con.prepareStatement(preparedSql);

                // 4. Set parameters (if any)
                int parameterIndex = 1;
                if (code != null && !code.isEmpty()) {
                    stm.setString(parameterIndex++, "%" + code + "%");
                }
                if (name != null && !name.isEmpty()) {
                    stm.setString(parameterIndex++, "%" + name + "%"); // Add wildcards for like search
                }

                // 5. Execute query
                rs = stm.executeQuery();
                while (rs.next()) {
                    String des = rs.getString("description");
                    double rate = rs.getDouble("rate");
                    String cCode = rs.getString("code");
                    String cName = rs.getString("name");

                    CurrencyDTO currency = new CurrencyDTO(cCode, cName, des, rate);
                    System.out.println(currency.toString());
                    // Set currency properties from result set (e.g., currency.setCode(rs.getString("code")); etc.)
                    if (this.currencies == null) {
                        this.currencies = new ArrayList<>();
                    }//accounts have not existed
                    this.currencies.add(currency);
                }
            }
        } finally {
            // Close resources
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
    }

    public boolean updateRate(String code, String newName, String newDes, String newRate) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;

        try {
            // 1. Get connection
            con = DBUtils.getConnection();

            // 2. Create SQL string with isAdmin parameter
            String sql = "Update tblCurrency "
                    + "Set name = ? , description = ? , rate = ? "
                    + "Where code = ?";

            stm = con.prepareStatement(sql);
            stm.setString(1, newName);
            stm.setString(2, newDes);
            stm.setString(3, newRate);
            stm.setString(4, code);

            // 4. Execute update
            int affectedRows = stm.executeUpdate();
            System.out.println("row affected: " + affectedRows);

            // 5. Process result
            if (affectedRows > 0) {
                result = true;
            }

        } finally {
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
