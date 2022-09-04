import 'package:diaco/Component/custom_text_field.dart';
import 'package:diaco/Utils/pref_manager.dart';
import 'package:diaco/Utils/validators.dart';
import 'package:diaco/pages/message_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(80),
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(10)),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  labelText: "Name",
                  hintText: "Arash shakibaee",
                  icon: Icons.person_rounded,
                  controller: nameController,
                  validator: Validators.nameValidator(context),
                  onSaved: (String? value) {
                    name = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  labelText: "Email Address",
                  hintText: "yourEmail@gmail.com",
                  icon: Icons.mail_rounded,
                  controller: emailController,
                  validator: Validators.emailValidator(context),
                  onSaved: (String? value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        final String username = nameController.text;
                        final String email = emailController.text;
                        PrefManager.setUsername(username);
                        PrefManager.setEmailAddress(email);
                        final form = _formKey.currentState?.validate();
                        if (form != null && form) {
                          Navigator.pushNamed(context, MessageScreen.routeName);
                        }
                      },
                      child: const Text("Submit")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
