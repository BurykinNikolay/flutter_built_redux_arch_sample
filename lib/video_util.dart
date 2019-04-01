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

  static String generateEncodeVideoScript(List<String> assets,
      String videoFilePath, String videoCodec, String customOptions) {
    String configurateString = "";

    assets.forEach((asset) {
      configurateString += asset + " " + "-loop 1 -i ";
    });

    print(configurateString);
    return "-hide_banner -y -loop 1 -i " +
        configurateString +
        " " +
        "-filter_complex " +
        "[0:v]setpts=PTS-STARTPTS,scale=w=\'if(gte(iw/ih,640/427),min(iw,640),-1)\':h=\'if(gte(iw/ih,640/427),-1,min(ih,427))\',scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,split=2[stream1out1][stream1out2];" +
        "[1:v]setpts=PTS-STARTPTS,scale=w=\'if(gte(iw/ih,640/427),min(iw,640),-1)\':h=\'if(gte(iw/ih,640/427),-1,min(ih,427))\',scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,split=2[stream2out1][stream2out2];" +
        "[2:v]setpts=PTS-STARTPTS,scale=w=\'if(gte(iw/ih,640/427),min(iw,640),-1)\':h=\'if(gte(iw/ih,640/427),-1,min(ih,427))\',scale=trunc(iw/2)*2:trunc(ih/2)*2,setsar=sar=1/1,split=2[stream3out1][stream3out2];" +
        "[stream1out1]pad=width=640:height=427:x=(640-iw)/2:y=(427-ih)/2:color=#00000000,trim=duration=3,select=lte(n\\,90)[stream1overlaid];" +
        "[stream1out2]pad=width=640:height=427:x=(640-iw)/2:y=(427-ih)/2:color=#00000000,trim=duration=1,select=lte(n\\,30)[stream1ending];" +
        "[stream2out1]pad=width=640:height=427:x=(640-iw)/2:y=(427-ih)/2:color=#00000000,trim=duration=2,select=lte(n\\,60)[stream2overlaid];" +
        "[stream2out2]pad=width=640:height=427:x=(640-iw)/2:y=(427-ih)/2:color=#00000000,trim=duration=1,select=lte(n\\,30),split=2[stream2starting][stream2ending];" +
        "[stream3out1]pad=width=640:height=427:x=(640-iw)/2:y=(427-ih)/2:color=#00000000,trim=duration=2,select=lte(n\\,60)[stream3overlaid];" +
        "[stream3out2]pad=width=640:height=427:x=(640-iw)/2:y=(427-ih)/2:color=#00000000,trim=duration=1,select=lte(n\\,30)[stream3starting];" +
        "[stream2starting][stream1ending]blend=all_expr=\'if(gte(X,(W/2)*T/1)*lte(X,W-(W/2)*T/1),B,A)\':shortest=1[stream2blended];" +
        "[stream3starting][stream2ending]blend=all_expr=\'if(gte(X,(W/2)*T/1)*lte(X,W-(W/2)*T/1),B,A)\':shortest=1[stream3blended];" +
        "[stream1overlaid][stream2blended][stream2overlaid][stream3blended][stream3overlaid]concat=n=5:v=1:a=0,scale=w=640:h=424,format=yuv420p[video]" +
        " -map [video] -vsync 2 -async 1 " +
        customOptions +
        "-c:v " +
        videoCodec +
        " -r 30 " +
        videoFilePath;
  }

  void _shareFile(String outputFilePath) async {
    var file = File(outputFilePath);
    ShareExtend.share(file.path, "file");
  }

  void testEncodeVideo(List<String> assets) {
    final String videoPath = "video.mp4";
    final String customOptions = "";
    final String ffmpegCodec = "mpeg4";
    VideoUtil.assetPath(videoPath).then((fullVideoPath) {
      execute(VideoUtil.generateEncodeVideoScript(
              assets, fullVideoPath, ffmpegCodec, customOptions))
          .then((rc) {
        _shareFile(fullVideoPath);
      });
    });
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
