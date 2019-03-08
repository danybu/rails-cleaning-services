  const cleaner_banner = () => {
    const elem = document.querySelector('.cleaner-image');
    if(elem){
      const image = document.querySelector('#hidden-cleaner-picture').innerText;
      elem.style.backgroundImage = `linear-gradient(rgba(0,0,0,0),rgba(0,0,0,0.3)), url(${image})`;
    }
  };

  export { cleaner_banner };
