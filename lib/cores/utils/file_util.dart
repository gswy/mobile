import 'dart:io';
import 'dart:math';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class FileUtil {
  FileUtil._();

  static Future<XFile> image(XFile input) async {
    const int targetBytes = 200 * 1024;

    final srcPath = input.path;
    final srcFile = File(srcPath);

    // 已经够小就不处理
    if (await srcFile.length() <= targetBytes) return input;

    final tempDir = await getTemporaryDirectory();

    String outPath(int round) => p.join(
      tempDir.path,
      'cmp_${DateTime.now().millisecondsSinceEpoch}_$round.jpg',
    );

    XFile? last; // ✅ 改成 XFile?

    // 初始尺寸不给限制（给一个很大的上限），后面再逐步缩小
    int curW = 4096;
    int curH = 4096;

    // 先把质量一路往下压（保证能很快变小）
    for (int q = 90, round = 0; q >= 5; q -= 5, round++) {
      final XFile? result = await FlutterImageCompress.compressAndGetFile(
        srcPath,
        outPath(round),
        quality: q,
        minWidth: curW,
        minHeight: curH,
        format: CompressFormat.jpeg,
      );

      if (result == null) break;
      last = result;

      final size = await File(result.path).length();
      if (size <= targetBytes) return result;
    }

    // 如果降到很低质量还不够，就开始不择手段缩分辨率（直到满足）
    for (int round = 100; round < 200; round++) {
      // ✅ basePath 用 last.path / input.path
      final basePath = (last ?? input).path;

      curW = max(16, (curW * 0.85).floor());
      curH = max(16, (curH * 0.85).floor());

      final XFile? result = await FlutterImageCompress.compressAndGetFile(
        basePath,
        outPath(round),
        quality: 10,
        minWidth: curW,
        minHeight: curH,
        format: CompressFormat.jpeg,
      );

      if (result == null) break;
      last = result;

      final size = await File(result.path).length();
      if (size <= targetBytes) return result;

      if (curW == 16 && curH == 16) {
        final XFile? result2 = await FlutterImageCompress.compressAndGetFile(
          result.path,
          outPath(round + 1000),
          quality: 1,
          minWidth: 16,
          minHeight: 16,
          format: CompressFormat.jpeg,
        );

        if (result2 != null && await File(result2.path).length() <= targetBytes) {
          return result2;
        }
        return result2 ?? result;
      }
    }

    // 兜底：返回最后一次压缩结果
    return last ?? input;
  }

  /// 从视频取第一帧 -> 压到 200KB -> 返回缩略图 XFile
  static Future<XFile> video(XFile input) async {
    final tempDir = await getTemporaryDirectory();

    // 1) 先把第一帧生成成 jpg 文件（timeMs=0 就是第一帧附近）
    final String? thumbPath = await VideoThumbnail.thumbnailFile(
      video: input.path,
      thumbnailPath: tempDir.path,
      imageFormat: ImageFormat.JPEG,
      timeMs: 0,
      quality: 100,
    );

    if (thumbPath == null) {
      // 极端情况下生成失败，抛错更好让上层处理
      throw Exception('Failed to generate video thumbnail.');
    }

    // 2) 用你现成的 image() 压缩到 200KB
    final XFile thumbXFile = XFile(thumbPath);
    final XFile compressedThumb = await image(thumbXFile);

    return compressedThumb;
  }


}

