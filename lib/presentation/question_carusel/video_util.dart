import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class VideoUtil {
  final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();

  static const String VIDEO_1 = "1.mp4";

  static Future<Directory> get tempDirectory async {
    return await getTemporaryDirectory();
  }

  static Future<File> copyFileAssets(String assetName, String localName) async {
    final ByteData assetByteData = await rootBundle.load(assetName);

    final List<int> byteList = assetByteData.buffer
        .asUint8List(assetByteData.offsetInBytes, assetByteData.lengthInBytes);

    final String fullTemporaryPath =
        join((await tempDirectory).path, localName);

    return new File(fullTemporaryPath)
        .writeAsBytes(byteList, mode: FileMode.writeOnly, flush: true);
  }

  static Future<String> assetPath(String assetName) async {
    return join((await tempDirectory).path, assetName);
  }

  static String generateEncodeVideoScript(
      List<String> assets,
      String videoFilePath,
      String videoCodec,
      String customOptions,
      String outputMap) {
    String configurateString = "";

    for (String asset in assets) {
      if (asset.contains(".mp4")) {
        configurateString += "-i " + asset + " ";
      } else {
        configurateString += "-loop 1 -t 3 -i " + asset + " ";
      }
    }

    print(configurateString);
    return configurateString +
        customOptions +
        "-c:v " +
        videoCodec +
        " -r 30 " +
        outputMap +
        videoFilePath;
  }

  Future encodeVideo(List<String> assets) async {
    String assetsSettings = "";
    int index = 0;

    // var test = _assets[1];

    // await VideoUtil.copyFileAssets(test, VIDEO_1)
    //     .then((path) => print('Loaded asset $path.'));
    // List<String> assets = [];

    // await VideoUtil.assetPath(VIDEO_1).then((image1Path) {
    //   assets = [_assets[0], image1Path];
    // });

    assets.forEach((asset) {
      final int i = index;
      if (index != assets.length - 1) {
        assetsSettings += "[$i:v]scale=w=375:h=812[${i}v];";
      } else {
        assetsSettings += "[$i:v]scale=w=375:h=812[${i}v];";
      }

      index += 1;
    });

    index = 0;

    assets.forEach((asset) {
      final int i = index;

      if (asset.contains(".mp4")) {
        assetsSettings += "[${i}v][$i:a]";
      } else {
        assetsSettings += "[${i}v][${assets.length}:a]";
      }

      index += 1;
    });

    final String videoPath = "video.mp4";
    final String customOptions =
        "-f lavfi -t 0.1 -i anullsrc=channel_layout=stereo:sample_rate=44100 -filter_complex ${assetsSettings}concat=n=${assets.length}:v=1:a=1[outv][outa] ";
    final String outputMap = "-map [outv] -map [outa] ";
    final String ffmpegCodec = "mpeg4";
    print(customOptions);
    VideoUtil.assetPath(videoPath).then((fullVideoPath) {
      _clearDirectory(fullVideoPath);
      execute(VideoUtil.generateEncodeVideoScript(
              assets, fullVideoPath, ffmpegCodec, customOptions, outputMap))
          .then((rc) async {
        if (rc != 0) {
          print("error in video coding: $rc");
        } else {
          _shareFile(fullVideoPath);
        }
      });
    });
  }

  void _shareFile(String outputFilePath) async {
    var file = File(outputFilePath);
    ShareExtend.share(file.path, "file");
  }

  void _clearDirectory(String outputFilePath) {
    var dir = new Directory(outputFilePath);
    try {
      dir.deleteSync(recursive: true);
    } catch (e) {
      print(e.toString());
    }
  }

  void statisticsCallback(int time, int size, double bitrate, double speed,
      int videoFrameNumber, double videoQuality, double videoFps) {
    print(
        "Statistics: time: $time, size: $size, bitrate: $bitrate, speed: $speed, videoFrameNumber: $videoFrameNumber, videoQuality: $videoQuality, videoFps: $videoFps");
  }

  Future<String> getFFmpegVersion() async {
    return await _flutterFFmpeg.getFFmpegVersion();
  }

  Future<String> getPlatform() async {
    return await _flutterFFmpeg.getPlatform();
  }

  Future<int> executeWithArguments(List arguments) async {
    return await _flutterFFmpeg.executeWithArguments(arguments);
  }

  Future<int> execute(String command) async {
    return await _flutterFFmpeg.execute(command);
  }

  Future<int> executeWithDelimiter(String command, String delimiter) async {
    return await _flutterFFmpeg.execute(command, delimiter);
  }

  Future<void> cancel() async {
    return await _flutterFFmpeg.cancel();
  }

  Future<void> disableRedirection() async {
    return await _flutterFFmpeg.disableRedirection();
  }

  Future<int> getLogLevel() async {
    return await _flutterFFmpeg.getLogLevel();
  }

  Future<void> setLogLevel(int logLevel) async {
    return await _flutterFFmpeg.setLogLevel(logLevel);
  }

  Future<void> enableLogs() async {
    return await _flutterFFmpeg.enableLogs();
  }

  Future<void> disableLogs() async {
    return await _flutterFFmpeg.disableLogs();
  }

  Future<void> enableStatistics() async {
    return await _flutterFFmpeg.enableStatistics();
  }

  Future<void> disableStatistics() async {
    return await _flutterFFmpeg.disableStatistics();
  }

  Future<Map<dynamic, dynamic>> getLastReceivedStatistics() async {
    return await _flutterFFmpeg.getLastReceivedStatistics();
  }

  Future<void> resetStatistics() async {
    return await _flutterFFmpeg.resetStatistics();
  }

  Future<void> setFontconfigConfigurationPath(String path) async {
    return await _flutterFFmpeg.setFontconfigConfigurationPath(path);
  }

  Future<void> setFontDirectory(
      String fontDirectory, Map<String, String> fontNameMap) async {
    return await _flutterFFmpeg.setFontDirectory(fontDirectory, fontNameMap);
  }

  Future<String> getPackageName() async {
    return await _flutterFFmpeg.getPackageName();
  }

  Future<List<dynamic>> getExternalLibraries() async {
    return await _flutterFFmpeg.getExternalLibraries();
  }

  Future<int> getLastReturnCode() async {
    return await _flutterFFmpeg.getLastReturnCode();
  }

  Future<String> getLastCommandOutput() async {
    return await _flutterFFmpeg.getLastCommandOutput();
  }

  Future<Map<dynamic, dynamic>> getMediaInformation(String path) async {
    return await _flutterFFmpeg.getMediaInformation(path);
  }
}
