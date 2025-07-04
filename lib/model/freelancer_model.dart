class Freelancer {
  final String name;
  final String role;
  final String offeredPrice;

  const Freelancer({
    required this.name,
    required this.role,
    required this.offeredPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
      'offeredPrice': offeredPrice,
    };
  }

  factory Freelancer.fromMap(Map<String, dynamic> map) {
    return Freelancer(
      name: map['name'] ?? 'Unknown',
      role: map['role'] ?? 'Unknown',
      offeredPrice: map['offeredPrice'] ?? 'Unknown',
    );
  }
}
