import 'package:netflix/model/response.dart';

List<ShowResponse> filter({
  required List<ShowResponse> data,
  required String category,
}) {
  return data.where((d) {
    if (category == "webChannel") {
      return d.show?.webChannel != null;
    } else if (category == "network") {
      return d.show?.network != null;
    }
    return false;
  }).toList();
}
