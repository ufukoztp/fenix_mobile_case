

extension TextFormFieldValidator on String {


  String? minLenghtValidator({required int length}) {
    if (this.length <= length) {
      return "Arama yapabilmeniz için iki karakterden fazla girmelisiniz";
    }
    return null;
  }

}
