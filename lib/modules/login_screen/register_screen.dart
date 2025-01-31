import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:get/get.dart';
import 'package:wanderly/services/auth_controller.dart';
import 'package:wanderly/utils/colors.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final AuthController _authService = AuthController();

  Future<void> signup() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Erro", "As senhas não coincidem.",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    isLoading.value = true;
    _authService.register(
      nameController.text,
      emailController.text,
      passwordController.text,
    );
    isLoading.value = false;
  }
}

class SignupScreen extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
      ),
      backgroundColor: secondaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Cadastro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 20),
              _buildTextField(
                  controller.nameController, Ionicons.person, 'Nome'),
              SizedBox(height: 20),
              _buildTextField(
                  controller.emailController, Ionicons.mail, 'Email'),
              SizedBox(height: 20),
              _buildTextField(
                controller.passwordController,
                Ionicons.lock_closed,
                'Senha',
                isObscure: true,
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller.confirmPasswordController,
                Ionicons.lock_closed,
                'Confirmar Senha',
                isObscure: true,
              ),
              SizedBox(height: 30),
              Obx(
                () => Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: quinaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed:
                        controller.isLoading.value ? null : controller.signup,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: controller.isLoading.value
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Cadastrar',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 70),
              Align(
                alignment: Alignment.bottomCenter,
                child: _buildFooterLogo(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'assets/logo/logo.jpg',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          'Wanderly',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
      TextEditingController controller, IconData icon, String labelText,
      {bool isObscure = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border.all(
          color: quaternaryColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          icon: Icon(icon, color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
