import 'package:dartz/dartz.dart';

import 'package:muzeek/domain/core/vvo/validated_value_object.dart';

//
// #############################################################################
// #  Ver: 1.0 - last: 12/01/22
// #  Nullsafety
// #  Exemple of how to create a String Validated Value Object
// #############################################################################
class VoNameExemple extends ValueObject<String> {
  //
  // ===========================================================================
  VoNameExemple._(Either<List<ValueFailure<String>>, String> value)
      : super(value);
  //
  // ===========================================================================
  factory VoNameExemple({required String value}) {
    //
    final constrains = {
      StringConstrains.maxLength: 4,
      StringConstrains.singleLine: null,
      StringConstrains.otherValidation: {
        'function': (v) => v == 'Sid',
        'message': 'Nome precisa ser Sid',
      },
      StringConstrains.regex: RegExp(r'^[a-zA-Z]+$'),
    };
    //
    var validator = StringVOValidator(constrains: constrains);
    //
    var failures = validator.validate(value: value);
    //
    if (failures.isEmpty) return VoNameExemple._(right(value));
    //
    return VoNameExemple._(left(failures));
  }
}
// ******************************************************************
// *    _____   _   _____      _______   ______    _____   _    _
// *   / ____| | | |  __ \    |__   __| |  ____|  / ____| | |  | |
// *  | (___   | | | |  | |      | |    | |__    | |      | |__| |
// *   \___ \  | | | |  | |      | |    |  __|   | |      |  __  |
// *   ____) | |_| | |__| |      | |    | |____  | |____  | |  | |
// *  |_____/  (_) |_____/       |_|    |______|  \_____| |_|  |_|
// *
// *  ┈┈┈╭━━╮┈┈┈┈┈┈
// *  ┈┈╭╯┊◣╰━━━━╮┈┈
// *  ┈┈┃┊┊┊╱▽▽▽┛┈┈  -< Designed by Sedinir Consentini @ MMXXII >-
// *  ┈┈┃┊┊┊~~~   ┈┈┈┈        -< Rio de Janeiro - Brazil >-
// *  ━━╯┊┊┊╲△△△┓┈┈
// *  ┊┊┊┊╭━━━━━━╯┈┈   --->  May the source be with you!  <---
// *
// ******************************************************************