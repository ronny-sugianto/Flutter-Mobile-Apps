part of 'base_launch_url_service.dart';

class LaunchUrlService extends BaseLaunchUrlService {
  @override
  Future<bool> open(String url) async {
    if (await launchUrl(Uri.parse(url))) {
      return true;
    } else {
      debugPrint('[LaunchUrlService] - Error launch url: $url');
      return false;
    }
  }

  @override
  Future<void> openWhatsApp(
    String phone, {
    String? message,
    Function? onError,
  }) async {
    try {
      if (phone.isEmpty) {
        return;
      }

      phone = phone.replaceAll('/', '');
      phone = phone.replaceAll('-', '');
      phone = phone.replaceAll('+', '');
      phone = phone.replaceAll(' ', '');

      if (phone.startsWith('0')) {
        String idNumber = '62${phone.substring(1)}';
        phone = idNumber;
      }

      String _waUrl = 'whatsapp://send?phone=$phone';
      String? _waResult;

      if (Platform.isIOS) {
        _waUrl = 'https://wa.me/$phone/';
      }

      if (message != null) {
        _waResult = _waUrl + '&text=' + message;

        if (Platform.isIOS) {
          _waResult = _waUrl + '?&text=' + Uri.encodeFull(message);
        }
      }

      if (!await open(_waResult ?? _waUrl)) {
        return;
      }
    } catch (e) {
      debugPrint('[LaunchUrlMixin] - Error While Open Whatsapp : $e');
      onError?.call(e);
    }
  }
}
