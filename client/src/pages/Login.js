import React, { useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";

const API_URL = process.env.REACT_APP_API_URL;

function Login() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();

  const login = () => {
    console.log("Login button clicked");
    console.log("Username:", username, "Password:", password);

    const data = { username: username, password: password };

    axios
      .post(`${API_URL}/signup/login`, data, {
        headers: { "Content-Type": "application/json" },
      })
      .then((response) => {
        console.log("Response from server:", response.data);
        if (response.data.success) {
          localStorage.setItem("username", username);
          navigate("/");
        } else {
          alert("Login failed: " + (response.data.message || "Unknown error"));
        }
      })
      .catch((error) => {
        console.error(
          "Error occurred during login:",
          error.response?.data || error.message
        );
        alert("An error occurred while logging in. Please try again.");
      });
  };

  return (
    <div className="log-bg-img">
      <div className="wrapper">
        <div className="outside-form">
          <form>
            <div className="inside-form">
              <h1>
                Welcome back to
                <span
                  style={{
                    fontFamily: "Roboto Slab, serif",
                    fontSize: "2rem",
                    letterSpacing: "3px",
                    fontWeight: "900",
                  }}
                >
                  CraveHaven
                </span>
              </h1>
              <h3>Log in</h3>

              <div className="input-box">
                <label htmlFor="Username">Username:</label>
                <input
                  id="username"
                  className="input-name"
                  type="text"
                  placeholder="Username"
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  required
                />
              </div>

              <div className="input-box">
                <label htmlFor="Pass">Password:</label>
                <input
                  className="input-pass"
                  type="password"
                  placeholder="Password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                />
              </div>

              <div className="btn">
                <button
                  className="log-in"
                  type="button"
                  onClick={login}
                  style={{ cursor: "pointer" }}
                >
                  Log in
                </button>
              </div>

              <p className="dont-acc">
                Don't have an account? <Link to="/signup">Sign Up</Link>
              </p>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}

export default Login;
