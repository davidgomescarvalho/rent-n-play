import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      mode: "range",
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: "today",
      defaultDate: this.element.value,
      onChange: (selectedDates, dateStr, instance) => {
        this.element.value = dateStr
      }
    })
  }
}
