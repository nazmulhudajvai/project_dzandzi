class Employee {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? avatarUrl;
  final String role;

  Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.avatarUrl,
    required this.role,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      avatarUrl: json['avatarUrl'],
      role: json['role'] ?? '',
    );
  }
}
