
class CommonRequest {
  String? apiKey;

  CommonRequest({this.apiKey});

  CommonRequest.fromJson(Map<String, dynamic> json) {
    apiKey = json['api-key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api-key'] = apiKey;
    return data;
  }
}