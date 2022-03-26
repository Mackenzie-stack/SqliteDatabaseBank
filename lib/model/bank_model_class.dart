class LocalBankDetails{
  String bankName;
  String bankAccName;
  String bankAccNum;

  LocalBankDetails({
    required this.bankName,
    required this.bankAccName,
    required this.bankAccNum,

  });

  factory LocalBankDetails.fromMap(Map<String, dynamic> json) {
    return LocalBankDetails(
      bankName: json['bankName'],
      bankAccName: json['bankAccName'],
      bankAccNum: json['bankAccNum'],
    );
  }

  Map<String, dynamic> toMap() => {
    'bankName': bankName,
    'bankAccName': bankAccName,
    'bankAccNum': bankAccNum,

  };
}