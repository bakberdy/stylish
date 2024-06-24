
abstract class OnboardScreenData {
  static Map<String, String> onboard_1 = {
    'title': 'Choose Products',
    'text':
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    'picture_path': 'assets/images/onboard_screen_img/onboard_img_1.svg'
  };
  static Map<String, String> onboard_2 = {
    'title': 'Make Payment',
    'text':
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    'picture_path': 'assets/images/onboard_screen_img/onboard_img_2.svg'
  };
  static Map<String, String> onboard_3 = {
    'title': 'Get Your Order',
    'text':
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    'picture_path': 'assets/images/onboard_screen_img/onboard_img_3.svg'
  };

  static List<Map<String, String>> getOnboardData() {
    return [onboard_1, onboard_2, onboard_3];
  }
}
