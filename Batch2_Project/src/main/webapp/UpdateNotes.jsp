<!-- Code Start here only when user login in page -->
<%@page import="java.util.*" %>
  <%@page import="com.DAO.PostDAO" %>
  <%@page import="com.User.Post" %>
  <%@page import="com.Db.DBConnect" %>
  <%@page import="com.User.UserDetails" %>


<%
  UserDetails user1=(UserDetails)session.getAttribute("userD");
  if(user1==null){
     response.sendRedirect("login.jsp");
     session.setAttribute("login-error","Please login First......!!!!");
  }
    
  %>
 <!-- Code End for only when user login in page -->
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<%@ include file="all_components/All_CDN.jsp" %>
</head>
<body>
    <%
     Integer noteid=Integer.parseInt(request.getParameter("note_id"));
     
		 PostDAO post=new PostDAO(DBConnect.getConn());
		 
		 Post p=post.getDataById(noteid);
    
    
    %>
    <div class="container-fluid">
      <%@include file="all_components/navbar.jsp" %>
      <h1 class=" text-center mt-5">Update  Notes</h1>
      <div class="container mb-5">
          <div class="row">
              <div class="col-md-12">
                       <form action="EditServlet"  method="post">
						  <div class="form-group">
		                    	<input type="hidden" name="noteid" value="<%=noteid %>"  class="form_control">
						  </div>
						  <div class="form-group">
						    <label for="">Enter Title</label>
						    <input type="text" name="title" class="form-control" value="<%=p.getTitle() %>>" aria-describedby="" placeholder="Enter text Your Title">
						  </div>
						  <div class="form-group">
						    <label for="" >Content</label>
						    <textarea rows="9" name="content" col=" 6" class="form-control" id="" placeholder="Enter Your Content"><%=p.getContnent() %></textarea>
						  </div>
						  <button type="submit" class="btn btn-primary">Update</button>
                   
                   </form>
              </div>
          </div>
      </div>
   </div>

<%@include file="all_components/footer.jsp" %>
</body>
</html>