import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form"];
  submitForm(event) {

    event.preventDefault();

    const formData = new FormData(this.formTarget);

    fetch(this.formTarget.action, {
      method: this.formTarget.method,
      body: formData,
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content"),
        "Accept": "text/html",
      },
    })
  }
}