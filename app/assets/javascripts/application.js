//= require rails-ujs
//= require_tree .
//= require algolia/v3/algoliasearch.min
search = document.querySelector(".search");
if (search) {
  console.log("")
  const form = document.querySelector(".search-algolia");
form.addEventListener("submit", (event) => {
  console.log("ben")
  event.preventDefault();
  var client = algoliasearch('VFU3HYH0Y5', 'd8bb6a1c22dcaf61f9720932e7a04828');
var index = client.initIndex('_COSTUMES');
const searchInput = document.getElementById('search_query-algolia').value;
console.log(searchInput)
index.search(searchInput, { hitsPerPage: 10, page: 0, restrictSearchableAttributes: [
  'costume_name'
] })
  .then(function searchDone(content) {
    console.log(content.hits)
    const row = document.querySelector(".row");
    row.innerHTML = "";
    content.hits.forEach((costume => {
      const imgs = JSON.parse(row.dataset.imgs)
      let url = `http://res.cloudinary.com/dzfxenhta/image/upload/c_fill,h_300,w_200/`
      imgs.forEach((img) => {
        if (img[0] == costume.id) {
          url += img[1];
        }
      })
          // <img class="card-img-top" src="${url}" preserveAspectRatio="xMidYMid slice" focusable="false" aria-label="placeholder: Thumbnail" alt="Card image cap">

      const card = `
        <a href="/costumes/${costume.id}">
        <div class="costume-card-small" style="background-image: url(${url});"></div>
        <div class="costume-card-infos">
      <p style="font-weight: normal;">${costume.costume_name}</p>
      <p style="font-size: 16px;">£${costume.formatted_price} per day</p>
    </div></a>`

      row.insertAdjacentHTML("beforeend", card)
    }))
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });
})
}

