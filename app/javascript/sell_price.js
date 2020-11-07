function sellPrice() {
  const itemPrice = document.getElementById("item-price");
  const addTax = document.getElementById("add-tax-price");
  const salesProfit = document.getElementById("profit");

  itemPrice.addEventListener('input', function(){
    const inputValue = itemPrice.value;
    tax = Math.floor(inputValue * 0.1);
    addTax.innerHTML = tax;
    profit = Math.floor(inputValue - tax);
    salesProfit.innerHTML = profit;
  })
}

window.addEventListener('load', sellPrice);