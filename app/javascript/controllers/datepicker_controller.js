import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

document.addEventListener('turbo:load', () => {
  flatpickr("#start_date", {
    onChange: function(selectedDates, dateStr, instance) {
      document.getElementById('end_date').flatpickr.set('minDate', dateStr);
    }
  });

  flatpickr("#end_date", {
    onChange: function(selectedDates, dateStr, instance) {
      document.getElementById('start_date').flatpickr.set('maxDate', dateStr);
    }
  });
});
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
