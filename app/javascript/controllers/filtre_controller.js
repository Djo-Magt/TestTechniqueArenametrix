import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filtre"
export default class extends Controller {
  static targets = ["spectacle", "form"]

  submitForm(event) {
    // event.preventDefault();

    console.log(this.formTarget.action)
    console.log(this.spectacleTarget.value)


  }
}
