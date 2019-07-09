/*
*  Filename    :   password_crypto.dart
*  Purpose     :	 Use for SHA-512 encryption
*  Created     :   2019-07-04 12:44 by Detective Conan
*  Updated     :   2019-07-09 17:37 by Detective conan
*  Changes     :   Implemented SHA-512 algorithm
*/

import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/digests/sha512.dart';

class PasswordCrypto {
  String sha512(String text) {
        var sha512 = SHA512Digest();
    var utf8List = sha512.process(utf8.encode(text));
    return formatBytesAsHexString(utf8List);
  }

  String formatBytesAsHexString(Uint8List bytes) {
    var result = new StringBuffer();
    for( var i=0 ; i<bytes.lengthInBytes ; i++ ) {
      var part = bytes[i];
      result.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
    }
    return result.toString();
  }

}
