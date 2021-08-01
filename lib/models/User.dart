

class User{
   late String name,email,avatarUrl;

   User(String name, String email, String img){
      this.name=name;
      this.email=email;
      this.avatarUrl=img;

   }

   Map<String, dynamic> toMap(){
      var map = <String, dynamic>{
         'name':  name,
         'email': email,
         'avatar': avatarUrl
      };
      return map;
   }

   User.fromMap(Map map){
      name = map['name'];
      email = map['email'];
      avatarUrl = map['avatar'];
   }



}