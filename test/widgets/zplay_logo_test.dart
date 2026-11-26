import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zplay/widgets/common/zplay_logo.dart';

void main() {
  testWidgets('Kiru artwork preserves the requested dimensions', (
    tester,
  ) async {
    for (final size in <double>[16, 24, 26, 30, 32, 34, 64, 72]) {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(child: ZplayLogo(size: size)),
        ),
      );
      await tester.pump();
      expect(tester.getSize(find.byType(ZplayLogo)), Size(size, size));
      final image = tester.widget<Image>(
        find.descendant(
          of: find.byType(ZplayLogo),
          matching: find.byType(Image),
        ),
      );
      expect(image.image, isA<AssetImage>());
      expect((image.image as AssetImage).assetName, 'assets/icon_small.png');
      expect(image.fit, BoxFit.contain);
      expect(image.semanticLabel, 'Kiru');
    }
  });

  testWidgets('Kiru brand artwork does not change with theme', (tester) async {
    for (final mode in [ThemeMode.light, ThemeMode.dark]) {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: mode,
          home: const Center(child: ZplayLogo(size: 32)),
        ),
      );
      await tester.pump();
      final image = tester.widget<Image>(
        find.descendant(
          of: find.byType(ZplayLogo),
          matching: find.byType(Image),
        ),
      );
      expect((image.image as AssetImage).assetName, 'assets/icon_small.png');
      expect(image.color, isNull);
    }
  });
}
