function item_price (){
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  const ProfitDom = document.getElementById("profit");
  //手数料計算
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  //販売利益計算
  ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
}

window.addEventListener('load', item_price);

