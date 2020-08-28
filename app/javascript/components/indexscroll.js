const indexScroll = () => {
  let btn = document.querySelector('.goto-index');
  let el = document.querySelector('.list-protests');

  btn.addEventListener('click', function () {
      el.scrollIntoView(true);
  });
};

const indexScroll2 = () => {
  let btn = document.querySelector('.goto-map');
  let el = document.querySelector('.map-container');

  btn.addEventListener('click', function () {
      el.scrollIntoView(true);
  });
};

export { indexScroll, indexScroll2 };
