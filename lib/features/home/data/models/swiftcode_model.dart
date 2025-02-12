class SwiftCodeModel {
  final String bank_name;
  final String city;
  final String country;
  final String country_code;
  final String swift_code;

  SwiftCodeModel({
    required this.bank_name,
    required this.city,
    required this.country,
    required this.country_code,
    required this.swift_code,
  });

  factory SwiftCodeModel.fromJson(Map<String, dynamic> json){
    return SwiftCodeModel(
      bank_name: json['bank_name'],
      city: json['city'],
      country: json['country'],
      country_code: json['country_code'],
      swift_code: json['swift_code']
    );
  }
}