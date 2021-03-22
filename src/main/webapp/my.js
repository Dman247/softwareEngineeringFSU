function showAlert(Text, AlertType){
    var alertBox = document.getElementById("myalert");
    switch(alertType)
    {
        case 0:
            alertBox.style.display = "none";
            break;
        case 1:
            alertBox.style.display = "block";
            break;
        break;
    }
}

function validateEmail() {
  var email = document.register.email.value;
  if (email.endsWith("@fitchburgstate.edu")) {
    document.getElementById("email").setCustomValidity("");
  } else {
    document.getElementById("email").setCustomValidity("Not available Email");
  }
}


function validatePwd() {
  var pwd = document.register.pwd.value;
  var regexp = new RegExp("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}");
  if (regexp.test(pwd)) {
    document.getElementById("pwd").setCustomValidity("");
  } else {
    document.getElementById("pwd").setCustomValidity("you need at least 8 letters with uppercase and lowercase and some number");
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