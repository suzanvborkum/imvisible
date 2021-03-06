const otherCheckbox = () => {
  let other_field = document.getElementById("other_category_field")
  other_field.style.display = "none";
  document.getElementById("other_category_checkbox").addEventListener("change", (event) => {
    if (!event.target.checked) {
      other_field.style.display = "none";
      other_field.value = null;
    } else {
      other_field.style.display = "block";
    }
  });
};

export { otherCheckbox }
