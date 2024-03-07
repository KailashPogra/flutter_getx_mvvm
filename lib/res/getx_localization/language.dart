import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'enter_email': "Enter email",
          'internet_exception':
              "We're unable to show results.\nplese check your data\n connection",
          'genral_exception':
              "We are unable to process your request.\n plese try again",
        },
      };
}
