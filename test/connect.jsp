<%@ page import = "java.sql.*" %>
<%
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String gender = request.getParameter("gender");

try{
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "goodluck");

  PreparedStatement ps = conn.prepareStatement("insert into registration(firstname, lastname, gender) values(?, ?, ?)");

  ps.setString(1,firstname);
  ps.setString(2,lastname);
  ps.setString(3,gender);

  int x = ps.executeUpdate();
  if(x>0){
    out.println("Registration succssesfull!");
  } else{
    out.println("Registration failed!");
  }
} catch(Exception e){
  out.println(e);
}
%>
