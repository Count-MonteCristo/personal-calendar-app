document.addEventListener("DOMContentLoaded", function () {
  const loginFormContainer = document.getElementById("login-form-container");
  const loginForm = document.getElementById("login-form");
  const loginLink = document.getElementById("login-link");

  const signupFormContainer = document.getElementById("signup-form-container");
  const signupForm = document.getElementById("signup-form");
  const signupLink = document.getElementById("signup-link");

  loginForm.addEventListener("submit", function (event) {
    event.preventDefault();

    const formData = new FormData(loginForm);
    const email = formData.get("email");
    const password = formData.get("password");

    fetch("/users/sign_in", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        user: {
          email: email,
          password: password,
        },
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.message === "You are logged in.") {
          // Redirect to the desired page or handle success as needed
          console.log(data.message);
          window.location.href = "/main.html";
        } else {
          // Handle authentication failure
          console.error(data.message);
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  });

  loginLink.addEventListener("click", function (event) {
    event.preventDefault();
    signupFormContainer.classList.add("hidden");
    loginFormContainer.classList.remove("hidden");
  });

  signupForm.addEventListener("submit", function (event) {
    event.preventDefault();

    const formData = new FormData(signupForm);
    const email = formData.get("signup-email");
    const password = formData.get("signup-password");

    fetch("/users", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        user: {
          email: email,
          password: password,
        },
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.message === "Signed up successfully.") {
          // Redirect to the desired page or handle success as needed
          console.log(data.message);
          window.location.href = "/main.html";
        } else {
          // Handle sign up failure
          console.error(data.message);
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  });

  signupLink.addEventListener("click", function (event) {
    event.preventDefault();
    loginFormContainer.classList.add("hidden");
    signupFormContainer.classList.remove("hidden");
  });
});
