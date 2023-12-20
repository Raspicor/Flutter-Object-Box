import 'package:objectbox/objectbox.dart';

@Entity()
class UserEntity {
  int id = 0;

  @Index()
  String userId;
  String userName;
  String? userImageUrl;
  String deptName;
  String tenantName;
  String? userEmail;
  String? userIntel;
  String? userMtel;

  bool expired = false;

  UserEntity(
      {this.userId = "",
      this.userName = "",
      this.userImageUrl,
      this.deptName = "",
      this.tenantName = "",
      this.userEmail,
      this.userIntel,
      this.userMtel,
      this.expired = false});
}
