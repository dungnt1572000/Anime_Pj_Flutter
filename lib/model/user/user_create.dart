class User_Create{
  String _name,_email,_gender,_status;


  User_Create(this._name, this._email, this._gender, this._status);

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'gender': gender, 'status': status};
  }

  factory User_Create.fromJson(Map<String, dynamic> json){
    return User_Create(json['name'], json['email'], json['gender'], json['status']);
  }

  @override
  String toString() {
    return 'UserCreate{name: $name, email: $email, gender: $gender, status: $status}';
  }
  get gender => _gender;

  set gender(value) {
    _gender = value;
  }

  get status => _status;

  set status(value) {
    _status = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}