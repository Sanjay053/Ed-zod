class Course {
  final String id;
  final String name;
  final String author;
  final double ratings;
  final bool isFavorite;
  final double cost;
  final int chapters;
  final int hours;

  Course({
    required this.id,
    required this.name,
    required this.author,
    required this.ratings,
    required this.isFavorite,
    required this.cost,
    required this.chapters,
    required this.hours,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      author: json['author'],
      ratings: json['ratings'],
      isFavorite: json['isFavorite'],
      cost: json['cost'],
      chapters: json['chapters'],
      hours: json['hours'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'ratings': ratings,
      'isFavorite': isFavorite,
      'cost': cost,
      'chapters': chapters,
      'hours': hours,
    };
  }

}

List<Course> generateCourses() {
  return [
    Course(
      id: 'C1',
      name: 'Flutter Development',
      author: 'John Doe',
      ratings: 4.5,
      isFavorite: true,
      cost: 29.99,
      chapters: 10,
      hours: 15,
    ),
    Course(
      id: 'C2',
      name: 'React Native Essentials',
      author: 'Jane Smith',
      ratings: 4.0,
      isFavorite: false,
      cost: 19.99,
      chapters: 8,
      hours: 12,
    ),
    Course(
      id: 'C3',
      name: 'Python for Beginners',
      author: 'Michael Johnson',
      ratings: 4.2,
      isFavorite: true,
      cost: 24.99,
      chapters: 12,
      hours: 18,
    ),
    Course(
      id: 'C4',
      name: 'Data Structures in Java',
      author: 'Emma Brown',
      ratings: 4.8,
      isFavorite: false,
      cost: 34.99,
      chapters: 15,
      hours: 20,
    ),
    Course(
      id: 'C5',
      name: 'JavaScript Basics',
      author: 'David Lee',
      ratings: 4.3,
      isFavorite: true,
      cost: 22.99,
      chapters: 10,
      hours: 15,
    ),
    Course(
      id: 'C6',
      name: 'Machine Learning Fundamentals',
      author: 'Sophia Garcia',
      ratings: 4.6,
      isFavorite: false,
      cost: 39.99,
      chapters: 20,
      hours: 25,
    ),
    Course(
      id: 'C7',
      name: 'iOS App Development with Swift',
      author: 'Andrew Clark',
      ratings: 4.7,
      isFavorite: true,
      cost: 44.99,
      chapters: 18,
      hours: 22,
    ),
    Course(
      id: 'C8',
      name: 'HTML and CSS Mastery',
      author: 'Olivia Taylor',
      ratings: 4.2,
      isFavorite: false,
      cost: 29.99,
      chapters: 10,
      hours: 15,
    ),
    Course(
      id: 'C9',
      name: 'Backend Development with Node.js',
      author: 'William Anderson',
      ratings: 4.4,
      isFavorite: true,
      cost: 34.99,
      chapters: 15,
      hours: 20,
    ),
    Course(
      id: 'C10',
      name: 'Android App Development with Kotlin',
      author: 'Ethan Wilson',
      ratings: 4.5,
      isFavorite: false,
      cost: 39.99,
      chapters: 18,
      hours: 22,
    ),
  ];
}
