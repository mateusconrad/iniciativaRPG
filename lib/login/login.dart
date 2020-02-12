import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rollini/login/userDetails.dart';

import '../home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final String title = "login";
  TextStyle style = TextStyle(fontSize: 20.0);

  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _authusuario = FirebaseAuth.instance;

  // ignore: unused_element
  Future<FirebaseUser> _signInWithGoogle() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    FirebaseUser userDetails =
    (await _authusuario.signInWithCredential(credential));
    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);
    print("Nome " + userDetails.displayName + "\n");
    print("Email " + userDetails.email + "\n");
    print("Photo URL" + userDetails.photoUrl + "\n");

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    // ignore: unused_local_variable
    UserDetails details = new UserDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
      providerData,
    );

    // ignore: unused_local_variable
    final user = UserDetails;
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(
        builder: (context) => new Mesas(), //userDetails: details
      ),
    );
    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: new Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 500,
                ),
                Container(
                    padding: EdgeInsets.only(right: 25, left: 25),
                    child: _textFieldLogin()),
                botaoLoginUsuario(),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ));
  }
//
  Text tituloApp() {
    return Text(
      "Help Task",
      style: TextStyle(
        fontSize: 24,
      ),
    );
  }

  GoogleSignInButton botaoLoginUsuario() {
    return GoogleSignInButton(
      text: "Entrar com Google",
      onPressed: () => _signInWithGoogle()
          .then((FirebaseUser user) => print(user))
          .catchError((e) => print(e)),
    );
  }

  TextField _textFieldLogin() {
    return TextField(
      textAlign: TextAlign.start,
      style: TextStyle(decoration: TextDecoration.none),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusColor: Colors.white,
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: "Cai pro fight nerd fedido",
        //hintStyle: klimeyFont.copyWith(letterSpacing: 1, fontSize: 14, textBaseline: TextBaseline.alphabetic),
        hasFloatingPlaceholder: true,
        contentPadding: EdgeInsets.only(top: 4, left: 10),
      ),
      textInputAction: TextInputAction.search,
      //controller: textEditingController,
      onChanged: (textEditingController) {},
      onSubmitted: (textEditingController) {},
    );
  }
}

