import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:zplay/services/theme/fonts/font_cmap.dart';
import 'package:zplay/services/theme/fonts/font_registry.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('engine loads role aliases and preserves glyph widths', () async {
    final numeric = FontCmap(
      File('assets/fonts/kiru/SpaceGrotesk.ttf').readAsBytesSync(),
    );
    final latin = FontCmap(
      File('assets/fonts/kiru/Manrope.ttf').readAsBytesSync(),
    );
    final chinese = File('assets/fonts/kiru/NotoSansSC.ttf').readAsBytesSync();
    await (FontLoader('TestKiruNum')..addFont(
          Future.value(ByteData.sublistView(numeric.restrict(FontCmap.digit))),
        ))
        .load();
    await (FontLoader('TestKiruLatin')..addFont(
          Future.value(ByteData.sublistView(latin.restrict(FontCmap.latin))),
        ))
        .load();
    await (FontLoader(
      'TestKiruChinese',
    )..addFont(Future.value(ByteData.sublistView(chinese)))).load();
    double width(String text, String family, [List<String>? fallback]) {
      final painter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
            fontFamily: family,
            fontFamilyFallback: fallback,
            fontSize: 30,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      final value = painter.width;
      painter.dispose();
      return value;
    }

    const fallbacks = ['TestKiruLatin', 'TestKiruChinese'];
    expect(
      width('ABC', 'TestKiruNum', fallbacks),
      closeTo(width('ABC', 'TestKiruLatin'), 0.01),
    );
    expect(
      width('1234', 'TestKiruNum', fallbacks),
      closeTo(width('1234', 'TestKiruNum'), 0.01),
    );
    expect(
      width('中文', 'TestKiruNum', fallbacks),
      closeTo(width('中文', 'TestKiruChinese'), 0.01),
    );
  });

  FontCmap font(String name) =>
      FontCmap(File('assets/fonts/kiru/$name.ttf').readAsBytesSync());
  test('all bundled fonts support their intended role', () {
    expect(FontRegistry.supports(font('NotoSansSC'), FontRole.chinese), isTrue);
    expect(FontRegistry.supports(font('Manrope'), FontRole.latin), isTrue);
    expect(
      FontRegistry.supports(font('SpaceGrotesk'), FontRole.number),
      isTrue,
    );
    expect(FontRegistry.supports(font('GeistMono'), FontRole.timer), isTrue);
  });
  test('numeric alias retains digits only', () {
    final cmap = font('SpaceGrotesk');
    final filtered = FontCmap(cmap.restrict(FontCmap.digit));
    for (var i = 48; i <= 57; i++) {
      expect(filtered.glyph(i), cmap.glyph(i));
    }
    expect(filtered.glyph(65), 0);
    expect(filtered.glyph(0x4e2d), 0);
  });
  test('Latin alias excludes numbers and CJK; preserves Latin glyph IDs', () {
    final cmap = font('Manrope');
    final filtered = FontCmap(cmap.restrict(FontCmap.latin));
    expect(filtered.glyph(65), cmap.glyph(65));
    expect(filtered.glyph(97), cmap.glyph(97));
    expect(filtered.glyph(48), 0);
    expect(filtered.glyph(0x4e2d), 0);
  });
  test('timer alias preserves punctuation and numbers but not letters', () {
    final cmap = font('GeistMono');
    final filtered = FontCmap(cmap.restrict(FontCmap.timer));
    expect(filtered.glyph(58), cmap.glyph(58));
    expect(filtered.glyph(48), cmap.glyph(48));
    expect(filtered.glyph(65), 0);
  });
  test('invalid fonts are rejected', () {
    expect(() => FontCmap(Uint8List(64)), throwsFormatException);
  });
}
