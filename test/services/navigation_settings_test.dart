import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zplay/services/content/navigation_settings.dart';
import 'package:zplay/pages/browse/browse_page.dart';
import 'package:zplay/services/content/content_settings.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    NavigationSettings.enabled.value = NavigationSettings.defaults;
    ContentSettings.adultEnabled.value = false;
  });
  test('fresh profile has only movies anime music', () async {
    await NavigationSettings.initialize();
    expect(visibleBrowseVerticals(), [
      BrowseVertical.moviesAndTv,
      BrowseVertical.anime,
      BrowseVertical.music,
    ]);
  });
  test('selection survives initialization and reset', () async {
    await NavigationSettings.setEnabled('books', true);
    await NavigationSettings.setEnabled('moviesAndTv', false);
    NavigationSettings.enabled.value = NavigationSettings.defaults;
    await NavigationSettings.initialize();
    expect(NavigationSettings.enabled.value, {'anime', 'music', 'books'});
    await NavigationSettings.reset();
    expect(NavigationSettings.enabled.value, NavigationSettings.defaults);
  });
  test('hidden route resolves to first visible module', () async {
    await NavigationSettings.setEnabled('moviesAndTv', false);
    expect(
      resolveBrowseVertical(BrowseVertical.moviesAndTv),
      BrowseVertical.anime,
    );
  });
  test('last content module cannot be disabled', () async {
    await NavigationSettings.setEnabled('moviesAndTv', false);
    await NavigationSettings.setEnabled('anime', false);
    await expectLater(
      NavigationSettings.setEnabled('music', false),
      throwsStateError,
    );
    expect(NavigationSettings.enabled.value, {'music'});
  });
  test('invalid stored IDs safely fall back to defaults', () async {
    SharedPreferences.setMockInitialValues({
      NavigationSettings.key: ['unknown'],
    });
    await NavigationSettings.initialize();
    expect(NavigationSettings.enabled.value, NavigationSettings.defaults);
  });
}
