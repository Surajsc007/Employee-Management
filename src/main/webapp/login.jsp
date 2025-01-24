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
<title>Login Page</title>
</head>
<body>
	<div
		class="d-flex justify-content-center align-items-center vh-100 flex-column"
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

		<!-- Login Form -->
		<div class="w-25 border rounded-3 p-4 shadow-lg font-monospace my-3"
			style="background-color: white">
			<form action="login" method="post">
				<h1 class="fs-3 fw-bold text-center">LOGIN</h1>
				<div class="mb-3">
					<label for="emailInput" class="form-label">Email Address</label> <input
						type="email" name="email" class="form-control fw-light"
						id="emailInput" placeholder="name@example.com">
				</div>
				<div class="mb-3">
					<label for="passwordInput" class="form-label">Password</label> <input
						type="password" name="password" class="form-control fw-light"
						id="passwordInput" placeholder="*************">
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary mb-2">Login</button>
					<br> <a style="font-size: 14px"
						class="link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover"
						href="/">Already Registered? Go to Login</a>
				</div>
			</form>
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