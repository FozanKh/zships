import 'package:zships/core/model/extensions.dart';

String authErrorsHandler(String errorCode) {
  String errorMessage;
  switch ("ERROR_" + errorCode.toUpperCase().replaceAll("-", "_")) {
    case "ERROR_INVALID_EMAIL":
      errorMessage = "invalidEmail";
      break;
    case "ERROR_WRONG_PASSWORD":
      errorMessage = "incorrectPassword";
      break;
    case "ERROR_USER_NOT_FOUND":
      errorMessage = "invalidEmailNoAccount";
      break;
    case "ERROR_USER_DISABLED":
      errorMessage = "noUser";
      break;
    case "ERROR_TOO_MANY_REQUESTS":
      errorMessage = "tooManyRequests";
      break;
    case "ERROR_EMAIL_ALREADY_IN_USE":
      errorMessage = "emailAlreadyInUse";
      break;
    case "ERROR_NETWORK_REQUEST_FAILED":
      errorMessage = "noNetwork";
      break;
    case "ERROR_WEAK_PASSWORD":
      errorMessage = "weakPasswordError";
      break;
    case "ERROR_REQUIRES_RECENT_LOGIN":
      errorMessage = "ErrorRecentLogin";
      break;
    default:
      errorMessage = errorCode.replaceAll('-', ' ').titleCase;
  }
  return errorMessage;
}
