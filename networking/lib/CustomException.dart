
class CustomException implements Exception
{
  final message;
  final prefix;

  CustomException(this.message, this.prefix); //CustomException([this.message, this.prefix]);

  String toString()
  {
    return "$prefix$message";
  }
}

class FetchDataException extends CustomException
{
  FetchDataException([String message]) : super(message, "Error Connecting: ");
}

class BadRequestException extends CustomException
{
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException
{
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException
{
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}