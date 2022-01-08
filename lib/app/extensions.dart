// String extension for nullable
import 'package:msa_internship/app/constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.EMPTY;
    } else {
      return this!;
    }
  }
}

// Int extension for nullable
extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Constants.ZERO;
    } else {
      return this!;
    }
  }
}
