
        document.addEventListener("DOMContentLoaded", function () {
            const form = document.getElementById("loginForm");
            const emailInput = document.getElementById("email");
            const passwordInput = document.getElementById("password");
            const emailError = document.getElementById("emailError");
            const passwordError = document.getElementById("passwordError");
            const togglePassword = document.getElementById("togglePassword");
    
            function isValidEmail(email) {
                return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
            }
    
            function isValidPassword(password) {
                return password.length >= 6;
            }
    
           
            togglePassword.addEventListener("click", function () {
                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    eyeOpen.style.display = "inline";
                    eyeClosed.style.display = "none";
                } else {
                    passwordInput.type = "password";
                    eyeOpen.style.display = "none";
                    eyeClosed.style.display = "inline";
                }
            });
    
            form.addEventListener("submit", function (event) {
                event.preventDefault();
                let isValid = true;
    
                if (!isValidEmail(emailInput.value)) {
                    emailError.textContent = "E-mail inválido!";
                    isValid = false;
                } else {
                    emailError.textContent = "";
                }
    
                if (!isValidPassword(passwordInput.value)) {
                    passwordError.textContent = "A senha deve ter pelo menos 6 caracteres!";
                    isValid = false;
                } else {
                    passwordError.textContent = "";
                }
    
                if (isValid) {
                    alert("Login realizado com sucesso! Selecione o 'Ok' para continuar.");  
                    window.location.href = "index.html";
                }
            });
        });

