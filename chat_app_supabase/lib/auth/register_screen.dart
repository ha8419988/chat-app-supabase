import 'package:chat_app_supabase/auth/login_screen.dart';
import 'package:chat_app_supabase/config/constants/colors.dart';
import 'package:chat_app_supabase/config/constants/divider.dart';
import 'package:chat_app_supabase/provider/auth/auth_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/sliver_sized_box.dart';
import '../../widget/social_button.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: const RegisterView(),
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  void toLoginScreen({required BuildContext context}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: bgColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: bgColor,
          body: CustomScrollView(
            slivers: [
              SliverSizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * .04,
                    ),
                    // buildImageTitle(),
                    SizedBox(
                      height: size.height * .05,
                    ),

                    ///text welcome
                    buildTextWelcome(context),
                    SizedBox(
                      height: size.height * .02,
                    ),

                    ///edit text email
                    buildEditTextBox(context, size)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text buildTextWelcome(BuildContext context) {
    return Text(
      "Become a member!",
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  AspectRatio buildImageTitle() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Image.asset(
        'assets/images/chat_image.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Padding buildEditTextBox(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefault),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your name",
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.grey),
          ),
          Consumer<AuthProvider>(
            builder: (context, value, child) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.1),
                  borderRadius: BorderRadius.circular(kDefault),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: kDefault / 2),
                          child: TextFormField(
                            onChanged: (it) => value.onUserNameChange(it),
                            decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: kDefault / 2),
                        child: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: size.height * .02,
          ),

          Text(
            "E-mail address",
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.grey),
          ),
          Consumer<AuthProvider>(
            builder: (context, value, child) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.1),
                  borderRadius: BorderRadius.circular(kDefault),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: kDefault / 2),
                          child: TextFormField(
                            onChanged: (it) => Provider.of<AuthProvider>(
                                    context,
                                    listen: false)
                                .onEmailChange(it),
                            decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: kDefault / 2),
                        child: Icon(
                          Icons.email_outlined,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: size.height * .02,
          ),

          ///password
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Password",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey),
              ),
              Text(
                "Forgot password",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey),
              ),
            ],
          ),
          Consumer<AuthProvider>(
            builder: (context, value, child) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.1),
                  borderRadius: BorderRadius.circular(kDefault),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: kDefault / 2),
                          child: TextFormField(
                            onChanged: (it) => Provider.of<AuthProvider>(
                                    context,
                                    listen: false)
                                .onPasswordChange(it),
                            decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: kDefault / 2),
                        child: Icon(
                          Icons.visibility_outlined,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),

          ///remember me
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CupertinoCheckbox(value: true, onChanged: (it) {}),
              Text(
                "Remember me",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Row(
            children: [
              const Expanded(
                  child: Divider(
                thickness: 1,
              )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: kDefault),
                child: const Text("or"),
              ),
              const Expanded(
                  child: Divider(
                thickness: 1,
              ))
            ],
          ),
          SizedBox(
            height: size.height * .02,
          ),

          ///button social login
          Row(
            children: [
              const Spacer(),
              SocialButton(
                color: Colors.blueAccent,
                iconData: Icons.facebook,
                onTap: () {},
              ),
              SocialButton(
                color: Colors.black,
                iconData: Icons.apple,
                onTap: () {},
              ),
              SocialButton(
                color: Colors.red,
                iconData: Icons.g_mobiledata_sharp,
                onTap: () {},
              ),
              const Spacer()
            ],
          ),
          SizedBox(
            height: size.height * .06,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefault),
            child: ElevatedButton(
              onPressed: () {
                final auth = Provider.of<AuthProvider>(context, listen: false);
                auth.onSignUp(success: () {
                  ///register success
                  print(
                      'register successes :${auth.authResponse.session?.toJson()}');
                }, failure: () {
                  ///register error
                  print('register error');
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kDefault))),
              child: const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create on account",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: kDefault,
                  ),
                  Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have on account ?",
                  style: Theme.of(context).textTheme.bodySmall),
              InkWell(
                onTap: () => toLoginScreen(context: context),
                child: Text(
                  "  Signin",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.blue),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * .01,
          ),
        ],
      ),
    );
  }
}
