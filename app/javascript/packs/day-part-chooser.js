
const checkSubmit = () => {
  if ((document.querySelector("#reservation_before_noon").value == "false") &&
    (document.querySelector("#reservation_after_noon").value == "false"))
  document.querySelector("#cleaner-book-submit").disabled = true;
  else document.querySelector("#cleaner-book-submit").disabled = false;
};

const toggleValue = (event,reservationField) => {
  const noonButton = event.currentTarget;
  if (reservationField.value === "true") reservationField.value = false;
  else if (!noonButton.classList.contains('unavailable')) reservationField.value = "true";
  // console.log("field became " + reservationField.value);
  noonButton.classList.toggle("selected");
  checkSubmit();
};

const dayPartChooser = () => {
  checkSubmit();
  const reservationFieldBeforeNoon = document.querySelector("#reservation_before_noon");
  const reservationFieldAfterNoon = document.querySelector("#reservation_after_noon");
  const beforeNoonButton = document.querySelector("#before-noon");
  const afterNoonButton = document.querySelector("#after-noon");
  if (beforeNoonButton)
    beforeNoonButton.addEventListener("click",(event) => {toggleValue(event,reservationFieldBeforeNoon);});
  if (afterNoonButton)
    afterNoonButton.addEventListener("click",(event) => {toggleValue(event,reservationFieldAfterNoon);});
};

//get availabilities out of hidden field as a hash! MAGIC
const checkAvailabity = (event) => {
  document.querySelector("#reservation_before_noon").value = "false";
  document.querySelector("#reservation_after_noon").value = "false";
  document.querySelector("#before-noon").classList.remove('unavailable','selected');
  document.querySelector("#after-noon").classList.remove('unavailable','selected');


  const selectedDate = event.currentTarget.value;
  const reservations = JSON.parse(document.querySelector("#reservation_availabilities").value);
  if (reservations[selectedDate] == 'am') {
    document.querySelector("#before-noon").classList.add("unavailable");
  }
  if (reservations[selectedDate] == 'pm') {
    document.querySelector("#after-noon").classList.add("unavailable");
  }
  checkSubmit();
};

const dayChooser = () => {
  const dateField = document.querySelector("#reservation_reserved_on");
  if (dateField)
    dateField.addEventListener("blur", checkAvailabity);
}

export { dayPartChooser, dayChooser };
