part of 'base_image_repository.dart';

class ImageRepository extends BaseImageRepository {
  final String baseUrl;
  final BaseApiClient apiClient;

  ImageRepository({required this.baseUrl, required this.apiClient});

  @override
  Future<List<Photos>?>? getAll() async {
    List<Photos> result = <Photos>[];
    Response? response;

    try {
      response = await apiClient.get(
        baseUrl + '/photos',
      );

      if (response?.data == null) throw Exception();
    } catch (e) {
      debugPrint('Error while hit api : $e');
      return null;
    }
    try {
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(response?.data);

      result = data.map((x) => Photos.fromJson(x)).toList();
    } catch (e) {
      debugPrint('Error while decode data : $e');
    }

    return result;
  }
}
