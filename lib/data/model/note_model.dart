class NoteModel {
  int? id;
  String? name;
  String? image;
  String? desc;
  String? type;

  NoteModel({this.id, this.name, this.image, this.desc, this.type});

  NoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    desc = json['desc'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['desc'] = desc;
    data['type'] = type;
    return data;
  }
}
