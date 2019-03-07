const star_rating = () => {
  const checkElement = document.getElementById('rating')
  console.log(checkElement)
  if(checkElement) {
  const starTotal = 5;
  const ratingOnPage = document.getElementById('rating').innerText; //1
  const starPercentage = `${(ratingOnPage / starTotal) * 100}%`; //2
  document.querySelector(`.stars-inner`).style.width = starPercentage; //3
 };
};
export { star_rating };

/* how this function works :
  retrieves the rating:float from the page by looking inside the 'rating' element (1)
  then makes it a percentage out of 5 (2) and modify the css width property of the hidden
  yellow stars */
