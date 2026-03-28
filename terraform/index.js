import express from "express";

const app = express();

app.get("/", (req, res) => {
  res.send("backend server is running.");
});

app.listen(3000, () => {
  console.log("server is listening on port: 30000");
});
