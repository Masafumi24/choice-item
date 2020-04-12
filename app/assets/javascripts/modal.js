document.addEventListener(
  "DOMContentLoaded", e => {
    let modal_open = document.getElementById("modalOpenBtn");
    modal_open.onclick = function () {
      $('#overlay').fadeIn();
      document.getElementById('modalCloseBtn').onclick = function () {
        $('#overlay').fadeOut();
      };
      document.getElementById("randomReturnBtn").onclick = function () {
        document.getElementById("itemRandomBtn").click();
      };
    };
  },
  false
);