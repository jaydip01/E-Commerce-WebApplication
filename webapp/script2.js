document.addEventListener("DOMContentLoaded", function () {
    const loginForm = document.getElementById("login-form");

    loginForm.addEventListener("submit", function (e) {
        e.preventDefault();

        // You can add your login logic here.
        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;

        // Example: Validate username and password (Replace with your own logic)
        if (username === "user" && password === "password") {
            alert("Login successful!");
            // Redirect to another page or perform other actions here.
        } else {
            alert("Login failed. Please check your credentials.");
        }
    });
});
