class UserProfileBalance {
  final int totalPlans;
  final double totalBalance;
  final double totalRevenue;

  UserProfileBalance({
    required this.totalPlans,
    required this.totalBalance,
    required this.totalRevenue,
  });

  factory UserProfileBalance.fromJson(Map<String, dynamic> json) {
    return UserProfileBalance(
      totalPlans: json['countPlanesActive'] ?? 0,
      totalBalance: json['totalBalanceAmmount']?.toDouble() ?? 0.0,
      totalRevenue: double.parse(json['totalBalanceRentability'] ?? '0.0'),
    );
  }
  UserProfileBalance copyWith({
    int? totalPlans,
    double? totalBalance,
    double? totalRevenue,
  }) {
    return UserProfileBalance(
      totalPlans: totalPlans ?? this.totalPlans,
      totalBalance: totalBalance ?? this.totalBalance,
      totalRevenue: totalRevenue ?? this.totalRevenue,
    );
  }
}
