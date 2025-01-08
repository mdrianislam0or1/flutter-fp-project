import 'package:mrt_project/models/user.dart';
import 'package:http/http.dart' as http;
class AuthService {
  void signUpUser({
    required String email,
    required String password,
    required String name,
  })async{
    try{
      User user = User(id:'', password: password, address: '',type: '',token: '', name: name);

      http.post();
    }catch(e){
      // ignore: use_rethrow_when_possible
      throw e;
  
  }
}
