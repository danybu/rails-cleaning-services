const startAnimation = (card) => {
  let image = card.querySelector('img');

  card.style.backgroundColor = 'hsla(172, 90%, 36%,.1)';
  image.style.transition = 'all 3s;';
  image.style.filter = 'sepia(0.2) brightness(1.1) contrast(1.2) ';
  image.style.transform ='scale(1.1)';
};

const stopAnimation = (card) => {
  let image = card.querySelector('img');

  image.style.transition = 'all 1s;';
  card.style.backgroundColor = 'white';
  image.style.filter = 'none' ;
  image.style.transform ='scale(1)';


};

const hoverCard = () => {
  const cards = document.querySelectorAll(".card-cleaner-big");
  cards.forEach((card) => {
    card.addEventListener("mouseover", (event) => {
      const wholeCard = event.currentTarget;
      console.log(wholeCard)
      startAnimation(wholeCard);
    });
    card.addEventListener("mouseout", (event) => {
      const wholeCard = event.currentTarget;
      stopAnimation(wholeCard);
    });
  })
};

export { hoverCard };



// <img height="300" width="400" src="http://res.cloudinary.com/df0udw5lo/image/upload/c_fill,g_face,h_300,w_400/v1/cleaning_pictures/full_woman">
