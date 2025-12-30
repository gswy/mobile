
import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/file/file_resp.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;

class FileApis {
  FileApis._();

  static final _http = Get.find<BaseHttp>();

  /// 上传图片
  static Future<FileResp?> uploadImage(XFile file, XFile head) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: file.name),
      'head': await MultipartFile.fromFile(head.path, filename: head.name)
    });
    try {
      return await _http.post<FileResp>('/file/image', data: formData, fromJson: FileResp.fromJson);
    } catch (_) {
      return null;
    }
  }

  /// 上传视频
  static Future<FileResp?> uploadVideo(XFile file, XFile head) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: file.name),
      'head': await MultipartFile.fromFile(head.path, filename: head.name)
    });
    try {
      return await _http.post<FileResp>('/file/video', data: formData, fromJson: FileResp.fromJson);
    } catch (_) {
      return null;
    }
  }

  /// 上传音频
  static Future<FileResp?> uploadVoice(XFile file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: file.name)
    });
    try {
      return await _http.post<FileResp>('/file/voice', data: formData, fromJson: FileResp.fromJson);
    } catch (_) {
      return null;
    }
  }


}