<%@page import="com.User.UserDetails" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#">E-Notes</a>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="AddNote.jsp">Add Notes</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="showNotes.jsp">Show Notes</a>
      </li>  
    </ul>
    <%
       UserDetails user=(UserDetails)session.getAttribute("userD");
       if(user!=null){
    %>
      <a class="btn btn-outline-success my-2 my-sm-0 mr-2" data-toggle="modal" data-target="#exampleModal" type="submit" href="#">
      <%=user.getName()%>
      </a>
      <a class="btn btn-outline-success my-2 my-sm-0" type="submit" href="logoutServlet">Logout</a>
      
      <!-- Button trigger modal -->
       

<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					   <div class="container text-center">
					      <i class="fas fa-user fa-3x"></i>
					            <h5></h5>
					            <table class="table">
					               <tbody>
					                 <tr>
					                   <th>User Id</th>
					                   <td><%=user.getId()%></td>
					                 </tr>
					                 <tr>
					                   <th>Full Name</th>
					                   <td><%=user.getName()%></td>
					                 </tr>
					                 <tr>
					                   <th>Email Id</th>
					                   <td><%=user.getEmail()%></td>
					                 </tr>
					               </tbody>
					            </table>
					         <div>
					            <button type="button" class="btn btn-primary"
							      data-dismiss="modal">Close</button>
					         </div>
					   </div>
					</div>
					
				</div>
			</div>
		</div>




		<%
       }else{
      %>
     <form class="form-inline my-2 my-lg-0">
      <a class="btn btn-outline-success my-2 my-sm-0 mr-2" type="submit" href="login.jsp">Login</a>
      <a class="btn btn-outline-success my-2 my-sm-0" type="submit" href="register.jsp">Register</a>
    </form>
    <% } %>
  </div>
</nav>