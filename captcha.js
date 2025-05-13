function generateCaptchaText() {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  let result = '';
  for (let i = 0; i < 5; i++) {
    result += chars.charAt(Math.floor(Math.random() * chars.length));
  }
  return result;
}
function renderCaptcha(id) {
  const el = document.getElementById(id);
  if (el) el.textContent = generateCaptchaText();
}
function validateCaptcha(displayId, inputId) {
  const correctCaptcha = document.getElementById(displayId).textContent.trim().toUpperCase();
  const userInput = document.getElementById(inputId).value.trim().toUpperCase();
  if (userInput !== correctCaptcha) {
    alert("CAPTCHA does not match. Please try again.");
    renderCaptcha(displayId); 
    return false;
  }
  return true;
}
window.addEventListener("DOMContentLoaded", () => {
  renderCaptcha("loginCaptchaText");
  renderCaptcha("signupCaptchaText");
});
