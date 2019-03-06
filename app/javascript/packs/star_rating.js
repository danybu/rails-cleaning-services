const star_rating = () => {
  console.log('INSIDE STAR')
  const starTotal = 5;
  const ratingOnPage = document.getElementById('rating').innerText;
  console.log(ratingOnPage);
  const starPercentage = `${(ratingOnPage / starTotal) * 100}%`;
  document.querySelector(`.stars-inner`).style.width = starPercentage;
};

export { star_rating };
