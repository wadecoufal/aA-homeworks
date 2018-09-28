module.exports = {
  entry: "./frontend/my_app.jsx",
  output: {
      path: path.resolve(__dirname, 'app', 'assets', 'javascripts'),
      filename: "bundle.js"
  }
};
