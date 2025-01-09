part of '../operator_register_page.dart';

class _SelectNameWidget extends StatelessWidget {
  const _SelectNameWidget(
      this.controller,
      this.focusNode,
      );

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) => CustomTextField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'enter_name'.tr();
      }
      return null;
    },
    autoValidateMode: AutovalidateMode.onUserInteraction,
    hintText: 'f_i_o'.tr(),
    controller: controller,
    focusNode: focusNode,
    labelText: 'f_i_o'.tr(),
    onChanged: (value) {},
  );
}

class _SelectEmailWidget extends StatelessWidget {
  const _SelectEmailWidget(
      this.controller,
      this.focusNode,
      );

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) => CustomTextField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'enter_email'.tr();
      } else if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
          .hasMatch(value)) {
        return 'enter_correct_email'.tr();
      }
      return null;
    },
    autoValidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    focusNode: focusNode,
    labelText: 'email'.tr(),
    onChanged: (value) {},
    hintText: 'enter_email'.tr(),
  );
}

class _SelectLoginWidget extends StatelessWidget {
  const _SelectLoginWidget(
      this.controller,
      this.focusNode,
      );

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) => CustomTextField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'input_username'.tr();
      }else if (value.length < 8) {
        return 'login_must_contain_at_least_6_characters'.tr();
      }
      return null;
    },
    autoValidateMode: AutovalidateMode.onUserInteraction,
    hintText: 'input_username'.tr(),
    controller: controller,
    focusNode: focusNode,
    labelText: 'add_login'.tr(),
    onChanged: (value) {},
  );
}

class _SelectPasswordWidget extends StatefulWidget {
  const _SelectPasswordWidget({
    required this.controller,
    required this.focusNode,
    required this.loginController,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final TextEditingController loginController;

  @override
  State<_SelectPasswordWidget> createState() => _SelectPasswordWidgetState();
}

class _SelectPasswordWidgetState extends State<_SelectPasswordWidget> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) => CustomTextField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'input_password'.tr();
      } else if (value.length < 8) {
        return 'password_error'.tr();
      }else if (value == widget.loginController.text) {
        return 'password_must_not_match_login'.tr();
      }
      return null;
    },
    autoValidateMode: AutovalidateMode.onUserInteraction,
    hintText: 'input_password'.tr(),
    controller: widget.controller,
    focusNode: widget.focusNode,
    labelText: 'password'.tr(),
    obscure: obscure,
    suffixIcon: IconButton(
      onPressed: () {
        setState(() {
          obscure = !obscure;
        });
      },
      icon: Icon(
        obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: context.color.greyText,
      ),
    ),
    onChanged: (value) {},
  );
}

class _SelectConfirmPasswordWidget extends StatefulWidget {
  const _SelectConfirmPasswordWidget({
    required this.controller,
    required this.confirmPasswordController,
    required this.focusNode,
  });

  final TextEditingController controller;
  final TextEditingController confirmPasswordController;
  final FocusNode focusNode;

  @override
  State<_SelectConfirmPasswordWidget> createState() =>
      _SelectConfirmPasswordWidgetState();
}

class _SelectConfirmPasswordWidgetState
    extends State<_SelectConfirmPasswordWidget> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) => CustomTextField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'enter_confirm_password'.tr();
      } else if (value != widget.confirmPasswordController.text) {
        return 'passwords_do_not_match'.tr();
      }
      return null;
    },
    autoValidateMode: AutovalidateMode.onUserInteraction,
    hintText: 'enter_confirm_password'.tr(),
    controller: widget.controller,
    focusNode: widget.focusNode,
    labelText: 'confirm_password'.tr(),
    obscure: obscure,
    suffixIcon: IconButton(
      onPressed: () {
        setState(() {
          obscure = !obscure;
        });
      },
      icon: Icon(
        obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: context.color.greyText,
      ),
    ),
    onChanged: (value) {},
  );
}
