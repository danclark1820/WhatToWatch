let movies = document.getElementsByClassName('movie-div')
let teasers = document.getElementsByClassName('movie-teaser-iframe')
let env = document.getElementById("env")

for (let i = 0; i < teasers.length; i++) {
  let baseURL = ""
  if (env.dataset.env == "prod") {
    let baseURL = "https://findwhattowatch.com"
  } else {
    let baseURL = "localhost:4001"
  }
  
  let composedURL = baseURL + `/trailer?id=${teasers[i].dataset.id}`
  var trailerVideoURL = ""
  fetch(composedURL).then(response => 
    response.json().then(data => ({
        data: data,
        status: response.status
    })).then(res => {
      // trailerVideoURL = res.data.trailer_url
      console.log(res.status, res.data.trailer_url)
      trailerVideoURL = res.data.trailer_url
      teasers[i].src = res.data.trailer_url
      // teasers[i]
  }));
  teasers[i].src = trailerVideoURL
}

for (let i = 0; i < movies.length; i++) {
  movies[i].addEventListener('click', function(e, m = movies[i]) {
    // Just handle hiding the teaser and displaying the iframe
    e.target.style.display = "none";
    let teaserFrame = document.getElementById(`movie-info-${m.dataset.id}`)
    teaserFrame.style.display = "block";
  })
}
