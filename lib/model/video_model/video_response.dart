import 'package:faturcodetestnttflutter/model/video_model/video.dart';

class VideoResponse {
  final List<VideoModel> videos;
  final String error;

  VideoResponse(this.videos, this.error);

  VideoResponse.fromJson(Map<String, dynamic> json)
      : videos = (json["results"] as List)
            .map((i) => VideoModel.fromJson(i))
            .toList(),
        error = "";

  VideoResponse.withError(String errorValue)
      : videos = [],
        error = errorValue;
}
