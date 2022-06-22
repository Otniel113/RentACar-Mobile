//---------------------------------------------------------------------------------------------------------------------------------------------------------------------
import 'package:flutter/material.dart';
import '../api/api_login.dart';
import '../utils/validator.dart';

class LoginScreenArguments {
  LoginScreenArguments();
}

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleKembaliButton() {
    Navigator.pop(context);
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackbar =
        SnackBar(behavior: SnackBarBehavior.floating, content: Text(message));

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  String? _cekEmail(String? txt) {
    return cekEmail(txt);
  }

  String? _cekPassword(String? txt) {
    return cekPassword(txt);
  }

  @override
  Widget build(BuildContext context) {
    void _handleMasuk() async {
      if (_formKey.currentState!.validate()) {
        // If valid
        try {
          showDialog(
              context: context,
              builder: (context) => const Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(),
                    ),
                  ));
          await loginUser(_emailController.text, _passwordController.text);
          _showSnackBar(context, "Login Success");
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        } catch (err) {
          Navigator.pop(context);
          _showSnackBar(context, "$err");
        }
      }
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Rent A Car",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          const Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Email"),
                                      TextFormField(
                                        controller: _emailController,
                                        validator: _cekEmail,
                                        decoration: InputDecoration(
                                          enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 1.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2.0,
                                              )),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Password"),
                                      TextFormField(
                                        controller: _passwordController,
                                        validator: _cekPassword,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 1.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 2.0,
                                                )),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 12),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red)),
                                      onPressed: _handleMasuk,
                                      child: const Text(
                                        "Masuk",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Does not have account ? "),
                              InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, '/regist'),
                                  child: const Text(
                                    "Sign up !",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
