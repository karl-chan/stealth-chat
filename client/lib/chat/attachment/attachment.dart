import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stealth_chat/util/logging.dart';
import 'package:stealth_chat/util/security/aes.dart';
import 'package:stealth_chat/util/security/keys.dart';

part 'attachment.freezed.dart';

enum AttachmentType { none, photo, video, audio }

extension AttachmentTypes on AttachmentType {
  static AttachmentType fromExtension(String ext) {
    switch (ext) {
      case 'bmp':
      case 'jpg':
      case 'jpeg':
      case 'png':
        return AttachmentType.photo;
      case 'mp4':
      case 'mov':
        return AttachmentType.video;
      case 'aac':
      case 'mp3':
        return AttachmentType.audio;
      default:
        return AttachmentType.none;
    }
  }
}

@freezed
abstract class Attachment implements _$Attachment {
  const Attachment._();
  const factory Attachment(
      {AttachmentType type, String name, Uint8List value}) = _Attachment;

  Future<AesMessage> encode(Keys keys) async {
    Uint8List compressed;
    switch (type) {
      case AttachmentType.photo:
        logDebug('Original size: ${value.lengthInBytes / 1024} kB');
        compressed =
            await FlutterImageCompress.compressWithList(value, quality: 50);
        logDebug('Compressed size: ${compressed.lengthInBytes / 1024} kB');
        break;
      default:
        compressed = value;
    }
    Map<String, dynamic> m = {
      'type': this.type.index,
      'name': this.name,
      'value': base64Encode(compressed),
    };
    logDebug('Base 64 encoded');
    String json = jsonEncode(m);
    logDebug('JSON encoded');
    return Aes.encrypt(json, keys);
  }

  static Future<Attachment> decode(AesMessage aes, Keys keys) async {
    String decrypted = await Aes.decrypt(aes, keys);
    Map<String, dynamic> m = jsonDecode(decrypted);
    return Attachment(
        type: AttachmentType.values[m['type'] as int],
        name: m['name'],
        value: base64Decode(m['value']));
  }
}
