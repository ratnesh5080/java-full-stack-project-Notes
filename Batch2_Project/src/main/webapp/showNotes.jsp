<!-- Code Start here only when user login in page -->


<%
  UserDetails user1=(UserDetails)session.getAttribute("userD");
  if(user1==null){
     response.sendRedirect("login.jsp");
     session.setAttribute("login-error","Please login First......!!!!");
  }
    
  %>
  <%@page import="java.util.*" %>
  <%@page import="com.DAO.PostDAO" %>
  <%@page import="com.User.Post" %>
  <%@page import="com.Db.DBConnect" %>
  <%@page import="com.User.UserDetails" %>
 <!-- Code End for only when user login in page -->
 
  <%@ include file="all_components/All_CDN.jsp" %>

<%@include file="all_components/navbar.jsp" %>

<div class="container">

    
	<h1 class="text-center">Show Notes Pages</h1>
	
	<%
	  if(user1!=null){
		  PostDAO ob=new PostDAO(DBConnect.getConn());
		  List<Post> post=ob.getData(user1.getId());
		  int count=0;
		  for(Post po:post){
			  if(count%3==0){
		%>
	    <div class="row mt-4 d-print-flex">
		<% 
	  }
	%>
       <div class="col-md-4 ">
           <div class="card mt-3 w-100 h-100 mb-3">
			  <div class="card-body pb-2">
			         <p>
			           <b>Title: </b><%=po.getTitle() %>
			         </p>
			         <p>
			           <b>Content:</b><%=po.getContnent() %>
			         </p>
			         <p>
			           <b>Upload By:</b><%=user1.getName() %>
			         </p>
			         <p>
			           <b>Upload Date:</b><%=po.getPdate() %>
			         </p>
			  </div>
			  <div class=" ">
			    <a href="DeleteServlet?note_id=<%=po.getId() %>" class="mr-3">Delete</a>
			    <a href="UpdateNotes.jsp?note_id=<%=po.getId() %>">Edit</a>
			  </div>
		</div>
       
       </div>
    </div>
<%
}
}
%>
</div>
<%@include file="all_components/footer.jsp" %>