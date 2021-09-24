class Student{
  String? name;
  String? dob;
  String? gender;
  String? year;

  Student({this.name, this.dob, this.gender, this.year});

  generateNIM(){
    return name==null?null : '200102130919985';
  }
}