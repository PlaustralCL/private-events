import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static classes = [ "open" ]

  open() {
    this.element.classList.add(this.openClass);
  }

  close() {
    this.element.classList.remove(this.openClass);
  }
}