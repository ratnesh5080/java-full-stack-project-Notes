<!-- Code Start here only when user login in page -->
<%
  UserDetails user1=(UserDetails)session.getAttribute("userD");
  if(user1==null){
     response.sendRedirect("login.jsp");
     session.setAttribute("login-error","Please login First......!!!!");
  }
    
  %>
 <!-- Code End for only when user login in page -->

<%@ include file="all_components/All_CDN.jsp" %>

<%@include file="all_components/navbar.jsp" %>


<div class="container-fluid p-0">
  <div class="card py-5">
      <div class="card-body text-center">
         <img src="https://cdn1.iconfinder.com/data/icons/notes-and-tasks/24/Clipboard-Pencil-512.png" class="img-fluid mx-auto" style="max-width:300px">
           <h1 >Start your notes</h1>
           <a href="Addnotes.jsp" class="btn btn-outline-primary">Start Home</a>
      </div>
  </div>
</div>

<%@include file="all_components/footer.jsp" %>
