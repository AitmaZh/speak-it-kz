import 'dart:io' show Platform;

const REFRESH_TOKEN_KEY = 'refresh_token';
const BACKEND_TOKEN_KEY = 'backend_token';
const GOOGLE_ISSUER = 'https://accounts.google.com';
const GOOGLE_CLIENT_ID_IOS = '1096462519488-tl2vome2a91nic6v63cgt4vgogfrp0ou.apps.googleusercontent.com';
const GOOGLE_REDIRECT_URI_IOS =
    'com.googleusercontent.apps.1096462519488-tl2vome2a91nic6v63cgt4vgogfrp0ou.apps.googleusercontent.com:/oauthredirect';
const GOOGLE_CLIENT_ID_ANDROID = '1096462519488-mn14jqrm6r04ickkd4kse4366pct8ql0.apps.googleusercontent.com';
const GOOGLE_REDIRECT_URI_ANDROID =
    'com.googleusercontent.apps.1096462519488-mn14jqrm6r04ickkd4kse4366pct8ql0.apps.googleusercontent.com:/oauthredirect';

String clientID() {
  if (Platform.isAndroid) {
    return GOOGLE_CLIENT_ID_ANDROID;
  } else if (Platform.isIOS) {
    return GOOGLE_CLIENT_ID_IOS;
  }
  return '';
}

String redirectUrl() {
  if (Platform.isAndroid) {
    return GOOGLE_REDIRECT_URI_ANDROID;
  } else if (Platform.isIOS) {
    return GOOGLE_REDIRECT_URI_IOS;
  }
  return '';
}
