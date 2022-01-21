class PointerModel {
  String __type = "Pointer";
  String? className;
  String? objectId;

  PointerModel({
    required this.className,
    required this.objectId,
  });

  PointerModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    className = json['className'];
    __type = json['__type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['className'] = this.className;
    data['__type'] = this.__type;
    return data;
  }
}
