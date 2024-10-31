class ResponseError {
  String? act;
  String? alertType;
  dynamic data;
  String? statusCode;
  String? message;
  String? reason;
  String? type;

  ResponseError(
      {required this.message,
        required this.alertType,
        required this.type,
        required this.data,
        required this.act,
        required this.statusCode,
        required this.reason});
}
