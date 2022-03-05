import 'package:json_annotation/json_annotation.dart';

class User_Respone{
  int _id;
  String _name,_email,_gender,_status;
  factory User_Respone.fromJson(Map<String, dynamic> json) {
    return User_Respone(json['id'], json['name'], json['email'], json['gender'],
        json['status']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'status': status,
    };
  }
  int get id => _id;

  set id(int value) {
    _id = value;
  }

  User_Respone(this._id, this._name, this._email, this._gender, this._status);


  String get name => _name;

  set name(String value) {
    _name = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get gender => _gender;

  set gender(value) {
    _gender = value;
  }

  get status => _status;

  set status(value) {
    _status = value;
  }
}