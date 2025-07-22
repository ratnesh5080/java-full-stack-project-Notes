<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title class="text-light">Register Page</title>
<%@ include file="all_components/All_CDN.jsp" %>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container-fluid mt-4 mb-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header">
						<h1>Register</h1>
					</div>

					<%
					String regMsg = (String) session.getAttribute("reg-sucess");

					if (regMsg != null) {
					%>

					<div class="alert alert-success" role="alert">
						<%=regMsg%>
						<a href="login.jsp">login</a>
					</div>
					<%
					session.removeAttribute("reg-sucess");
					}
					%>

					<%
					String failedMsg = (String) session.getAttribute("reg-failed");

					if (failedMsg != null) {
					%>

					<div class="alert alert-danger" role="alert">
						<%=failedMsg%>
						<a href="login.jsp">login</a>
					</div>
					<%
					session.removeAttribute("reg-failed");
					}
					%>
					<div class="card-body">
						<form action="UserServlet" method="post">
							<div class="form-group">
								<label for="exampleInputName">Name</label> <input type="name"
									class="form-control" id="exampleInputNmae" aria-describedby=""
									placeholder="Enter name" name="fname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="uemail">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="upassword" class="form-control"
									id="exampleInputPassword1" placeholder="Enter Password">
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="all_components/footer.jsp"%>
</body>
</html>