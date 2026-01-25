import 'package:crypto_exchange_mobile_app/constant/app_path.dart';

class OnboardingData {
  final String title;
  final String description;
  final String imagePath;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  static final List<OnboardingData> onboardingPages = [
    OnboardingData(
      title: 'Take hold of your\nfinances',
      description: 'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.',
      imagePath: AppPath.imgPerson,
    ),
    OnboardingData(
      title: 'Smart trading tools',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.',
      imagePath: AppPath.imgChart,
    ),
    OnboardingData(
      title: 'Invest in the future',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.',
      imagePath: AppPath.imgComputer,
    ),
  ];
}