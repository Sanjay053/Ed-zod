class OnboardingInfo {
  final String title;
  final String image;
  final String body;

  OnboardingInfo({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnboardingData {
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: 'Unlimited educational resources',
        image: 'assets/images/slide_img1.png',
        body: 'Get access to unlimited educational books \n and articles'),
    OnboardingInfo(
        title: 'Shape Your Future With Job \n Opportunities',
        image: 'assets/images/slide_img2.png',
        body: 'Get access to unlimited educational books \n and articles'),
    OnboardingInfo(
        title: 'Best Products With Best Price',
        image: 'assets/images/slide_img3.png',
        body: 'Track your daily learning activites with a \n single click'),
  ];
}
