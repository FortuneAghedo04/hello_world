import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignIn extends StatefulWidget {
 // method to give to the gesture dectector, instance of a method
  final VoidCallback showSignUp;
  const SignIn({Key? key, required this.showSignUp}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // TO CREATE CONTROLLER FOR THE TEXTFIELD
  final emailController= TextEditingController();
  final passwordController= TextEditingController();
  // TO CREATE FROM FOR THE USERNAME AND PASSWORD ERROR
  final GlobalKey<FormState> _key= GlobalKey<FormState>();
  String errormessage='';
  bool obscureText=true;

  // CREATING THE SIGNIN FUNCTION

  Future signin() async{
    setState((){

      errormessage='';
    });
    if(_key.currentState!.validate()){
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email:emailController.text.trim(), password: passwordController.text.trim());
      } catch (e){

        if (e is FirebaseAuthException){
          errormessage=e.message!;
        }
      }

    }
  }
  // TO DESPOSE OF THE CONTROLLERS
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        image:DecorationImage(
          image:AssetImage('assets/login.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:SafeArea(
          child:Form(
            key:_key,
            child: Center(
              child:SingleChildScrollView(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Hello Again!',style:TextStyle(fontWeight:FontWeight.bold,fontSize: 45.0)),
                    const SizedBox(height:50.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:23.0),
                      child: Container(
                        decoration:BoxDecoration(
                          color:Colors.grey[200],
                          border:Border.all(color:Colors.white),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child:Padding(
                          padding:const EdgeInsets.only(left:20.0),
                          child:TextFormField(
                            controller:emailController,
                            validator:validateEmail,
                            decoration:const InputDecoration(
                              border:InputBorder.none,
                              hintText:'Email',

                            ),
                          ),
                        ),

                      ),
                    ),
                    const SizedBox(height:10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:23.0),
                      child: Container(
                        decoration:BoxDecoration(
                          color:Colors.grey[200],
                          border:Border.all(color:Colors.white),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child:Padding(
                          padding:const EdgeInsets.only(left:20.0),
                          child:TextFormField(
                            controller: passwordController,
                            validator: validatepassword,
                            decoration:InputDecoration(
                              border:InputBorder.none,
                              hintText:'Password',
                              suffixIcon: IconButton(
                                icon:Icon(obscureText?Icons.visibility:Icons.visibility_off),
                                onPressed:(){
                                  setState((){
                                    obscureText=!obscureText;
                                  });
                                },

                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(errormessage,style: const TextStyle(color:Colors.red)),
                        ),
                    ),
                    const SizedBox(height: 15.0),
                    Padding(padding:const EdgeInsets.symmetric(horizontal: 25.0),
                     child: GestureDetector(
                       onTap: signin,
                       child: Container(
                         padding:const EdgeInsets.all(20.0),
                         decoration: BoxDecoration(
                           color: Colors.deepPurpleAccent,
                           borderRadius: BorderRadius.circular(12.0),
                         ),
                         child:const Center(
                          child:Text('Sign In',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20.0)),
                         ),
                       ),
                     ),
                    ),
                    const SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Not a member?', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 5.0),
                        GestureDetector(
                          onTap:widget.showSignUp,
                            child:const Text('Register now',
                                  style:TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                ),
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
String? validateEmail(String? formemail){
  if(formemail==null || formemail.isEmpty) {
    return 'E-mail address is required.';
  }
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex= RegExp(pattern);
  if(!regex.hasMatch(formemail)) {
    return'Invalid E-mail Address format.';
  }
  return null;
}
String? validatepassword(String? formpass){
  if(formpass==null || formpass.isEmpty) {
    return 'Password is required.';
  }
  String pattern= r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex= RegExp(pattern);
  if(!regex.hasMatch(formpass)) {
    return'''Password must be at least 8 characters,
        'include an uppercase letter, number and symbol.''';
  }
  return null;
}