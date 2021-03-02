const showHistoric = () => {

  const clickButton1 = document.getElementById("show-hist");
  const table = document.getElementById("table1");

  if (clickButton1) {
    clickButton1.addEventListener('click', (event) => {
      table.classList.toggle('inactive-tab');
    });
  }
};

export { showHistoric };
