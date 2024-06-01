import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startDate", "endDate"]
  static values = { minDate: String, maxDate: String }

  connect() {
    flatpickr(this.startDateTarget, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: this.minDateValue,
      maxDate: this.maxDateValue,
      defaultDate: this.element.value,
      "plugins": [new rangePlugin({ input: this.endDateTarget})]
    })
  }
}
