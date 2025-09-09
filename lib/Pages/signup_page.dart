import 'package:better_mood/Pages/login_page.dart';
import 'package:better_mood/Theme/Text%20Theme/text_theme.dart';
import 'package:better_mood/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPagState();
}

class _SignupPagState extends State<SignupPage> {

  //get auth service
  final authService = AuthService();

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  //sign up button pressed
  Future<void> _signUp() async{
    //prepare data
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    //matching pass check
    if(password != confirmPassword){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return;
    }

    //attempt sign up
    try{
      await authService.signUpWithEmailPassword(email, password);

      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered successfully")));
        Navigator.pop(context);
      }
      
    }
    catch(e){
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('image/login_bg.jpg', fit: BoxFit.cover,)),

          
          Center(
             child: Padding(
               padding: const EdgeInsets.all(16.0),
               child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Color(0xFFF7F2EF),
                  ),
                  
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        SizedBox(height: 60.0,),
                         Text('Sign up', 
                                  style: BTextTheme.lightTextTheme.headlineLarge?.copyWith(
                                    color: Color(0xFFE0C995),
                                  )
                                  
                            ),
                          
                        Text("Create a new account",
                              style: TextStyle(
                                fontFamily: 'Albert Sans',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF2E2521)
                              ),
                        ),
                                   
                        SizedBox(height: 30,),
                                   
                        Padding(
                          padding: const EdgeInsets.fromLTRB(38.0, 0.0, 26.0, 2.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Email",
                                  style: TextStyle(
                                    fontFamily: 'Albert Sans',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF2E2521)
                                  ),
                            ),
                          ),
                        ),
                        
                        //email text field
                        Padding(
                          padding: const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 16.0),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: 'your@mail.com',
                              filled: true,
                              fillColor: Color(0xFFD9D9D9),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Color(0xFFD9D9D9),)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Color(0xFFE0C995),)
                              )
                            ),
                          ),
                        ),
                                   
                        Padding(
                          padding: const EdgeInsets.fromLTRB(38.0, 0.0, 26.0, 2.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Pasword",
                                  style: TextStyle(
                                    fontFamily: 'Albert Sans',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF2E2521)
                                  ),
                            ),
                          ),
                        ),

                        //pass text field           
                        Padding(
                          padding: const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 10.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Enter your password',
                              filled: true,
                              fillColor: Color(0xFFD9D9D9),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Color(0xFFD9D9D9),)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Color(0xFFE0C995),)
                              )
                            ),
                          ),
                        ),

                        
                        //confirm pass text field           
                        Padding(
                          padding: const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 16.0),
                          child: TextField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Confirm your password',
                              filled: true,
                              fillColor: Color(0xFFD9D9D9),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Color(0xFFD9D9D9),)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Color(0xFFE0C995),)
                              )
                            ),
                          ),
                        ),
                    
                        //sign up button
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 5.0),
                          child: TextButton(
                            onPressed: _signUp, 
                            style: TextButton.styleFrom(
                              fixedSize: Size(290, 50),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
                              backgroundColor: Color(0xFFE0C995),
                              foregroundColor: Color(0xFFF7F2EF)
                            ),
                            child: Text('Sign up',
                                        style: TextStyle(
                                          fontFamily: 'Albert Sans',
                                          fontSize: 21.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.5,
                                          wordSpacing: 2.0
                                        ),
                            )
                            ),
                        ),
                                   
                        Padding(
                          padding: const EdgeInsets.fromLTRB(38.0, 0.0, 26.0, 2.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("or",
                                  style: TextStyle(
                                    fontFamily: 'Albert Sans',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF2E2521)
                                  ),
                            ),
                          ),
                        ),
                                   
                        // Sign up with google
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 2.0, 16.0, 5.0),
                          child: TextButton(
                            onPressed: (){}, 
                            style: TextButton.styleFrom(
                              fixedSize: Size(300, 30),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
                              backgroundColor: Color(0xFFC4C4A8),
                              foregroundColor: Color(0xFFF7F2EF)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.google),
                                   
                                SizedBox(width: 10,),
                                   
                                Text('Sign up with google',
                                        style: TextStyle(
                                          fontFamily: 'Albert Sans',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                            )
                              ],
                            )
                            ),
                        ),
                    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?',
                            style: TextStyle(
                              fontFamily: 'Albert Sans',
                              ),
                            ),
                            
                            SizedBox(width: 3,),
                    
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context) => LoginPage()));
                              },
                              child: Text('Log in',
                              style: TextStyle(
                                fontFamily: 'Albert Sans',
                                color: Color(0xFF6D88BF),
                                ),
                              ),
                            ),
                    
                          ],
                        ),
                                   
                        SizedBox(height: 60,),
                                   
                      ],
                    ),
                  ),
                ),
             ),
           ),

          SizedBox(height: 90),
        ],
      ),
    );
  }
}

