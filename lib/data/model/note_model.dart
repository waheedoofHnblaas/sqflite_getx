class NoteModel {
  int? id;
  int? fav;
  String? name;
  String? image;
  String? desc;
  String? type;

  NoteModel({this.id, this.name, this.image, this.desc, this.type});

  NoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fav = json['fav'];
    name = json['name'];
    image = json['image'];
    desc = json['desc'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['fav'] = fav;
    data['name'] = name;
    data['image'] = image;
    data['desc'] = desc;
    data['type'] = type;
    return data;
  }
}
