import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="coverage-form"
export default class extends Controller {
  static targets = ["coverage", "coverageContainer", "excessContainer", "finance", "form"]
  connect() {
    let active = false
  }

  update(){
    this.coverageContainerTarget.innerText = Math.abs(parseInt(this.coverageTarget.value) - 50)
    this.excessContainerTarget.innerText = (this.coverageTarget.value * 1000) / 25
    this.active = true
  }

  alert(event){
    event.preventDefault();
    if (this.active){
      this.financeTarget.style.border="red"

    }else {
      this.coverageContainerTarget.style.color="red"
    }
  }
}
