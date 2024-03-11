import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_form.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_gred_button_large.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/login_view/log_in_controller.dart';
import 'package:flutter_templete/ui/views/sign_up_view/sign_up_view.dart';
import 'package:get/get.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            screenHeight(20).ph,
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: screenWidth(3),
                height: screenHeight(3),
              ),
            ),
            Text(
              'login',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            screenHeight(20).ph,
            CustomTextFormField(
              suffixi: Icon(
                Icons.email_outlined,
                color: AppColors.mainBlueEpin,
              ),
              hintText: 'Your Email',
              fillColor: AppColors.mainGrey,
              hintTextColor: AppColors.mainBlueEpin,
              controller: controller.emailController,
              validator: (value) {
                if (value!.isEmpty || !isEmail(value)) {
                  return 'please check your email';
                }
                return null;
              },
            ),
            screenHeight(20).ph,
            Obx(
              () => CustomTextFormField(
                obscureText: !controller.passwordVisible.value,
                suffixi: InkWell(
                  onTap: () {
                    controller.hidePassword(
                      password: controller.passwordVisible,
                      value: controller.passwordVisible.value,
                    );
                  },
                  child: controller.passwordVisible.value
                      ? Icon(
                          Icons.visibility,
                          color: AppColors.mainBlueEpin,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: AppColors.mainBlueEpin,
                        ),
                ),
                hintText: 'Your password',
                fillColor: AppColors.mainGrey,
                hintTextColor: AppColors.mainBlueEpin,
                controller: controller.passwordController,
                validator: (value) {
                  if (value!.isEmpty || !isPassword(value)) {
                    return 'please check your password';
                  }
                  return null;
                },
              ),
            ),
            screenHeight(20).ph,
            CustomGred(
              onTap: () {
                controller.login();
              },
              text: 'Login',
              color: AppColors.mainBlueColorE,
            ),
            screenHeight(20).ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(13)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'You don\'t have any account ? ',
                    style: TextStyle(
                      color: AppColors.mainblack,
                      fontSize: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(SignUpView());
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainBlueColorE,
                          fontSize: 20,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
