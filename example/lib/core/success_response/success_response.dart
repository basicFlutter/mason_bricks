class SuccessResponse {
  int? statusCode;
  String? message;
  SuccessResponse({
    this.message,
    this.statusCode
});

  SuccessResponse.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
  }

}