<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<title>EM Project</title>
</head>
<body>
	<div class="d-flex justify-content-center align-items-center vh-100"
		style="background-color: #eee">
		<div class="w-25 border rounded-3 p-4 shadow-lg  font-monospace"
			style="background-color: white">
			<form action="register" method="post">
				<h1 class="fs-3 fw-bold text-center">REGISTER</h1>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">Name</label>
					<input type="text" name="name" class="form-control fw-light"
						id="exampleFormControlInput1" placeholder="John Doe" required>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">Email
						Address</label> <input type="email" name="email"
						class="form-control fw-light" id="exampleFormControlInput1"
						placeholder="name@example.com" required>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">Phone
						Number</label> <input type="text" name="phone"
						class="form-control fw-light" id="exampleFormControlInput1"
						placeholder="91********23" required>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">Password</label>
					<input type="password" name="password"
						class="form-control fw-light" id="exampleFormControlInput1"
						placeholder="*************" required>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary mb-2">Register</button>
					<br>
					<a style="font-size: 14px" class="link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover"
						href="login">Already Registered? Go to Login</a>
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