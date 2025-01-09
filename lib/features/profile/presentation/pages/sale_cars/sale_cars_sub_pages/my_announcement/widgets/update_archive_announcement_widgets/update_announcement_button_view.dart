part of '../../announcement_tab_pages/sub_pages/update_archive_announcement_page.dart';

class _UpdateArchiveAnnouncementButtonViewWidget extends StatelessWidget {
  const _UpdateArchiveAnnouncementButtonViewWidget({
    required this.formKey,
    required this.nameController,
    required this.descriptionController,
    required this.priceController,
    required this.phoneController,
    required this.updateAnnouncementBloc,
    required this.announcement,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController phoneController;
  final GetActiveInActiveAnnouncementListEntity announcement;
  final UpdateArchiveAnnouncementBloc updateAnnouncementBloc;

  @override
  Widget build(BuildContext context) => BlocBuilder<
          UpdateArchiveAnnouncementBloc, UpdateArchiveAnnouncementState>(
        builder: (context, state) => Material(
          color: context.colorScheme.surface,
          child: SafeArea(
            child: Padding(
              padding: AppUtils.kPaddingHor16Ver12,
              child: ElevatedButton(
                onPressed: state.selectedCurrency != null &&
                        state.selectedAddress != null &&
                        state.selectedCarType != null
                    ? () async {
                        if (formKey.currentState!.validate()) {
                          updateAnnouncementBloc.add(
                            const ChangeStatusEvent(),
                          );
                          final StringBuffer image = StringBuffer();
                          if (state.imageFile != null) {
                            await uploadFiles(state.imageFile!).then(
                              image.write,
                            );
                          }
                          updateAnnouncementBloc.add(
                            UpdateAnnouncementEvent(
                              updateAnnouncementRequest:
                                  CreateAndUpdateAnnouncementRequest(
                                data: Data(
                                  name: nameController.text,
                                  description: descriptionController.text,
                                  price: num.parse(priceController.text),
                                  contact:
                                      '+998${phoneController.text.replaceAll(' ', '')}',
                                  currencyId:
                                      state.selectedCurrency?.typeId ?? '',
                                  photo: image.toString().isEmpty
                                      ? announcement.imageUrl
                                      : image.toString(),
                                  vehicleTypeId:
                                      state.selectedCarType?.typeId ?? '',
                                  addressId:
                                      state.selectedAddress?.addressId ?? '',
                                  cityId: state.selectedAddress?.guid ?? '',
                                  status: ['active'],
                                  usersId: localSource.userId,
                                  madeDate: DateTime.now().toIso8601String(),
                                  saleId: '',
                                  guid: announcement.id,
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    : null,
                child: Text('publish'.tr()),
              ),
            ),
          ),
        ),
      );
}
