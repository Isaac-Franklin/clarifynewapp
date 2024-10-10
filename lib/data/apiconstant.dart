const apiKey = "82e1ee1d2fa6460b89f3a11761fb37c5";
const country = "us";
const appTitle = "Clafiya NewsApp";
const apiVersion = "2";
// const category = 'General';

loadNewsCategoriesEndpoint(String? category) =>
    "https://newsapi.org/v$apiVersion/top-headlines?country=$country&apiKey=$apiKey";
// loadNewsCategoriesEndpoint(String? category) =>
//     "http://newsapi.org/v$apiVersion/top-headlines?country=$country&category=$category&apiKey=$apiKey";

const loadNewsEndpoint =
    "http://newsapi.org/v$apiVersion/top-headlines?country=$country&apiKey=$apiKey";

fetchByCategory(String? category) =>
    "https://newsapi.org/v2/top-headlines?category=$category&apiKey=$apiKey";
