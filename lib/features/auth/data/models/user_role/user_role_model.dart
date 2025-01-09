import '../../../../../constants/constants.dart';

class UserRole {
  final String title;
  final String roleId;
  final String clientId;

  const UserRole({
    required this.title,
    required this.roleId,
    required this.clientId,
  });

  static List<UserRole> userRoles = [
    const UserRole(
      title: 'driver',
      roleId: Constants.roleDriverId,
      clientId: Constants.clientTypeDriverId,
    ),
    // const UserRole(
    //   title: 'dispatcher',
    //   roleId: Constants.roleOperatorId,
    //   clientId: Constants.clientTypeOperatorId,
    // ),
  ];
}
