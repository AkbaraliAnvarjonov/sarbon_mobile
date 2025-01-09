part of '../edit_profile/edit_profile_page.dart';

mixin EditProfileMixin on State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void initControllers() {
    nameController.text = localSource.fullName;
    emailController.text = localSource.email;
    phoneNumberController.text = localSource.phoneNumber;
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    loginController.dispose();
    passwordController.dispose();
  }
}
