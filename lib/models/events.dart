class Events {
  String id;
  String title;
  String description;
  String date;
  String time;
  String fee;
  String location;
  String image;
  List<String> images;
  Events({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.fee,
    required this.location,
    required this.image,
    this.images = const [],
  }
  );
}
