class Chapter {
  final String number;
  final String title;
  final String description;
  final String overview;

  Chapter({
    required this.number,
    required this.title,
    required this.description,
    required this.overview,
  });
}

List<Chapter> generateChapters() {
  return [
    Chapter(
      number: '1',
      title: 'Introduction to Flutter',
      description: 'Learn the basics of Flutter framework.',
      overview:
          'This chapter covers the introduction to Flutter, its history, and its advantages.',
    ),
    Chapter(
      number: '2',
      title: 'Building UIs with Widgets',
      description: 'Understand how to create user interfaces using widgets.',
      overview:
          'This chapter teaches you how to build beautiful user interfaces using Flutter widgets.',
    ),
    Chapter(
      number: '3',
      title: 'Managing State',
      description: 'Learn how to manage state in Flutter applications.',
      overview:
          'This chapter covers state management techniques in Flutter, including setState and Provider.',
    ),
    Chapter(
      number: '4',
      title: 'Networking and HTTP Requests',
      description: 'Explore networking and making HTTP requests in Flutter.',
      overview:
          'This chapter teaches you how to fetch data from APIs and handle network requests in Flutter.',
    ),
    Chapter(
      number: '5',
      title: 'Local Storage and Persistence',
      description: 'Learn how to store data locally on the device.',
      overview:
          'This chapter covers techniques for storing data locally on the device using SharedPreferences and SQLite.',
    ),
    Chapter(
      number: '6',
      title: 'Navigation and Routing',
      description: 'Understand how navigation works in Flutter applications.',
      overview:
          'This chapter teaches you how to navigate between screens and handle routing in Flutter apps.',
    ),
    Chapter(
      number: '7',
      title: 'Animations and Gestures',
      description: 'Explore animations and gesture handling in Flutter.',
      overview:
          'This chapter covers animations, gestures, and touch events in Flutter applications.',
    ),
    Chapter(
      number: '8',
      title: 'Platform Integration',
      description:
          'Learn how to integrate Flutter with platform-specific features.',
      overview:
          'This chapter teaches you how to access platform-specific features like camera, location, and sensors.',
    ),
    Chapter(
      number: '9',
      title: 'Testing and Debugging',
      description: 'Understand testing and debugging techniques in Flutter.',
      overview:
          'This chapter covers testing methodologies and debugging tools available in Flutter.',
    ),
    Chapter(
      number: '10',
      title: 'Deployment and Publishing',
      description: 'Learn how to deploy and publish your Flutter apps.',
      overview:
          'This chapter teaches you how to prepare and deploy Flutter apps to different platforms.',
    ),
  ];
}
