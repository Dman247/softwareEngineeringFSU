function validatePwd() {
	var pwd = document.register.pwd.value;
	var regexp = new RegExp("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{5,}");
	if (regexp.test(pwd)) {
		document.getElementById("pwd").setCustomValidity("");
	} else {
		document.getElementById("pwd").setCustomValidity("you need at least 5 letters with uppercase and lowercase and some number");
	}
}

function confirmPwd() {
	var pwd = document.register.pwd.value;
	var pwdC = document.register.pwdC.value;
	if (pwd !== pwdC) {
		document.getElementById("pwdC").setCustomValidity("Passwords do not match");
	} else {
		document.getElementById("pwdC").setCustomValidity("");
	}
}

function validateEmail() {
	var email = document.register.email.value;
	if (email.endsWith("@calendar.com")) {
		document.getElementById("email").setCustomValidity("");
	} else {
		document.getElementById("email").setCustomValidity("Not available Email");
	}
}
