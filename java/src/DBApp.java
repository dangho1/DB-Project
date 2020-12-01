import java.sql.*;
import java.util.Scanner;
 
public class DBApp {
 
    public static void main(String[] args) {
                try {                                               
                    Class.forName("com.mysql.jdbc.Driver");      
                                           
                } catch(Exception e) {
                	System.out.print(e);
                	return;}                       
        String group_number="70";
        String username = "ht20_2_group_70";
        String password = "pwd_70";
        PreparedStatement p = null;
                Connection con = null;
 
        Scanner sc = new Scanner(System.in);


        try {
			con = DriverManager.getConnection("jdbc:mysql://localhost",username,password);
			String stmt0 = "use ht20_2_hotels_group_70";
            p = con.prepareStatement(stmt0); 
            p.clearParameters();
			ResultSet rs = p.executeQuery();
			
			
			
			
			
			//Example query
			String name0 = "Golden Nugget";            
			String stmt1 = "SELECT EANHotelID, Name FROM Property WHERE Name = ?";
			p = con.prepareStatement(stmt1);        
			p.clearParameters();
            p.setString(1, name0);  // this checks the input for possible injections
                        
			rs = p.executeQuery();

			System.out.println("EANHotelID\t Name");
			while (rs.next()) {
				int EANHotelID = rs.getInt("EANHotelID");
				String name = rs.getString("Name");
				System.out.println(EANHotelID + "\t\t " + name);
			}
			
                        
			System.out.println();
                         
        } catch (Exception e) {         
            e.printStackTrace();
        }
                finally {               
                    if(p != null){ try{ p.close(); } catch(SQLException sqlEx){} }        
                    if(con != null){ try{ con.close(); } catch(SQLException sqlEx){} }  
                    sc.close();
        }                                 
    }
}
