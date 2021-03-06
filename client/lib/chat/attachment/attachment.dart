import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stealth_chat/util/security/aes.dart';
import 'package:stealth_chat/util/security/keys.dart';

part 'attachment.freezed.dart';

enum AttachmentType { none, photo, video, audio, other }

extension AttachmentTypes on AttachmentType {
  static AttachmentType fromExtension(String ext) {
    switch (ext.toLowerCase()) {
      case 'bmp':
      case 'jpg':
      case 'jpeg':
      case 'png':
        return AttachmentType.photo;
      case 'mp4':
      case 'mov':
        return AttachmentType.video;
      case 'aac':
      case 'm4a':
      case 'mp3':
      case 'm4a':
        return AttachmentType.audio;
      default:
        return AttachmentType.other;
    }
  }

  static AttachmentType parseInt(int value) {
    return AttachmentType.values[value];
  }

  Icon toIcon() {
    switch (this) {
      case AttachmentType.photo:
        return Icon(Icons.photo);
      case AttachmentType.video:
        return Icon(Icons.movie);
      case AttachmentType.audio:
        return Icon(Icons.audiotrack);
      case AttachmentType.other:
        return Icon(Icons.attach_file);
      default:
        return null;
    }
  }
}

@freezed
abstract class Attachment implements _$Attachment {
  const Attachment._();
  const factory Attachment(
      {AttachmentType type, String name, Uint8List value}) = _Attachment;

  Future<AesMessage> encode(Keys keys) async {
    Map<String, dynamic> m = {
      'type': this.type.index,
      'name': this.name,
      'value': base64Encode(value),
    };
    String json = jsonEncode(m);
    return Aes.encrypt(json, keys);
  }

  static Future<Attachment> decode(AesMessage aes, Keys keys) async {
    String decrypted = await Aes.decrypt(aes, keys);
    Map<String, dynamic> m = jsonDecode(decrypted);
    return Attachment(
        type: AttachmentTypes.parseInt(m['type'] as int),
        name: m['name'],
        value: base64Decode(m['value']));
  }
}
