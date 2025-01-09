part of '../../announcement_tab_pages/sub_pages/create_new_announcement_page.dart';

class _CreateAnnouncementButtonViewWidget extends StatelessWidget {
  const _CreateAnnouncementButtonViewWidget({
    required this.formKey,
    required this.nameController,
    required this.descriptionController,
    required this.priceController,
    required this.phoneController,
    required this.createAnnouncementBloc,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController phoneController;
  final CreateAnnouncementBloc createAnnouncementBloc;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CreateAnnouncementBloc, CreateAnnouncementState>(
        builder: (context, state) => Material(
          color: context.colorScheme.surface,
          child: SafeArea(
            child: Padding(
              padding: AppUtils.kPaddingHor16Ver12,
              child: ElevatedButton(
                onPressed: state.selectedCurrency != null &&
                        state.selectedAddress != null &&
                        state.selectedCarType != null &&
                        state.imageFile != null
                    ? state.createAnnouncementStatus.isLoading? (){} : () async {
                        if (formKey.currentState!.validate()) {
                          createAnnouncementBloc.add(
                            const ChangeStatusEvent(),
                          );
                          final StringBuffer image = StringBuffer();
                          if (state.imageFile != null) {
                            await uploadFiles(state.imageFile!).then(
                              image.write,
                            );
                          }
                          createAnnouncementBloc.add(
                            CreateAnnouncementEvent(
                              createAnnouncementRequest:
                                  CreateAndUpdateAnnouncementRequest(
                                data: Data(
                                  name: nameController.text,
                                  description: descriptionController.text,
                                  price: num.parse(priceController.text),
                                  contact:
                                      '+998${phoneController.text.replaceAll(' ', '')}',
                                  currencyId:
                                      state.selectedCurrency?.typeId ?? '',
                                  photo: image.toString(),
                                  vehicleTypeId:
                                      state.selectedCarType?.typeId ?? '',
                                  addressId:
                                      state.selectedAddress?.addressId ?? '',
                                  cityId: state.selectedAddress?.guid ?? '',
                                  status: ['active'],
                                  usersId: localSource.userId,
                                  madeDate: DateTime.now().toIso8601String(),
                                  saleId: '',
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    : null,
                child: Text('create'.tr()),
              ),
            ),
          ),
        ),
      );
}
