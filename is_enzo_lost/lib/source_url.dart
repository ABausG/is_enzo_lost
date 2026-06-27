final _xStatusUrlPattern = RegExp(
  r'(?:https?://)?(?:[\w-]+\.)*(?:x\.com|twitter\.com)/([^/?#]+)/status/(\d+)',
  caseSensitive: false,
);

({String username, String tweetId})? parseXStatusUrl(String url) {
  final match = _xStatusUrlPattern.firstMatch(url.trim());
  if (match == null) {
    return null;
  }

  return (username: match.group(1)!, tweetId: match.group(2)!);
}

bool isXStatusUrl(String url) => parseXStatusUrl(url) != null;
