class User{
  String token;
  String name;
  String lastName;
  int phone;
  String email;
  DateTime dateBorn;
  String password;

  User({this.token,this.name,this.lastName,this.phone, this.email, this.dateBorn, this.password});

  bool userExits(User user){
    if(user != null){
      return false;
    }
    return true;
  }

}