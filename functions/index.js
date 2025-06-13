const functions = require("firebase-functions");
const fetch = require("node-fetch");
const cors = require("cors")({ origin: true });

exports.newsProxy = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    const category = req.query.category || "general";
    const apiKey = "c57cbf2faca64274aca8a6bd555156a9";
    const url = `https://newsapi.org/v2/top-headlines?country=us&category=${category}&apiKey=${apiKey}`;

    try {
      const response = await fetch(url);
      const data = await response.json();
      res.status(200).json(data);
    } catch (err) {
      res.status(500).json({ error: "Failed to fetch news" });
    }
  });
});
