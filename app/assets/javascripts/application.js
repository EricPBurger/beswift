//= require rails-ujs
//= require_tree .
//= require algolia/v3/algoliasearch.min

var client = algoliasearch('VFU3HYH0Y5', 'd8bb6a1c22dcaf61f9720932e7a04828');
var index = client.initIndex('_COSTUMES');
const searchInput = document.getElementById('search_query')
index.search(searchInput, { hitsPerPage: 10, page: 0 })
  .then(function searchDone(content) {
    console.log(content)
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });
