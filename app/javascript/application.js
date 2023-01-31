import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

document.addEventListener("turbo:submit-start", async (event) => {
  Turbo.navigator.delegate.adapter.showProgressBar();
  document.getElementById("loading-spinner").classList.remove("hide");
})

document.addEventListener("turbo:submit-end", async (event) => {
  document.getElementById("loading-spinner").classList.add("hide");
  Turbo.navigator.delegate.adapter.progressBar.hide();
})

document.addEventListener("turbo:before-fetch-request", function(e){
  Turbo.navigator.delegate.adapter.showProgressBar();
  document.getElementById("loading-spinner").classList.remove("hide");
})
document.addEventListener("turbo:frame-render", function(e) { // 
  Turbo.navigator.delegate.adapter.progressBar.hide();
  document.getElementById("loading-spinner").classList.add("hide");
})