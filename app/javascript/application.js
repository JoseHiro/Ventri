// Entry point for the build script in your package.json
//= require flatpickr
//= require flatpickr/plugins/confirmDate/confirmDate
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

document.addEventListener('DOMContentLoaded', function() {
  flatpickr('.your-selector', {
    enableTime: true,
    plugins: [
      new confirmDatePlugin({})
    ]
  })
})
