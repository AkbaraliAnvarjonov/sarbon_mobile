import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/confirmation_user/confirmation_user_bloc.dart';
import 'sub_pages/confirm_otp/confirm_otp_page.dart';
import 'sub_pages/confirm_otp/page_arguments/otp_page_arguments.dart';
import 'sub_pages/confirm_phone_number/confirm_phone_number.dart';
import 'sub_pages/driver/driver_register_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    context.read<ConfirmationUserBloc>().add(const GetTrailerTypeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<ConfirmationUserBloc, ConfirmationUserState>(
          builder: (context, state) => PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ConfirmPhoneNumberPage(
                pageController: _pageController,
              ),
              ConfirmOtpPage(
                pageArguments: ConfirmOtpPageArguments(
                  phoneNumber: state.phoneNumber,
                  pageController: _pageController,
                ),
              ),
              // if (state.selectedRole?.roleId == Constants.roleDriverId)
              DriverRegisterPage(
                pageController: _pageController,
              )
              // else if (state.selectedRole?.roleId == Constants.roleOperatorId)
              //   OperatorRegisterPage(
              //     pageController: _pageController,
              //   ),
            ],
          ),
        ),
      );
}
