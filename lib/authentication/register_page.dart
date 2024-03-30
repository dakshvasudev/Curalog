import "package:curalog/components/async_builder.dart";
import "package:curalog/components/button.dart";
import "package:curalog/components/auth_text_field.dart";
import "package:curalog/components/global_snackbar.dart";
import "package:curalog/components/square_tile.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  Future<void> _signUserUp() async {
    Future.delayed(const Duration(seconds: 2));
    try {
      if (_password.text == _confirmPassword.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text, password: _password.text);
      } else {
        GlobalSnackBar.show(context,
            message: 'Passwords do not match!', type: SnackBarType.error);
      }
    } on FirebaseAuthException catch (e) {
      GlobalSnackBar.show(context,
          message: e.message!, type: SnackBarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // i was not able to figure out how can i change background color of my AdaptivePageScaffold so i use scaffold
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //TODO: replace it with app logo
              const Padding(
                padding: EdgeInsets.only(top: 50, bottom: 30),
                child: Center(
                  child: Icon(size: 100, Icons.healing),
                ),
              ),

              Text(
                'Let\'s create an account for you!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //email textfeild
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

              //confirm password textfeild
              AuthTextField(
                controller: _confirmPassword,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 25),

              // sign up button
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: AsyncBuilder(
                  future: _signUserUp,
                  builder: (onPressed, loading) => Button(
                    onPressed: onPressed,
                    loading: loading,
                    label: 'Sign Up',
                    variant: 'filled',
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
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

              const SizedBox(height: 36),

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

              const SizedBox(height: 36),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Alredy have an account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now',
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
