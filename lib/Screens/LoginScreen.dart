import 'package:flutter/material.dart';
import 'package:securityservice/Components/InputPasswordTextField.dart';
import 'package:securityservice/Components/InputTextField.dart';
import 'package:securityservice/Components/Round_Button.dart';
import 'package:securityservice/Components/Utils.dart';
import 'package:securityservice/Screens/ForgotPasswordScreen.dart';
import 'package:securityservice/Screens/HomeScreen.dart';
import 'package:securityservice/Screens/SignUpScreen.dart';
import 'package:securityservice/Utilities/AppNavigation.dart';
import 'package:securityservice/Utilities/TextHelper.dart';
import 'package:securityservice/Utilities/bloc_validation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    ValueNotifier obsecurePassword = ValueNotifier<bool>(true);
    TextEditingController emailController =TextEditingController();
    TextEditingController passwordController =TextEditingController();

    FocusNode emailFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();
    FocusNode roundButtonFocusNode = FocusNode();
    final validation = ValidationBloc();

    @override
    void dispose(){
      super.dispose();

      emailController.dispose();
      passwordController.dispose();

      emailFocusNode.dispose();
      passwordFocusNode.dispose();

      obsecurePassword.dispose();
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 35, right: 35),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.14,
              ),
              Container(child: AppBoldFont(msg: 'Welcome!', fontSize: 36,)),
              AppRegularFont(msg: 'Sign in to continue', fontSize: 16),
              SizedBox(
                height: height * 0.08,
              ),
              inputTextField( validation.emailAndMobile, emailController, TextInputType.emailAddress, 'Mobile No. / Email Address', null, emailFocusNode, passwordFocusNode),
              SizedBox(
                height: height * 0.025,
              ),
              inputPasswordTextField(obsecurePassword, null, passwordController, 'Password', passwordFocusNode, roundButtonFocusNode),
              SizedBox(
                height: height * 0.07,
              ),
              RoundButton(
                  title: 'LOGIN',
                  onPress: () {
                    roundButtonFocusNode;
                    navigationPushReplacement(context, HomeScreen());
                  }),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: InkWell(
                  onTap: (){
                    navigationPush(context, ForgotPasswordScreen());
                  },
                  child: AppBoldFont(msg: "Forgot your password?", fontSize: 16,),
                ),
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Center(
                child: InkWell(
                  onTap: (){
                    navigationPush(context, SignUpScreen());
                  },
                  child: AppBoldFont(msg: "Don't have an account? Sign Up", fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
