import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['form'];

  connect() {
    let requiredFieldSelectors = 'textarea:required, input:required';
    let requiredFields = this.formTarget.querySelectorAll(requiredFieldSelectors);
  
    requiredFields.forEach((target) => {
      target.addEventListener("input", (_) =>
        target.classList.remove("form__input--invalid")
      );
    });
  }
  
  submitForm(event) {

    let isValid = this.validateForm(this.formTarget);

    if (!isValid) {
      event.preventDefault();
    }
  }

  validateForm() {
    let isValid = true;

    let requiredFieldSelectors = 'textarea:required, input:required';
    let requiredFields = this.formTarget.querySelectorAll(requiredFieldSelectors);

    requiredFields.forEach((field) => {
  
      if (!field.disabled && !field.value.trim()) {
        field.focus();
        field.classList.add("form__input--invalid");

        isValid = false;
      }
    });

    return isValid;
  }
}
