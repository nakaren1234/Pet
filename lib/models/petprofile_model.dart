class PetprofileModel {
  //Field
  String age, breed, color, dob, gender, name, owner, weight, pathimage;
  //Method
  PetprofileModel(this.age, this.breed, this.color, this.dob, this.gender,
      this.name, this.owner, this.weight, this.pathimage);
  //setterให้ค่าข้างบนField
  PetprofileModel.formMap(Map<String, dynamic> map) {
    age = map['Age'];
    breed = map['Breed'];
    color = map['Color'];
    dob = map['Dob'];
    gender = map['Gender'];
    name = map['Name'];
    owner = map['Owner'];
    weight = map['Weight'];
    pathimage = map['Pathimage'];
  }
}
