import 'package:better_mood/Pages/homepage.dart';
import 'package:better_mood/Pages/signup_page.dart';
import 'package:better_mood/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  //get auth service
  final authService = AuthService();

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //login button pressed
  void login() async{
    //prepare data
    final email = _emailController.text;
    final password = _passwordController.text;

    //attempt login
    try{
      await authService.signInWithEmailPassword(email, password);

      if(mounted){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()));
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
                         Text('Login', 
                                  style: GoogleFonts.albertSans(
                                    textStyle: TextStyle(
                                    
                                    fontSize: 32,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.0,
                                    color: Color(0xFFE0C995),
                                  ),
                                  )
                            ),
                          
                        Text("Sign in to continue",
                              style: TextStyle(
                                
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
                                    
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF2E2521)
                                  ),
                            ),
                          ),
                        ),

                        //password text field           
                        Padding(
                          padding: const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 16.0),
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
                        
                        //sign in button
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 5.0),
                          child: TextButton(
                            onPressed: login, 
                            style: TextButton.styleFrom(
                              fixedSize: Size(290, 50),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
                              backgroundColor: Color(0xFFE0C995),
                              foregroundColor: Color(0xFFF7F2EF)
                            ),
                            child: Text('Sign in',
                                        style: TextStyle(
                                          
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
                                   
                                Text('Sign in with google',
                                        style: TextStyle(
                                          
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
                            Text('Don\'t have an account?',
                            style: TextStyle(
                              
                              ),
                            ),
                            
                            SizedBox(width: 3,),
                    
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignupPage()),
                              );
                              },
                              child: Text('Register now',
                              style: TextStyle(
                                
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