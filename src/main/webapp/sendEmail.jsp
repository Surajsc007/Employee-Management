<%@page import="com.ty.EMProject.entity.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<title>Send Email</title>
</head>
<body>
	<div
		class="d-flex justify-content-center align-items-center font-monospace vh-100 flex-column"
		style="background-color: #eee">
		<%
		Employee employee = (Employee) request.getAttribute("emp");
		%>
		<div class="w-25 border rounded-3 p-4 shadow-lg font-monospace my-3"
			style="background-color: white">
			<form method="post" action="/sendemail" enctype="multipart/form-data">  <h1 class="fs-3 fw-bold text-center">
					SEND EMAIL
				</h1>


				<div class="mb-3">
					<label for="toInput" class="form-label">To</label> <input
						type="email" name="to" class="form-control fw-light"
						id="toInput" placeholder="Recipient Email"
						value="<%=employee != null ? employee.getEmail() : ""%>" readonly>
				</div>
				<div class="mb-3">
					<label for="subjectInput" class="form-label">Subject</label> <input
						type="text" name="subject" class="form-control fw-light"
						id="subjectInput" required>
				</div>
				<div class="mb-3">
					<label for="bodyInput" class="form-label">Body</label> <textarea
						name="body" class="form-control fw-light" id="bodyInput" rows="5"
						required></textarea>
				</div>
				<div class="mb-3">
					<label for="attachmentInput" class="form-label">Attachment(Optional)</label>
					<input type="file" name="attachment" class="form-control fw-light" id="attachmentInput">
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary mb-2">Send Email</button>
					<br> <a style="font-size: 14px"
						class="link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover"
						href="home">Go to Home</a>
				</div>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>