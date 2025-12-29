
import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/file/file_resp.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;

class FileApis {
  FileApis._();

  static final _http = Get.find<BaseHttp>();

  /// 上传图片
  static Future<String?> uploadImage(XFile file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: file.name)
    });
    try {
      final res = await _http.post<FileResp>('/file/image', data: formData, fromJson: FileResp.fromJson);
      return res?.filepath;
    } catch (_) {
      return null;
    }
  }

  /// 上传视频
  static Future<String?> uploadVideo(XFile file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: file.name)
    });
    try {
      final res = await _http.post<FileResp>('/file/video', data: formData, fromJson: FileResp.fromJson);
      return res?.filepath;
    } catch (_) {
      return null;
    }
  }

  /// 上传音频
  static Future<String?> uploadVoice(XFile file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: file.name)
    });
    try {
      final res = await _http.post<FileResp>('/file/voice', data: formData, fromJson: FileResp.fromJson);
      return res?.filepath;
    } catch (_) {
      return null;
    }
  }


}