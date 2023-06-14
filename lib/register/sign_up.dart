import'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUp extends StatefulWidget {
  final VoidCallback showSignIn;
  const SignUp({Key? key, required this.showSignIn}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // TO CREATE CONTROLLER FOR THE TEXTFIELD
  final emailController= TextEditingController();
  final passwordController= TextEditingController();
  final confirmpasswordController= TextEditingController();
  final GlobalKey<FormState> _key= GlobalKey<FormState>();
  String errormessage='';
  bool _obscureText=true;
 
  Future Signup() async{
    setState((){

      errormessage='';
    });
    if(passwordconfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim());
    }
  
    if(_key.currentState!.validate()){
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email:emailController.text.trim(), password: passwordController.text.trim());
      } catch (e){

        if (e is FirebaseAuthException){
          errormessage=e.message!;
        }
      }
    
    }
  }
  bool passwordconfirmed(){
    if(passwordController.text.trim() == confirmpasswordController.text.trim()){
      return true;
    }else{
      return false;
    }
  }
  // TO DESPOSE OF THE CONTROLLERS
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
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
            child:Center(
              child: SingleChildScrollView(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Hello There',style:TextStyle(fontWeight:FontWeight.bold,fontSize: 45.0)),
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
                              validator: validateEmail,
                              controller: emailController,
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
                              validator: validatePassword,
                              obscureText:_obscureText,
                              controller: passwordController,
                              decoration:InputDecoration(
                                border:InputBorder.none,
                                hintText:'Password',
                                suffixIcon: IconButton(
                                  icon:Icon(_obscureText?Icons.visibility:Icons.visibility_off),
                                  onPressed:(){
                                    setState((){
                                      _obscureText=!_obscureText;
                                    });
                                  },

                                ),
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
                              validator: validatePassword,
                              controller: confirmpasswordController,
                              obscureText:_obscureText,
                              decoration:InputDecoration(
                                border:InputBorder.none,
                                hintText:'Confirm Password',
                                suffixIcon: IconButton(
                                  icon:Icon(_obscureText?Icons.visibility:Icons.visibility_off),
                                  onPressed:(){
                                    setState((){
                                      _obscureText=!_obscureText;
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
                        ) ,
                      ),

                      const SizedBox(height: 15.0),
                      Padding(padding:const EdgeInsets.symmetric(horizontal: 25.0),
                        child: GestureDetector(
                          onTap:Signup,
                          child: Container(
                            padding:const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child:const Center(

                              child:Text('Sign Up',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20.0)),
                            ),
                          ),
                        ),

                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('I am a member', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 5.0),
                          GestureDetector(
                            onTap: widget.showSignIn,
                              child:const Text('Login  now',
                                  style:TextStyle(color: Colors.blue,
                                      fontWeight: FontWeight.bold))
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
  if(formemail==null ||formemail.isEmpty) {
    return'E-mail address is required.';
  }
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex= RegExp(pattern);
  if(!regex.hasMatch(formemail)) {
    return'Invalid E-mail Address format.';
  }
  return null;
 }
String? validatePassword(String? formpass){
  if(formpass==null || formpass.isEmpty) {
    return'Password is required.';
  }
  String pattern= r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex= RegExp(pattern);
  if(!regex.hasMatch(formpass)) {
    return'''Password must be at least 8 characters,
        'include an uppercase letter, number and symbol.''';
  }
  return null;
}