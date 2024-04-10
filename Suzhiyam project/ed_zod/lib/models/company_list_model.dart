class Company {
  final String id;
  final String name;
  final String workingArea;
  final String? image;
  final String location;
  final int courseNumbers;

  Company({
    required this.id,
    required this.name,
    required this.workingArea,
    this.image,
    required this.location,
    required this.courseNumbers,
  });

    factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      workingArea: json['workingArea'],
      image: json['image'],
      location: json['location'],
      courseNumbers: json['courseNumbers'],
    );
  }
}


List<Company> generateCompanies() {
  return [
    Company(
      id: 'C1',
      name: 'ABC Company',
      workingArea: 'IT, Consulting',
      image:'https://picsum.photos/200',
      location: 'New York',
      courseNumbers: 200,
    ),
    Company(
      id: 'C2',
      name: 'XYZ Tech',
      workingArea: 'Technology',
      image:'https://picsum.photos/201',
      location: 'San Francisco',
      courseNumbers: 150,
    ),
    Company(
      id: 'C3',
      name: 'Tech Solutions Inc.',
      workingArea: 'Software Development',
      image:'https://picsum.photos/202',
      location: 'Seattle',
      courseNumbers: 180,
    ),
    Company(
      id: 'C4',
      name: 'Innovate IT Services',
      workingArea: 'IT Solutions',
      image:'https://picsum.photos/203',
      location: 'Chicago',
      courseNumbers: 220,
    ),
    Company(
      id: 'C5',
      name: 'Bright Minds Consulting',
      workingArea: 'Consulting',
      image:'https://picsum.photos/204',
      location: 'Los Angeles',
      courseNumbers: 190,
    ),
    Company(
      id: 'C6',
      name: 'Global Tech Systems',
      workingArea: 'Technology Solutions',
      image:'https://picsum.photos/205',
      location: 'Houston',
      courseNumbers: 210,
    ),
    Company(
      id: 'C7',
      name: 'Software Solutions Ltd.',
      workingArea: 'Software Services',
      image:'https://picsum.photos/206',
      location: 'Boston',
      courseNumbers: 170,
    ),
    Company(
      id: 'C8',
      name: 'Tech Innovations',
      workingArea: 'Innovative Technology',
      image:'https://picsum.photos/207',
      location: 'Austin',
      courseNumbers: 230,
    ),
    Company(
      id: 'C9',
      name: 'Digital Strategies Inc.',
      workingArea: 'Digital Solutions',
      image:'https://picsum.photos/208',
      location: 'Miami',
      courseNumbers: 160,
    ),
    Company(
      id: 'C10',
      name: 'IT Experts Corporation',
      workingArea: 'IT Services',
      image:'https://picsum.photos/209',
      location: 'Dallas',
      courseNumbers: 240,
    ),
  ];
}
