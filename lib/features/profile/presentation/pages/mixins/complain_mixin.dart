part of '../complain/complain_page.dart';

mixin ComplainMixin on State<ComplainPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void disposeControllers() {
    _nameController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
  }

  @override
  void initState() {
    _nameController.text = localSource.fullName;
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
}
