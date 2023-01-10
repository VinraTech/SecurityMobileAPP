import 'package:flutter/material.dart';
import 'package:securityservice/Components/InputPasswordTextField.dart';
import 'package:securityservice/Components/InputTextField.dart';
import 'package:securityservice/Components/Round_Button.dart';
import 'package:securityservice/Components/Utils.dart';
import 'package:securityservice/Screens/MobileVerificationScreen.dart';
import 'package:securityservice/Utilities/AppNavigation.dart';
import 'package:securityservice/Utilities/TextHelper.dart';
import 'package:securityservice/Utilities/bloc_validation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    ValueNotifier obsecurePassword = ValueNotifier<bool>(true);
    ValueNotifier obsecureConfirmPassword = ValueNotifier<bool>(true);
    TextEditingController emailController =TextEditingController();
    TextEditingController passwordController =TextEditingController();
    TextEditingController confirmPasswordController =TextEditingController();

    FocusNode emailFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();
    FocusNode roundButtonFocusNode = FocusNode();
    FocusNode confirmPasswordFocusNode = FocusNode();
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
              Container(child: AppBoldFont(msg: 'Hi!', fontSize: 36,)),
              AppRegularFont(msg: 'Create a new account', fontSize: 16),
              SizedBox(
                height: height * 0.08,
              ),
              inputTextField( validation.emailAndMobile, emailController, TextInputType.emailAddress, 'Email Address', null, emailFocusNode, passwordFocusNode),
              SizedBox(
                height: height * 0.025,
              ),
              inputTextField( validation.emailAndMobile, emailController, TextInputType.phone, 'Mobile No.', null, emailFocusNode, passwordFocusNode),
              SizedBox(
                height: height * 0.025,
              ),
              inputPasswordTextField(obsecurePassword, null, passwordController, 'Password', passwordFocusNode, roundButtonFocusNode),
              SizedBox(
                height: height * 0.025,
              ),
              inputConfirmPasswordTextField(obsecureConfirmPassword, confirmPasswordController, 'Confirm Password', confirmPasswordFocusNode , roundButtonFocusNode),
              SizedBox(
                height: height * 0.07,
              ),
              RoundButton(
                  title: 'SIGN UP',
                  onPress: () {
                    roundButtonFocusNode;
                    navigationPush(context, MobileVerificationScreen());
                  }),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: InkWell(
                  onTap: (){},
                  child: AppBoldFont(msg: "Already have an account? Sign In", fontSize: 16,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
