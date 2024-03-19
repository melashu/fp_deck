import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// Connects to data-controller="search-filters"
export default class extends Controller {
  status = document.getElementById("search_filter_status_id")
  type = document.getElementById("search_filter_user_type")
  user_name = document.getElementById("search_filter_user_name")
  phase = document.getElementById("search_filter_phase")
  account_size_from = document.getElementById("search_filter_account_size_from")
  account_size_to = document.getElementById("search_filter_account_size_to")
  started = document.getElementById("search_filter_started")
  ended = document.getElementById("search_filter_ended")
  balance_size_from = document.getElementById("search_filter_balance_from")
  balance_size_to = document.getElementById("search_filter_balance_to")
  user_id = document.getElementById("user_id")
  search_filter = {}
  formData = new FormData();
  overly = document.getElementById("overly")
  modalID = document.getElementById("popup-modal")

	token = document.getElementsByName("csrf-token")[0].content


  success = document.getElementById("success")
  error = document.getElementById("error")

  notify = document.getElementById("notify_progress")

  options = {
		placement: 'bottom-right',
		backdrop: 'static',
		backdropClasses: 'bg-red-900',
		closable: true,
	};



	modal = new Modal(this.modalID, this.options);
  connect() {
    // console.log(this.element.form)
  }
  show(e) {
    e.preventDefault()

    this.modal.show()
    this.overly.style.display = "flex"
  }

  async save_filters(e) {
    // alert(this.status.value)
    const name = document.getElementById("filter-name")
    if (name.value == "") {
      name.style.border = "2px red solid";
    } else {
      if (this.status.value == "" && this.type.value == "" && this.user_name.value == "" && this.phase.value == "" &&
        this.account_size_from.value == "" && this.account_size_to.value == "" && this.started.value == "" && this.ended.value == "" && 
        this.balance_size_from.value == "" && this.balance_size_to.value == "") {
          this.modal.hide()
          this.overly.style.display = "none"
          alert("Search filters is not saved because you didnt insert any filters")
      } else {
    // params.permit(:name, :user_type, :phase, :status_id, :user_id, :account_size_from, :account_size_to, :started,:ended,:balance_from, :balance_to)

     const formData = new FormData();
    formData.append("name", name.value);
    formData.append("user_type", this.type.value);
    formData.append("status_id", this.status.value);
    formData.append("user_id", this.user_id.value);
    formData.append("account_size_from", this.account_size_from.value);
    formData.append("account_size_to", this.account_size_to.value);
    formData.append("started", this.started.value);
    formData.append("ended", this.ended.value);
    formData.append("balance_from", this.balance_size_from.value);
    formData.append("balance_to", this.balance_size_to.value);
    formData.append("phase", this.phase.value);
        
    const response = await fetch(`/search_filters`, {
      method: 'POST',
      headers: { "X-CSRF-Token": this.token,  "Accept": "text/vnd.turbo-stream.html"},
      body: formData
    });
     const html = await response.text()
        Turbo.renderStreamMessage(html)
        this.modal.hide()
        name.value = null;
        this.overly.style.display = "none"
      }
    }
   
    
  }

  close() {
    this.modal.hide()
    this.overly.style.display = "none"
  }

  async filter(e) {
    this.search_filter[e.target.name] = e.target.value
    
    this.formData.append(`${e.target.name}`, e.target.value)
    const response = await fetch(`/trading_accounts/filter`, {
      method: 'post',
      headers: { "X-CSRF-Token": this.token, "Accept": "text/vnd.turbo-stream.html"},
      body: this.formData
    });
     const html = await response.text()
     Turbo.renderStreamMessage(html)
  }

  async prePopulate(e) {
   const id = e.target.value
    const response = await fetch(`/search_filters/${id}/pre_populate`, {
      method: 'get',
      headers: {"Accept": "text/vnd.turbo-stream.html"},
     
    });
     const html = await response.text()
     Turbo.renderStreamMessage(html)
  }
}
