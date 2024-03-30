import "package:curalog/components/async_builder.dart";
import "package:curalog/components/button.dart";
import "package:curalog/components/auth_text_field.dart";
import "package:curalog/components/global_snackbar.dart";
import "package:curalog/components/square_tile.dart";
import "package:curalog/config/theme/theme.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //creating controllers(data) for text feilds
  final _email = TextEditingController();
  final _password = TextEditingController();

  Future<void> _signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);
    } on FirebaseAuthException catch (e) {
      GlobalSnackBar.show(context,
          message: e.message!, type: SnackBarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //TODO: replace it with app logo
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Icon(
                  Icons.medical_services,
                  color: colors(context).primary.s500,
                  size: 110,
                ),
              ),

              Text('Welcome back!', style: typography(context).strongSmallBody),

              const SizedBox(
                height: 20,
              ),

              //_email textfeild
              AuthTextField(
                controller: _email,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //password textfeild
              AuthTextField(
                controller: _password,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 10,
              ),

              //forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: typography(context).subtitle2.copyWith(
                            color: colors(context).onSurface.s500,
                          ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: AsyncBuilder(
                  future: _signUserIn,
                  builder: (onPressed, loading) => Button(
                    onPressed: onPressed,
                    loading: loading,
                    label: 'Sign In',
                    variant: 'filled',
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // google + apple sign in buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SquareTile(imagePath: 'assets/icons/google_logo.png'),

                  SizedBox(width: 25),

                  // apple button
                  SquareTile(imagePath: 'assets/icons/apple_logo.png')
                ],
              ),

              const SizedBox(height: 40),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
