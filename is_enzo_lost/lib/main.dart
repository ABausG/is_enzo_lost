import 'package:jaspr/server.dart';

import 'app.dart';

import 'jaspr_options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultJasprOptions,
  );

  runApp(
    Document(
      title: 'Is Enzo Lost?',
      base: 'is_enzo_lost',
      styles: [
        css.import('https://fonts.googleapis.com/css?family=Inter:wght@400;500;600;700;900'),
        css('html, body').styles(
          width: 100.percent,
          minHeight: 100.vh,
          padding: Padding.zero,
          margin: Margin.zero,
          fontFamily: const FontFamily.list([FontFamily('Inter'), FontFamilies.sansSerif]),
        ),
      ],
      head: [
        script(async: true, src: 'https://platform.twitter.com/widgets.js', attributes: {'charset': 'utf-8'})
      ],
      body: App(),
    ),
  );
}
