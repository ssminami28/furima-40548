window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
    const price = parseFloat(priceInput.value);
    const addTaxDom = document.getElementById("add-tax-price");
    const tax = Math.floor(price * 0.1);
    addTaxDom.innerHTML = tax;
    const addProfitDom = document.getElementById("profit");
    const profit = Math.floor(price - tax);
    addProfitDom.innerHTML = profit;
  })
});