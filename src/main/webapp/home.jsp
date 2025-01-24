<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.ty.EMProject.entity.Employee"%>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<title>Home Page</title>

</head>
<body>
	<div
		class="d-flex justify-content-center align-items-center font-monospace vh-100 flex-column"
		style="background-color: #eee">
		<!-- Toast Notification -->
		<div class="toast-container position-fixed bottom-0 end-0 p-3">
			<div class="toast" id="loginToast" role="alert" aria-live="assertive"
				aria-atomic="true" style="background-color: #198754; color: white;">
				<div
					class="toast-body d-flex justify-content-between align-items-center">
					<span>${msg != null ? msg : ""}</span>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="toast" aria-label="Close"></button>
				</div>
			</div>
		</div>

		<!-- Employee Table -->

		<div
			class="w-50 border rounded-3 p-4 shadow-lg font-monospace my-3 w-75"
			style="background-color: white">

			<%
			List<Employee> employees = (List<Employee>) request.getAttribute("emps");
			%>
			<h1
				class="fs-3 fw-bold text-center border border-black rounded p-2 bg-dark text-white">EMPLOYEE
				DETAILS</h1>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">EMPLOYEE ID</th>
						<th scope="col">NAME</th>
						<th scope="col">EMAIL ADDRESS</th>
						<th scope="col">PHONE NUMBER</th>
						<th scope="col">UPDATE</th>
						<th scope="col">DELETE</th>
						<th scope="col">SEND EMAIL</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Employee employee : employees) {
					%>
					<tr>
						<th scope="row"><%=employee.getEid()%></th>
						<td><%=employee.getName()%></td>
						<td><%=employee.getEmail()%></td>
						<td><%=employee.getPhone()%></td>
						<td><a
							href="/edit<%=request.getContextPath()%>?eid=<%=employee.getEid()%>"
							class="btn btn-outline-primary btn-sm" role="button">Update</a></td>
						<td><a
							href="/delete<%=request.getContextPath()%>?eid=<%=employee.getEid()%>"
							class="btn btn-outline-danger btn-sm" role="button">Delete</a></td>
						<td><a
							href="/email<%=request.getContextPath()%>?eid=<%=employee.getEid()%>"
							class="btn btn-outline-dark btn-sm"
							role="button"> Send Email</a></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<a href="add" class="btn btn-success btn-sm d-block w-25 mx-auto"
				role="button">ADD EMPLOYEE</a>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script>
		// Display toast if a message exists
		const toastMessage = '<%=request.getAttribute("msg") != null ? request.getAttribute("msg") : ""%>
		';
		if (toastMessage.trim()) {
			const loginToast = new bootstrap.Toast(document
					.getElementById('loginToast'));
			loginToast.show();
		}
	</script>
</body>
</html>
