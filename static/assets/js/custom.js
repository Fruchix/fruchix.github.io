document.addEventListener("DOMContentLoaded", () => {
  // Adjust the selector to target your specific category sidebar wrapper
  const categoryLists = document.querySelectorAll('.sidebar-tree .subtree ul'); 

  categoryLists.forEach(ul => {
    ul.classList.add('active');
  });
});