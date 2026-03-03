// PENLab - Custom JS
// Fix navbar brand link to use current origin (avoids localhost vs 127.0.0.1 mismatch)
document.addEventListener("DOMContentLoaded", function() {
  document.querySelectorAll(".navbar-brand, .navbar-brand-img").forEach(function(el) {
    var path = el.getAttribute("href");
    try {
      var url = new URL(path);
      // Replace only the origin, keep the pathname
      el.setAttribute("href", window.location.origin + url.pathname);
    } catch(e) {
      // Already a relative path, leave it
    }
  });
});
