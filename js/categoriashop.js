function handleCategoryChange(category) {
    console.log('Category changed to:', category);
    // Aquí se agregaría la funcionalidad de cada categoría cuando tengamos el back
}
function addToWishlist(event) {
    event.preventDefault();
    alert("Producto agregado a la lista de favoritos");
}
function updatePriceValue() {
    var slider = document.getElementById('rangePrecio');
    var output = document.getElementById('priceValue');
    output.innerHTML = 'Precio: $' + slider.value;
}
function toggleCheckbox(checkedId, uncheckedId) {
    var checkedBox = document.getElementById(checkedId);
    var uncheckedBox = document.getElementById(uncheckedId);
    if (checkedBox.checked) {
        uncheckedBox.checked = false;
    }
}