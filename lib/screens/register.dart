import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';
import '../shared/themes.dart';
import '../widgets/loading_button.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController passwordConfirmationController =
      TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  bool isLoading = false;
  bool isHide = true;
  void _obscurePass() {
    setState(() {
      isHide = !isHide;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: successColor,
            content: const Text(
              'Berhasil register',
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else if (emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          passwordConfirmationController.text.isEmpty ||
          nameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: errorColor,
            content: const Text(
              'Nama, Email, dan Password harus diisi!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: errorColor,
            content: const Text(
              'email sudah terdaftar!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Selamat datang kembali!', style: titleTextStyle),
            const SizedBox(
              height: 2,
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama depan',
              style: regularTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: textColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 17,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: regularTextStyle,
                        controller: nameController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan nama depan anda',
                          hintStyle: regularTextStyle.copyWith(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat email',
              style: regularTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: textColor,
                  width: 1,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Row(
                  children: [
                    // Image.asset(
                    //   'assets/icon_email.png',
                    //   width: 17,
                    // ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email tidak boleh kosong';
                          }
                          return null;
                        },
                        style: regularTextStyle,
                        controller: emailController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan email anda',
                          hintStyle: regularTextStyle.copyWith(
                              fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: regularTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: textColor,
                  width: 1,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Row(
                  children: [
                    // Image.asset(
                    //   'assets/icon_password.png',
                    //   width: 17,
                    // ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          return '';
                        },
                        style: regularTextStyle,
                        obscureText: isHide,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Masukkan password anda',
                          hintStyle: regularTextStyle.copyWith(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isHide ? Icons.visibility : Icons.visibility_off,
                              color: textColor,
                            ),
                            onPressed: () {
                              _obscurePass();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordConfirmationInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Confirm Password',
              style: regularTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: textColor,
                  width: 1,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Row(
                  children: [
                    // Image.asset(
                    //   'assets/icon_password.png',
                    //   width: 17,
                    // ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          return '';
                        },
                        style: regularTextStyle,
                        obscureText: isHide,
                        controller: passwordConfirmationController,
                        decoration: InputDecoration(
                          hintText: 'Masukkan password anda',
                          hintStyle: regularTextStyle.copyWith(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isHide ? Icons.visibility : Icons.visibility_off,
                              color: textColor,
                            ),
                            onPressed: () {
                              _obscurePass();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () async {
            await handleSignUp();
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Sign Up',
            style: regularTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: bgColor,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30, top: 12),
        child: GestureDetector(
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun?',
                    style: regularTextStyle.copyWith(color: secondaryColor),
                  ),
                  Text(
                    ' masuk disini!',
                    style: regularTextStyle.copyWith(
                        fontWeight: FontWeight.w400, color: secondaryColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: ListView(
            children: [
              header(),
              nameInput(),
              emailInput(),
              passwordInput(),
              passwordConfirmationInput(),
              isLoading ? const LoadingButton() : signInButton(),
              const Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
