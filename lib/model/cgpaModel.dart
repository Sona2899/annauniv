class Cgpa {
  String documentId;
  List<String> regulation = new List<String>();
  List<String> department = new List<String>();
  List<String> semester = new List<String>();
  Cgpa({this.documentId, this.regulation, this.department, this.semester});

  Map<String, dynamic> toMap() {
    return {
      'documentId': documentId,
      'regulation': regulation,
      'department': department,
      'semester': semester
    };
  }

  static Cgpa fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;
    // print(map['categoryName']);
    return Cgpa(
        regulation: map['regulation'],
        department: map['department'],
        semester: map['semester'],
        documentId: documentId);
  }
}
