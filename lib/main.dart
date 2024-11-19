import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/AuthService.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    AuthService as = new AuthService();
    if (FirebaseAuth.instance.currentUser == null) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
      child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                ),
              ),
        Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: "Password"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
      ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(as.login(email: emailController.text, password: passwordController.text));
                    setState(() {

                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill input')),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ),
          ),Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        as.registration(email: emailController.text, password: passwordController.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text('Register'),
                  ),
                ),
              ),
        ]),
    //     child: Column(
    //       children: [
    //         TextFormField(
    //           decoration: const InputDecoration(
    //             border: UnderlineInputBorder(),
    //             labelText: 'Enter your username',
    //           ),
    // ),
    //           TextFormField(
    //             obscureText: true,
    //             enableSuggestions: false,
    //             autocorrect: false,
    //             decoration: const InputDecoration(
    //               border: UnderlineInputBorder(),
    //               labelText: 'Enter your password',
    //
    //             ),
    //           ),
    //         TextButton(onPressed: login, child: child)
    //       ],
    //     ),
      ),
    ]), )
    ),),);
    }

    else {
        return Scaffold(
            appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text(widget.title),
    ),
    body: Center(
      child: Column(
        children: [
          Text("Logged in"),
          TextButton(onPressed: ()
          {
            as.logout();
            setState(() {
            });
            }, child: Text("Logout"))

        ]
      )
    ),
        );
    }
  }
}
