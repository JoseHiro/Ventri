import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="coverage-form"
export default class extends Controller {
  static targets = ["coverage", "coverageContainer", "excessContainer", "finance", "form", "message", "excessValue"]
  connect() {
    let active = false
  }

  update(){
    this.coverageContainerTarget.innerText = Math.abs(parseInt(this.coverageTarget.value) - 50)
    this.excessContainerTarget.innerText = (this.coverageTarget.value * 1000) / 25
    this.excessValueTarget.value = Math.abs(parseInt(this.coverageTarget.value) - 50)
    this.active = true
    this.financeTarget.classList.remove("border-danger")
    this.financeTarget.classList.add("border-success")
    this.messageTarget.style.color = "green"
    this.messageTarget.innerText = "Great!"
  }

  alert(event){
    if (this.active){
      this.financeTarget.classList.add("border-success")
    }else {
      event.preventDefault();
      this.financeTarget.classList.add("border-danger")
      this.messageTarget.classList.remove("d-none")
      this.messageTarget.innerText = "Make sure you select your financing option!"
      this.messageTarget.style.color = "red"
    }
  }
}
