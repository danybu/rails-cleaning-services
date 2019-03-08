  const cleaner_banner = () => {
    const elem = document.querySelector('.cleaner-image');
    if(elem){
    const image = document.querySelector('#hidden-cleaner-picture').innerText;
    elem.style.backgroundImage = `url(${image})`;
  }
  };

export { cleaner_banner };
