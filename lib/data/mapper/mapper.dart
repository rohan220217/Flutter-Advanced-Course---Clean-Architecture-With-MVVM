import 'package:msa_internship/app/constants.dart';
import 'package:msa_internship/app/extensions.dart';
import 'package:msa_internship/data/responses/responses.dart';
import 'package:msa_internship/domain/model.dart';

// Customer mapper from data to domain
extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id?.orEmpty() ?? Constants.EMPTY,
      this?.name?.orEmpty() ?? Constants.EMPTY,
      this?.noOfNotifications.orZero() ?? Constants.ZERO,
    );
  }
}

// Contact mapper from data to domain
extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.phone?.orEmpty() ?? Constants.EMPTY,
      this?.link?.orEmpty() ?? Constants.EMPTY,
      this?.email?.orEmpty() ?? Constants.EMPTY,
    );
  }
}

// Authentication mapper from data to domain
extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        this?.customer?.toDomain(), this?.contacts?.toDomain());
  }
}
