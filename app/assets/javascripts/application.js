//= require rails-ujs
//= require_tree .
//= require algolia/v3/algoliasearch.min
search = document.querySelector(".search");
if (search) {
  const form = document.querySelector("form");
form.addEventListener("submit", (event) => {
  event.preventDefault();
  var client = algoliasearch('VFU3HYH0Y5', 'd8bb6a1c22dcaf61f9720932e7a04828');
var index = client.initIndex('_COSTUMES');
const searchInput = document.getElementById('search_query').value;
console.log(searchInput)
index.search(searchInput, { hitsPerPage: 10, page: 0, restrictSearchableAttributes: [
  'costume_name'
] })
  .then(function searchDone(content) {
    console.log(content.hits)
    const row = document.querySelector(".row");
    row.innerHTML = "";
    content.hits.forEach((costume => {
      const card = `<div class="col-md-4">
        <div class="card card-costume mb-4 shadow-sm">
          <img class="card-img-top" src="https://images.unsplash.com/photo-1572804013427-4d7ca7268217?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=802&q=80" width="100%" height="225" preserveAspectRatio="xMidYMid slice" focusable="false" aria-label="placeholder: Thumbnail" alt="Card image cap">
          <div class="card-body">
            <div class="card-text">
              <p>
                ${costume.costume_name}
              </p>
              <div class="d-flex justify-content-between alighn-items-center">
                <div class="btn-group">
                <a class="btn btn-sm btn-outline-secondary" href="/costumes/${costume.id}">Show</a>
                <button class="btn btn-sm btn-outline-secondary" type="button">Edit
                    </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>`
      row.insertAdjacentHTML("beforeend", card)
    }))
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });
})
}

