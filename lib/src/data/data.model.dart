class DataModel {
  String sType = "Date";
  String? dataTempo;

  DataModel({this.dataTempo});

  DataModel.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    dataTempo = json['iso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__type'] = this.sType;
    data['iso'] = this.dataTempo;
    return data;
  }
}
