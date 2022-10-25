import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  printData() { 
    console.log(this.element.dataset.overview)
  }
}
