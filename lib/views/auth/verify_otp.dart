import 'package:aoun/data/network/data_response.dart';
import 'package:aoun/data/providers/auth_provider.dart';
import 'package:aoun/views/auth/forget_password.dart';
import 'package:aoun/views/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/views/auth/sign_up_screen.dart';
import '/views/home/main_screen.dart';
import '/views/shared/button_widget.dart';
import '/views/shared/shared_components.dart';
import '/views/shared/shared_values.dart';
import '/views/shared/text_field_widget.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key, required this.isSignUp}) : super(key: key);
  final bool isSignUp;
  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  late List<TextEditingController> controllers;

  @override
  void initState() {
    controllers = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    super.initState();
  }

  @override
  void dispose() {
    for (var element in controllers) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Column(
        children: [
          SharedComponents.appBar(title: "Verification code "),
          Expanded(
              child: ListView(
            children: [
              SizedBox(
                  height: 200,
                  child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(SharedValues.padding),
                        child: Text(
                          "Please enter the verification code sent for the number:\n\n phone"
                              .replaceAll(
                                  RegExp(r'phone'),
                                  Provider.of<AuthProvider>(context,
                                              listen: false)
                                          .user
                                          ?.phone
                                          .toString() ??
                                      "+966XXXXXXXXX"),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ))),
              const SizedBox(height: SharedValues.padding),
              Row(
                children: [
                  for (var controller in controllers)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(SharedValues.padding),
                        child: TextFieldWidget(
                            controller: controller,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            contentPadding: EdgeInsets.zero,
                            textInputAction: controller == controllers.last
                                ? TextInputAction.done
                                : TextInputAction.next,
                            onChanged: (str) {
                              if (str.length == 1 &&
                                  controller != controllers.last) {
                                debugPrint("index");
                                FocusScope.of(context).nextFocus();
                              } else if (controller == controllers.last) {
                                FocusScope.of(context).unfocus();
                              }
                            }),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: SharedValues.padding * 2),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: SharedValues.padding),
                child: ButtonWidget(
                  minWidth: double.infinity,
                  onPressed: () async {
                    final provider=Provider.of<AuthProvider>(context, listen: false);
                    Result result =
                        await
                        provider.verifyCode(controllers.map((e) => e.text).join(),widget.isSignUp);
                    if (result is Success) {
                      if(!widget.isSignUp) {
                        await  provider.changePassword();
                      }
                      // ignore: use_build_context_synchronously
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                              (_) => false);
                    } else {
                      // ignore: use_build_context_synchronously
                      SharedComponents.showSnackBar(context, "OTP not Correct");
                    }

                    // if (_formKey.currentState!.validate()) {}
                  },
                  child: Text(
                    "Verify",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(SharedValues.padding),
                child: Row(
                  children: [
                    Text("The code has not arrived",
                        style: Theme.of(context).textTheme.bodyMedium),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => widget.isSignUp?const SignUpScreen():const ForgetPassword()));
                      },
                      child: Text("Resend the code?",
                          style: Theme.of(context).textTheme.headlineSmall),
                    )
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
