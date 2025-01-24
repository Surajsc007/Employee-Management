<!DOCTYPE html>
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
		<div class="w-25 border rounded-3 p-4 shadow-lg font-monospace my-3"
			style="background-color: white">
			<form action="add" method="post">
				<h1 class="fs-3 fw-bold text-center">ADD EMPLOYEE</h1>
				<div class="mb-3">
					<label for="emailInput" class="form-label">Name</label> <input
						type="text" name="name" class="form-control fw-light"
						id="emailInput" placeholder="name@example.com">
				</div>
				<div class="mb-3">
					<label for="emailInput" class="form-label">Email Address</label> <input
						type="email" name="email" class="form-control fw-light"
						id="emailInput" placeholder="name@example.com">
				</div>
				<div class="mb-3">
					<label for="emailInput" class="form-label">Phone</label> <input
						type="text" name="phone" class="form-control fw-light"
						id="emailInput" placeholder="name@example.com">
				</div>
				<div class="mb-3">
					<label for="passwordInput" class="form-label">Password</label> <input
						type="password" name="password" class="form-control fw-light"
						id="passwordInput" placeholder="*************">
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary mb-2">Add</button>
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