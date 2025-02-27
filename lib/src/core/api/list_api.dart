class ListAPI {
  ListAPI._();

  static String _baseUrl = "https://api-chl.imbtech.uz/api/v1/";
  static const String accessToken = 'access-token';
  static const String refreshToken = 'refresh-token';
  static const String lang = 'app_lang';
  static const String onBoard = 'app_onboarding';

  static setBaseUrl(String url) {
    _baseUrl = url;
  }

  static String get baseUrl => _baseUrl;
}
