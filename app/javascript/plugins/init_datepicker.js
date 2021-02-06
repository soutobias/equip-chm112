import flatpickr from "flatpickr";

const initDate = () => {

  const datePicks = document.querySelectorAll('.datepicker')

  if (datePicks) {
    datePicks.forEach((datePick) => {
      flatpickr(datePick, {
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "Y-m-d",
      });
    });
  }
};

export { initDate };
