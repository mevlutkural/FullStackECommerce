class Campaign {
  final int id;
  final String image;
  final int order;
  bool isActive;

  Campaign({
    required this.id,
    required this.image,
    required this.order,
    required this.isActive,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      id: json['id'],
      image: json['image'],
      order: json['order'],
      isActive: json['isActive'],
    );
  }
}
