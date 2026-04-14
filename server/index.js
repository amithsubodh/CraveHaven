const express = require("express");
const app = express();
const cors = require("cors");

app.use(express.json());
app.use(
  cors({
    origin: "*",
    credentials: true,
  })
);


const db = require("./models");

// Routers
const restaurantRouter = require("./routes/Restaurant");
app.use("/api/restaurants", restaurantRouter);

const usersRouter = require("./routes/Users");
app.use("/api/signup", usersRouter);

const cartRouter = require("./routes/Cart");
app.use("/api/carts", cartRouter);

const contRouter = require("./routes/Contact");
app.use("/api/contact", contRouter);

// config the db in config folder so that it knows which db to use
const PORT = process.env.PORT || 3001;

db.sequelize.authenticate().then(() => {
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
});

app.get("/health", (req, res) => {
  res.status(200).json({ status: "OK" });
});
