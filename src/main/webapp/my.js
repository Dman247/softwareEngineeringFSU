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
  var Email = document.register.Email.value;
  if (Email.endsWith("@fitchburgstate.com")) {
    document.getElementById("Email").setCustomValidity("");
  } else {
    document.getElementById("Email").setCustomValidity("Not available Email");
  }
}