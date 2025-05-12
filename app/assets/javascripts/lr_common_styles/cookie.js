const HMLR_COOKIE_POLICY = 'hmlr_cookie_policy'
const COOKIE_DURATION = 365
const GA_TRACKING_ID = 'UA-21165003-6' // Replace with your actual tracking ID

/**
 * Retrieve user preferences cookie
 * If user has accepted analytics, load analytics
 * If no preference is set, show cookie banner
 */
window.onload = function () {
  const userPreferences = getCookie(HMLR_COOKIE_POLICY)
  if (userPreferences) {
    const analyticsAccepted = JSON.parse(userPreferences).analytics

    if (analyticsAccepted) {
      loadAnalytics()
    }
  } else {
    showBanner(true)
  }
}

/**
 * standard function for setting a cookie with an expiry length in days
 * @param {string} key
 * @param {string} value
 * @param {number} duration in days
 */
function setCookie(key, value, duration) {
  const date = new Date();
  date.setTime(date.getTime() + duration * 24 * 60 * 60 * 1000);
  const expires = 'expires=' + date.toUTCString();
  document.cookie = key + '=' + value + ';' + expires + ';path=/'
}

/**
 * retrieves a cookie's value by name
 * @param {string} name
 * @returns {string} the value of the cookie
 */
function getCookie(name) {
  const key = name + '='
  const decodedCookie = decodeURIComponent(document.cookie)
  const cookieList = decodedCookie.split(';')
  for (const i = 0; i < cookieList.length; i++) {
    const cookie = cookieList[i]
    while (cookie.charAt(0) == ' ') {
      cookie = cookie.substring(1)
    }
    if (cookie.indexOf(key) == 0) {
      return cookie.substring(key.length, cookie.length)
    }
  }
  return ''
}

/**
 * Set analytics acceptance cookie to true
 */
function acceptCookie() {
  acceptAnalytics(true)
}

/**
 * Set analytics acceptance cookie to false
 */
function rejectCookie() {
  acceptAnalytics(false)
}

/**
 * Toggle visibility of cookie banner in the UI
 * @param {boolean} bool
 */
function showBanner(bool) {
  const cookieBanner = document.querySelector('#cookie-banner')

  if (bool) {
    cookieBanner.setAttribute('style', 'display:block')
  } else {
    cookieBanner.setAttribute('style', 'display:none')
  }
}

/**
 * Set analytics cookie and if true load analytics
 * @param {boolean} bool
 */
function acceptAnalytics(bool) {
  const preferences = { analytics: bool }

  setCookie(HMLR_COOKIE_POLICY, JSON.stringify(preferences), COOKIE_DURATION)
  showBanner(false)

  if (bool) {
    loadAnalytics()
  }
}

function loadGoogleAnalyticsScript() {
  return new Promise((resolve, reject) => {
      // Create the script element for Google Analytics
      const script = document.createElement('script');
      script.async = true;
      script.src = `https://www.googletagmanager.com/gtag/js?id=${GA_TRACKING_ID}`;
      script.onload = resolve;
      script.onerror = reject;
      document.head.appendChild(script);
  });
}

/**
 * Code snip for initialising Google Tag Manager requires
 * gtag js.
 */
function loadAnalytics() {
  try {
    await loadGoogleAnalyticsScript(); // Wait for GA script to load
    // Initialize Google Analytics
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', GA_TRACKING_ID , { 'anonymize_ip': true });
  } catch (error) {
    console.error('Error loading Google Analytics:', error);
  }
}
