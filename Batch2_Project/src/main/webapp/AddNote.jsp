<!-- Code Start here only when user login in page -->
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
<title>Add Notes</title>
<%@ include file="all_components/All_CDN.jsp" %>
</head>
<body>
   <div class="container-fluid">
      <%@include file="all_components/navbar.jsp" %>
      <h1 class=" text-center mt-5">Add Notes</h1>
      <div class="container mb-5">
          <div class="row">
              <div class="col-md-12">
                       <form action="AddNote"  method="post">
						  <div class="form-group">
						  <%
						    UserDetails us=(UserDetails)session.getAttribute("userD");
		                    if(us!=null){
		                    	%>
		                    	<input type="hidden" name="uid" value="<%=us.getId() %>" >
		                    	<%
		                    }
						  %>
						  </div>
						  <div class="form-group">
						    <label for="">Title</label>
						    <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="" placeholder="Enter text Your Title">
						  </div>
						  <div class="form-group">
						    <label for="" >Content</label>
						    <textarea rows="9" name="content" col=" 6" class="form-control" id="" placeholder="Enter Your Content"></textarea>
						  </div>
						  <button type="submit" class="btn btn-primary">Add Note</button>
                   
                   </form>
              </div>
          </div>
      </div>
   </div>

<%@include file="all_components/footer.jsp" %>
</body>
</html>