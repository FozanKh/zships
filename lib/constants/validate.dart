import 'dart:io';

enum ValidationErrorType {
  password,
  email,
  name,
  credit,
}
// Auth validation
bool validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp =  RegExp(pattern);

  return regExp.hasMatch(value);
}

bool validateUsername(String value) {
  String pattern = r'^(?=[a-zA-Z0-9._]{3,20}$)(?!.*[_.]{2})[^_.].*[^_.]$';

  RegExp regExp =  RegExp(pattern);

  return regExp.hasMatch(value);
}

bool validatePhoneNumber(String value) {
  String pattern = r'^(05)[0-9]{8}$';
  RegExp regExp =  RegExp(pattern);
  return regExp.hasMatch(value);
}

bool validatePassword(String value) {
  if ((value.length < 6) || value.isEmpty) {
    return false;
  }
  return true;
}

String errorMessage(ValidationErrorType type) {
  if (type == ValidationErrorType.password) {
    return 'RequestValidPassword';
  } else if (type == ValidationErrorType.email) {
    return 'RequestValidEmail';
  } else if (type == ValidationErrorType.name) {
    return 'NameEmpty';
  } else if (type == ValidationErrorType.credit) {
    return 'RequestValidCredit';
  } else {
    return 'RequestValidInput';
  }
}

bool showErrorMessage(String value, ValidationErrorType type) {
  if (type == ValidationErrorType.email) {
    if (value.length > 6 && value.contains('@')) {
      return true;
    } else {
      return false;
    }
  } else if (type == ValidationErrorType.password) {
    if (value.length > 2) {
      return true;
    } else {
      return false;
    }
  } else if (type == ValidationErrorType.credit) {
    if (!isNumeric(value) && value != null && value.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
  return false;
}

// Null safety
bool safeIsNotEmpty(object) {
  return object != null && object.isNotEmpty && object != '';
}

bool safeListIsNotEmpty(object) {
  return object != null && object.length > 0;
}

bool safeMapIsNotEmpty(Map object) {
  return object != null && object.keys.length > 0;
}

Future<bool> checkConnection() async {
  bool connected = false;
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connected = true;
      print('connected');
    } else {
      connected = false;
    }
  } on SocketException catch (_) {
    connected = false;
    print('not connected');
  }
  return connected;
}

// generals
bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
