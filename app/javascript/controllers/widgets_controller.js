import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="widgets"
export default class extends Controller {
  btnWidgetRemove = document.getElementsByClassName("btn-widget-remove")
  saveWidget = document.getElementById("save-widget")
  editWidget = document.getElementById("edit-widget")

  connect() {
  }

  edit() {
    this.editWidget.style.display = "none"
    this.saveWidget.style.display = "block"
    for(let i =0; i<this.btnWidgetRemove.length; i++) {
      this.btnWidgetRemove[i].style.display = "block";
    }
  }

  save() {
    this.editWidget.style.display = "flex"
    this.saveWidget.style.display = "none"
    for(let i =0; i<this.btnWidgetRemove.length; i++) {
      this.btnWidgetRemove[i].style.display = "none";
    }
  }
}
