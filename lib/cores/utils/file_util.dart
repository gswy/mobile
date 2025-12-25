import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FileUtil {
  FileUtil._();

  static final ImagePicker _picker = ImagePicker();

  /// 相册选择图片
  static Future<XFile?> choseAlbum({
    int imageQuality = 85,
    double? maxWidth,
    double? maxHeight,
  }) async {
    final ok = await _ensureAlbumPermission();
    if (!ok) return null;
    return _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: imageQuality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
  }

  /// 拍摄照片
  static Future<XFile?> choseImage({
    int imageQuality = 85,
    double? maxWidth,
    double? maxHeight,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    final ok = await _ensureCameraPermission();
    if (!ok) return null;
    return _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: imageQuality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      preferredCameraDevice: preferredCameraDevice,
    );
  }

  /// 相册权限（优先 photos，必要时兼容 storage）
  static Future<bool> _ensureAlbumPermission() async {
    // 先尝试 photos（iOS & Android 13+）
    var status = await Permission.photos.status;
    if (status.isGranted || status.isLimited) return true;

    status = await Permission.photos.request();
    if (status.isGranted || status.isLimited) return true;

    // Android 12 及以下：有些机型/ROM photos 会一直 denied，这里兜底 storage
    var storage = await Permission.storage.status;
    if (storage.isGranted) return true;

    storage = await Permission.storage.request();
    if (storage.isGranted) return true;

    // 永久拒绝：引导去设置
    if (status.isPermanentlyDenied || storage.isPermanentlyDenied) {
      await openAppSettings();
    }
    return false;
  }

  /// 相机权限
  static Future<bool> _ensureCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) return true;

    status = await Permission.camera.request();
    if (status.isGranted) return true;

    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
    return false;
  }
}
