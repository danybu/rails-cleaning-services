const startAnimation = (card) => {
  let image = card.querySelector('img');
  card.style.backgroundColor = 'hsla(172, 90%, 36%,.1)';

  image.style.filter = 'sepia(0.2) brightness(1.1) contrast(1.2) ';
  image.style.transform ='scale(1.1) rotateY(-0.8deg) translateX(-4px) translateY(6px)';

};

const stopAnimation = (card) => {
  let image = card.querySelector('img');
  card.style.backgroundColor = 'white';
  image.style.filter = 'none' ;
  image.style.transform ='scale(1) rotateY(0) translateX(0) translateY(0)';

};

const hoverCard = () => {
  const cards = document.querySelectorAll(".card-cleaner-big");
  cards.forEach((card) => {
    card.addEventListener("mouseover", (event) => {
      const wholeCard = event.currentTarget;
      startAnimation(wholeCard);
    });
    card.addEventListener("mouseout", (event) => {
      const wholeCard = event.currentTarget;
      stopAnimation(wholeCard);
    });
  })
};

export { hoverCard };


transform: ;
