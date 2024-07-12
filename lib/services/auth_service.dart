import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Google Sign-in
  signInWithGoogle() async {
    //Iniciar processo de login Google
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //Obter detalhes da conta de autenticação
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //Criar credencial para o usuário
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    //Logar
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
