document.getElementById("register-btn").addEventListener("click", function() {
    document.getElementById("register-form").style.display = "block";
    document.getElementById("login-form").style.display = "none";
    this.classList.add("active");
    document.getElementById("login-btn").classList.remove("active");
  });
  
  document.getElementById("login-btn").addEventListener("click", function() {
    document.getElementById("login-form").style.display = "block";
    document.getElementById("register-form").style.display = "none";
    this.classList.add("active");
    document.getElementById("register-btn").classList.remove("active");
  });
  