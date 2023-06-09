class UserModel{
  final String? id;
  final String fullname;
  final String email;
  final String password;
 UserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.password,
});
toJson(){
  return{
    'fullname':fullname,
    'email':email,
    'password':password,
  };
}
}