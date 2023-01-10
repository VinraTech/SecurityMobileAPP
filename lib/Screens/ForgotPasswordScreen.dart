import 'package:flutter/material.dart';
import 'package:securityservice/Components/InputPasswordTextField.dart';
import 'package:securityservice/Components/InputTextField.dart';
import 'package:securityservice/Components/Round_Button.dart';
import 'package:securityservice/Components/Utils.dart';
import 'package:securityservice/Screens/PhoneVerificationScreen.dart';
import 'package:securityservice/Utilities/AppNavigation.dart';
import 'package:securityservice/Utilities/TextHelper.dart';
import 'package:securityservice/Utilities/bloc_validation.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                height: height * 0.15,
              ),
              Container(child: AppBoldFont(msg: 'Forgot Password', fontSize: 36,)),
              AppRegularFont(msg: 'Enter your email/mobile no. for the verification process.', fontSize: 16),
              SizedBox(
                height: height * 0.08,
              ),
              inputTextField( validation.emailAndMobile, emailController, TextInputType.emailAddress, 'Mobile No. / Email Address', null, emailFocusNode, passwordFocusNode),
              SizedBox(
                height: height * 0.09,
              ),
              RoundButton(
                  title: 'CONTINUE',
                  onPress: () {
                    roundButtonFocusNode;
                    navigationPush(context, PhoneVerificationScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
