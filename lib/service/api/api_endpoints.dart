class ApiEndPoints {
  static ApiEndPoints _instance;

  static ApiEndPoints get instance {
    if (_instance == null) {
      _instance = ApiEndPoints();
      return _instance;
    } else
      return _instance;
  }

}
