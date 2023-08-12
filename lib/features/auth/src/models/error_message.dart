class ErrorMessage {
  final String name;
  final String message;
  final int status;
  final List<dynamic> errors;

  ErrorMessage({
    required this.name,
    required this.message,
    required this.status,
    required this.errors,
  });

  factory ErrorMessage.fromJson(Map<String, dynamic> json) => ErrorMessage(
        name: json["name"],
        message: json["message"],
        status: json["status"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );
}
