part of '../sale_cars_sub_pages/my_announcement/announcement_tab_pages/sub_pages/create_new_announcement_page.dart';

mixin CreateNewAnnouncementMixin on State<CreateNewAnnouncementPage> {
  late CreateAnnouncementBloc _createAnnouncementBloc;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();


  @override
  void initState() {
    _createAnnouncementBloc = context.read<CreateAnnouncementBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
