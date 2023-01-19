class LoginModel {
  int? uId;
  String? phoneNumber;
  String? userName;
  String? updatedAt;
  String? createdAt;
  int? id;
  int? statusCode;
  String? message;

  LoginModel(
      {this.uId,
      this.phoneNumber,
      this.userName,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    uId = json['u_id'];
    phoneNumber = json['phone_number'];
    userName = json['user_name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    message = json['message'];
  }

  LoginModel.statusCode(int statuscode) {
    statusCode = statuscode;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['u_id'] = uId;
    data['phone_number'] = phoneNumber;
    data['user_name'] = userName;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['message'] = message;
    return data;
  }
}

class UserSignin {
  int? id;
  int? uId;
  String? userName;
  String? address;
  String? mandalam;
  String? booth;
  String? block;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  String? message;

  UserSignin(
      {this.id,
      this.uId,
      this.userName,
      this.address,
      this.mandalam,
      this.booth,
      this.block,
      this.phoneNumber,
      this.createdAt,
      this.updatedAt,
      this.message});

  UserSignin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uId = json['u_id'];
    userName = json['user_name'];
    address = json['address'];
    mandalam = json['mandalam'];
    booth = json['booth'];
    block = json['block'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['u_id'] = uId;
    data['user_name'] = userName;
    data['address'] = address;
    data['mandalam'] = mandalam;
    data['booth'] = booth;
    data['block'] = block;
    data['phone_number'] = phoneNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['message'] = message;
    return data;
  }
}
