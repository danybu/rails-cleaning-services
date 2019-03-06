export { hoverCard };

document.querySelectorAll(".card-cleaner-big").addEventListener("mouseover", (event) => {
  const wholeCard = event.currentTarget;
  wholeCard.innerHTML = "AIAIAI";
});
