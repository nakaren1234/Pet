class UserprofileModel {
  // Field
  String name, detail, pathImage;

  //Method
  UserprofileModel(this.name, this.detail, this.pathImage);

  UserprofileModel.fromMap(Map<String, dynamic> map) {
    name = map['Name'];
    detail = map['Detail'];
    pathImage = map['PathImage'];
  }
}
