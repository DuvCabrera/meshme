class Event {
  int? id;
  String userEmail;
  String title;
  String category;

  Event(
    this.id, {
    required this.userEmail,
    required this.title,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_email': userEmail,
      'title': title,
      'category': category,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      map['id'] != null ? map['id'] as int : null,
      userEmail: map['user_email'] as String,
      title: map['title'] as String,
      category: map['category'] as String,
    );
  }
}
