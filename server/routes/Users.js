const express = require("express");
const router = express.Router();
const { Users } = require("../models");

// SIGNUP
router.post("/", async (req, res) => {
  try {
    const { username, password } = req.body;

    const newUser = await Users.create({
      username: username,
      password: password,
    });

    res.json({ success: true, message: "User created", user: newUser });
  } catch (error) {
    console.error("Signup error:", error);
    res.status(500).json({ success: false, error: error.message });
  }
});

// LOGIN
router.post("/login", async (req, res) => {
  try {
    const { username, password } = req.body;

    const user = await Users.findOne({
      where: { username: username },
    });

    if (!user) {
      return res.json({
        success: false,
        error: "User Doesn't Exist",
      });
    }

    // safer comparison
    if (String(password).trim() !== String(user.password).trim()) {
      return res.json({
        success: false,
        error: "Wrong Username And Password Combination",
      });
    }

    res.json({
      success: true,
      message: "Login successful",
      user: user,
    });
  } catch (error) {
    console.error("Login error:", error);
    res.status(500).json({ success: false, error: error.message });
  }
});

module.exports = router;