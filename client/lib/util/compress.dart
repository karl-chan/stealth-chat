import 'dart:io';

import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';

class Compress {
  static Future<Uint8List> image(String path) async {
    return FlutterImageCompress.compressWithFile(path, quality: 50);
  }

  static Future<Uint8List> video(String path) async {
    MediaInfo mediaInfo = await VideoCompress.compressVideo(
      path,
      quality: VideoQuality.DefaultQuality,
    );
    return mediaInfo.file.readAsBytes();
  }

  static Future<Uint8List> audio(String path) async {
    return _ffmpeg(
      path,
      '${DateTime.now().millisecondsSinceEpoch}.m4a',
      ['-vn', '-acodec', 'copy'],
    );
  }

  static Future<Uint8List> _ffmpeg(
      String path, String outName, List<String> args) async {
    Directory tempDir = await getTemporaryDirectory();
    String outPath = join(tempDir.path, outName);

    FlutterFFmpeg ffmpeg = FlutterFFmpeg();
    List<String> fullArgs = ['-i', path, ...args, outPath];
    int returnCode = await ffmpeg.executeWithArguments(fullArgs);

    if (returnCode != 0) {
      return null;
    }

    File file = File(outPath);
    Uint8List bytes = await file.readAsBytes();
    await file.delete();
    return bytes;
  }
}
