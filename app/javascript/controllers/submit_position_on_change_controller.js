import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="submit-position-on-change"
export default class extends Controller {
  submit(event) {
    event.target.form.submit();
  }
}
