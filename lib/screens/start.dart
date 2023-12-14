import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class Start extends StatefulWidget {
  const Start({super.key});
  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  EdgeInsets padd = const EdgeInsets.symmetric(horizontal: 10, vertical: 20);

  LottieBuilder lottieLoader({required String link}) {
    return Lottie.network(animate: true, link);
  }

  LottieBuilder lottieCustomLoader(
      {required String link, double width = 0, double height = 0}) {
    return Lottie.network(animate: true, width: width, height: height, link);
  }

  Padding _textWriter({String text = '', TextStyle? style}) {
    return Padding(
      padding: padd,
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Container welcomeParagraph({String title = '', String text = ''}) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width / 5,
            maxWidth: MediaQuery.of(context).size.width / 1.40,
            minHeight: MediaQuery.of(context).size.height / 3),
        padding: padd,
        child: RichText(
          overflow: TextOverflow.visible,
          maxLines: 10,
          text: TextSpan(
            text: '$title\n',
            style: textTheme.headlineMedium,
            children: [
              TextSpan(text: '$text\n', style: textTheme.bodyMedium),
              TextSpan(
                text: 'Our DataFrame >',
                style: textTheme.bodyMedium?.copyWith(
                    color: Colors.blue, decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()..onTap = _launchDBURL,
              )
            ],
          ),
        ));
  }

  Future<void> _launchDBURL() async {
    Uri url =
        Uri.parse('https://www.kaggle.com/datasets/dhruvildave/spotify-charts');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Row _horizontalLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: welcomeParagraph(
              title: 'What Spoticharts does',
              text:
                  'Spoticharts is a website that is customized according to your musical tastes, allows you to discover related music and offers you the possibility to compare the popularity of songs and playlists over time, giving you a more complete and enriching music experience.'),
        ),
        ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: lottieLoader(
                link:
                    "https://assets2.lottiefiles.com/private_files/lf30_fjln45y5.json")),
      ],
    );
  }

  Column _verticalLayout() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      welcomeParagraph(
          title: 'What Spoticharts does',
          text:
              'Spoticharts is a website that is customized according to your musical tastes, allows you to discover related music and offers you the possibility to compare the popularity of songs and playlists over time, giving you a more complete and enriching music experience.'),
      lottieCustomLoader(
          width: MediaQuery.of(context).size.width / 5,
          height: MediaQuery.of(context).size.height / 5,
          link:
              "https://assets2.lottiefiles.com/private_files/lf30_fjln45y5.json")
    ]);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ListView(padding: padd, children: [
      _textWriter(
          style: theme.textTheme.headlineMedium,
          text: 'Hi, this is Spoticharts 👋'),
      _textWriter(
          style: theme.textTheme.headlineLarge,
          text:
              "Let's give a try to our page, we have many options to explore"),
      Divider(color: theme.primaryColor),
      (MediaQuery.sizeOf(context).width <= 700)
          ? _verticalLayout()
          : _horizontalLayout()
    ]);
  }
}
