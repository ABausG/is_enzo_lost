import 'package:intl/intl.dart';
import 'package:jaspr/jaspr.dart';
import '../status_service.dart';

class Home extends StatelessComponent {
  final StatusEntry status;

  const Home({super.key, required this.status});

  @override
  Component build(BuildContext context) {
    final isLost = status.isLost;
    return div(classes: 'page-container', [
      div(classes: 'main-content', [
        h2([
          text('Is '),
          a(href: 'https://x.com/enzoconty', [text('Enzo')]),
          text(' lost?'),
        ]),
        h1([
          text(
            isLost == null
                ? 'MAYBE 🤔'
                : isLost
                ? 'YES 😱'
                : 'NO 🎉',
          ),
        ]),
        p([
          text('Last update: '),
          a(href: status.source, target: Target.blank, [
            text(DateFormat.yMd().add_Hm().format(status.timestamp)),
          ]),
          if (status.source.contains('x.com') || status.source.contains('twitter.com'))
            blockquote(classes: 'twitter-tweet', [
              a(href: status.source.replaceFirst('x.com', 'twitter.com'), []),
            ]),
        ]),
      ]),
      footer(classes: 'page-footer', [
        p([text('Built with 💙 in the hope that at the end of the journey we can spend time with Enzo in person')]),
        a(href: 'https://github.com/abausg/is_enzo_lost', classes: 'github-link', [
          img(
            src: 'https://upload.wikimedia.org/wikipedia/commons/1/10/Codicons_–_github-inverted.svg',
            alt: 'GitHub',
            width: 24,
            height: 24,
          ),
        ]),
        a(href: 'https://jaspr.site', target: Target.blank, [
          JasprBadge.dark(),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Page layout
    css('.page-container').styles(
      display: Display.flex,
      minHeight: 100.vh,
      flexDirection: FlexDirection.column,
    ),

    // Main content
    css('.main-content', [
      css('&').styles(
        display: Display.flex,
        padding: Padding.symmetric(horizontal: 2.rem, vertical: 4.rem),
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.start,
        alignItems: AlignItems.center,
        flex: Flex.auto,
        textAlign: TextAlign.center,
      ),

      // Typography
      css('h1').styles(
        margin: Margin.zero,
        color: Colors.black,
        fontSize: 6.rem,
        fontWeight: FontWeight.w900,
      ),
      css('h2', [
        css('&').styles(
          margin: Margin.zero,
          color: Colors.black,
          fontSize: 3.rem,
          fontWeight: FontWeight.w500,
        ),
        css('a').styles(
          color: Color("0553B1"),
          textDecoration: TextDecoration.none,
        ),
      ]),
      css('p').styles(
        margin: Margin.only(top: Unit.zero, bottom: 2.rem),
        color: Color('#515151'),
        fontSize: 1.rem,
        fontWeight: FontWeight.w500,
      ),
      css('p a').styles(
        color: Color("#515151"),
      ),
    ]),

    // Footer base styles
    css('.page-footer', [
      css('&').styles(
        display: Display.flex,
        padding: Padding.all(2.rem),
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: Gap.all(1.rem),
        textAlign: TextAlign.center,
      ),
      css('p').styles(
        maxWidth: 80.percent,
        color: Color('#515151'),
        fontSize: 0.8.rem,
        raw: {
          'text-wrap': 'balance',
        },
      ),

      // Large screens: row layout, right aligned
      css.media(MediaQuery.screen(minWidth: 1024.px), [
        css('&').styles(
          flexDirection: FlexDirection.row,
          justifyContent: JustifyContent.end,
          alignItems: AlignItems.center,
        ),
        css('p').styles(
          maxWidth: 30.percent,
          margin: Margin.only(right: 1.rem),
          textAlign: TextAlign.end,
        ),
      ]),

      // Medium screens: row layout, centered
      css.media(MediaQuery.screen(minWidth: 768.px, maxWidth: 1023.px), [
        css('&').styles(
          flexDirection: FlexDirection.row,
          justifyContent: JustifyContent.end,
          alignItems: AlignItems.center,
          gap: Gap.all(0.75.rem),
        ),
        css('p').styles(
          maxWidth: 40.percent,
          flex: Flex.auto,
          textAlign: TextAlign.end,
        ),
      ]),
    ]),
  ];
}
