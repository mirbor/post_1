class UserObj{
  bool isAuthSuccessful;
  int? OtdelenieId;
  String? Name;


  UserObj({required this.isAuthSuccessful, this.OtdelenieId,  this.Name});

  factory UserObj.fromJson(Map<String, dynamic> json) {
    return UserObj(
        OtdelenieId: json['OtdelenieId'],
        Name: json['Name'],
        isAuthSuccessful:json['isAuthSuccessful']
    );
  }

//Future<Davlenie> fromJson(decode) {}
}