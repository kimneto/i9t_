class DataModel {
  String? sType;
  String? iso;

  DataModel({this.sType, this.iso});

  DataModel.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    iso = json['iso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__type'] = this.sType;
    data['iso'] = this.iso;
    return data;
  }
}
