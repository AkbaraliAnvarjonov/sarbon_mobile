part of '../sale_cars_sub_pages/my_announcement/announcement_tab_pages/sub_pages/update_active_announcement_page.dart';

mixin UpdateActiveAnnouncementMixin on State<UpdateActiveAnnouncementPage> {
  late UpdateActiveAnnouncementBloc _updateActiveAnnouncementBloc;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();

  @override
  void initState() {
    _updateActiveAnnouncementBloc =
        context.read<UpdateActiveAnnouncementBloc>();
    setInitialValues();
    super.initState();
  }

  void setInitialValues() {
    nameController.text = widget.announcement.carName;
    descriptionController.text = widget.announcement.carDescription;
    priceController.text = widget.announcement.carPrice.toString();
    phoneController.text = widget.announcement.contact.substring(4);
    _updateActiveAnnouncementBloc
      ..add(
        SelectAddressSaleCarEvent(
          selectedAddress: AddressesListEntity(
            addressName: widget.announcement.addressIdData.addressName,
            addressId: widget.announcement.addressIdData.addressId,
            cityName: widget.announcement.addressIdData.cityName,
            guid: widget.announcement.addressIdData.cityId,
          ),
        ),
      )
      ..add(
        SelectCurrencyEvent(
          selectedCurrency: TypeCurrencyListEntity(
            typeId: widget.announcement.currencyIdData.id,
            typeName: widget.announcement.currencyIdData.name,
          ),
        ),
      )
      ..add(
        SelectCarTypeEvent(
          selectedCarType: TypeCarsListEntity(
            typeId: widget.announcement.vehicleTypeIdData.id,
            typeName: widget.announcement.vehicleTypeIdData.name,
          ),
        ),
      )
      ..add(
        UpdateAnnouncementStatusEvent(
          status: widget.announcement.status.first,
        ),
      );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
