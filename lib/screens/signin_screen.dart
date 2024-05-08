import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInScreen extends StatefulWidget{

  static const routeName ='sign-in';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
  
}

class _SignInScreenState extends State<SignInScreen>{
    final _formkey = GlobalKey<FormState>();

    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();




  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: Container(
        decoration: const BoxDecoration(color : Colors.grey),
        child:Center(
          child: Padding(
            padding:const EdgeInsets.all(19.0),
          
          child: Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29),
              ),
            child: Padding(
              padding:const EdgeInsets.all(16),
              child:Form(
                key: _formkey,
              child: Column(
                mainAxisSize:MainAxisSize.min,
                children: [
                  const Text('Sign In'),

                  const SizedBox(height: 35),

                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      hintText: 'Enter your email',
                      ) ,
                    
                    ),

                    const SizedBox(height: 20),

                    TextFormField(
                     controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',

                      ) ,
                    obscureText: true,
                    ),


                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      )
                    ),
                     child: const Text('Sign In'),
                     
                     )
                ],
                ),
              ),
              ),
            ),
      ),
        ),
      ),
    );
  }
}