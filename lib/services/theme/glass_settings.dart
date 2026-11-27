import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum GlassPreset {
  subtle('Subtle Glass'),
  standard('Balanced Liquid'),
  hyperJelly('Hyper Jelly'),
  crystalPrism('Crystal Prism'),
  frostedCyber('Frosted Cyber'),
  custom('Custom');

  final String label;
  const GlassPreset(this.label);
}

/// Global opt-in and customization engine for liquid-glass visual shaders & physics.
abstract final class GlassSettings {
  // Preference keys
  static const _keyEnabled = 'full_liquid_glass_enabled';
  static const _keyPreset = 'glass_preset';
  static const _keyHoverScale = 'glass_hover_scale';
  static const _keyWobbleIntensity = 'glass_wobble_intensity';
  static const _keyRefractionIndex = 'glass_refraction_index';
  static const _keyMagnification = 'glass_magnification';
  static const _keyChromaticAberration = 'glass_chromatic_aberration';
  static const _keyBlurSigma = 'glass_blur_sigma';
  static const _keyLightIntensity = 'glass_light_intensity';
  static const _keyBorderWidth = 'glass_border_width';

  // ValueNotifiers
  static final ValueNotifier<bool> enabled = ValueNotifier<bool>(false);
  static final ValueNotifier<GlassPreset> preset = ValueNotifier<GlassPreset>(
    GlassPreset.standard,
  );
  static final ValueNotifier<double> hoverScale = ValueNotifier<double>(1.15);
  static final ValueNotifier<double> wobbleIntensity = ValueNotifier<double>(
    1.0,
  );
  static final ValueNotifier<double> refractionIndex = ValueNotifier<double>(
    1.52,
  );
  static final ValueNotifier<double> magnification = ValueNotifier<double>(
    1.035,
  );
  static final ValueNotifier<double> chromaticAberration =
      ValueNotifier<double>(0.0022);
  static final ValueNotifier<double> blurSigma = ValueNotifier<double>(2.5);
  static final ValueNotifier<double> lightIntensity = ValueNotifier<double>(
    1.45,
  );
  static final ValueNotifier<double> borderWidth = ValueNotifier<double>(1.5);

  // Version counter to trigger rebuilding dependent widgets
  static final ValueNotifier<int> styleRevision = ValueNotifier<int>(0);

  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    enabled.value = prefs.getBool(_keyEnabled) ?? false;

    final presetStr = prefs.getString(_keyPreset);
    preset.value = GlassPreset.values.firstWhere(
      (p) => p.name == presetStr,
      orElse: () => GlassPreset.standard,
    );

    hoverScale.value = prefs.getDouble(_keyHoverScale) ?? 1.15;
    wobbleIntensity.value = prefs.getDouble(_keyWobbleIntensity) ?? 1.0;
    refractionIndex.value = prefs.getDouble(_keyRefractionIndex) ?? 1.52;
    magnification.value = prefs.getDouble(_keyMagnification) ?? 1.035;
    chromaticAberration.value =
        prefs.getDouble(_keyChromaticAberration) ?? 0.0022;
    blurSigma.value = prefs.getDouble(_keyBlurSigma) ?? 2.5;
    lightIntensity.value = prefs.getDouble(_keyLightIntensity) ?? 1.45;
    borderWidth.value = prefs.getDouble(_keyBorderWidth) ?? 1.5;
  }

  static Future<void> setEnabled(bool value) async {
    if (enabled.value == value) return;
    enabled.value = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyEnabled, value);
    _notifyChange();
  }

  static Future<void> applyPreset(GlassPreset p) async {
    preset.value = p;
    switch (p) {
      case GlassPreset.subtle:
        hoverScale.value = 1.06;
        wobbleIntensity.value = 0.5;
        refractionIndex.value = 1.25;
        magnification.value = 1.015;
        chromaticAberration.value = 0.0008;
        blurSigma.value = 1.5;
        lightIntensity.value = 1.1;
        borderWidth.value = 1.0;
        break;
      case GlassPreset.standard:
        hoverScale.value = 1.15;
        wobbleIntensity.value = 1.0;
        refractionIndex.value = 1.52;
        magnification.value = 1.035;
        chromaticAberration.value = 0.0022;
        blurSigma.value = 2.5;
        lightIntensity.value = 1.45;
        borderWidth.value = 1.5;
        break;
      case GlassPreset.hyperJelly:
        hoverScale.value = 1.30;
        wobbleIntensity.value = 2.2;
        refractionIndex.value = 1.75;
        magnification.value = 1.07;
        chromaticAberration.value = 0.0040;
        blurSigma.value = 3.5;
        lightIntensity.value = 1.9;
        borderWidth.value = 2.0;
        break;
      case GlassPreset.crystalPrism:
        hoverScale.value = 1.12;
        wobbleIntensity.value = 0.8;
        refractionIndex.value = 2.0;
        magnification.value = 1.055;
        chromaticAberration.value = 0.0065;
        blurSigma.value = 1.0;
        lightIntensity.value = 2.4;
        borderWidth.value = 2.2;
        break;
      case GlassPreset.frostedCyber:
        hoverScale.value = 1.18;
        wobbleIntensity.value = 1.2;
        refractionIndex.value = 1.40;
        magnification.value = 1.025;
        chromaticAberration.value = 0.0030;
        blurSigma.value = 6.5;
        lightIntensity.value = 1.6;
        borderWidth.value = 1.8;
        break;
      case GlassPreset.custom:
        break;
    }
    await _persistAll();
    _notifyChange();
  }

  static Future<void> updateCustom({
    double? newHoverScale,
    double? newWobbleIntensity,
    double? newRefractionIndex,
    double? newMagnification,
    double? newChromaticAberration,
    double? newBlurSigma,
    double? newLightIntensity,
    double? newBorderWidth,
  }) async {
    preset.value = GlassPreset.custom;
    if (newHoverScale != null) hoverScale.value = newHoverScale;
    if (newWobbleIntensity != null) wobbleIntensity.value = newWobbleIntensity;
    if (newRefractionIndex != null) refractionIndex.value = newRefractionIndex;
    if (newMagnification != null) magnification.value = newMagnification;
    if (newChromaticAberration != null)
      chromaticAberration.value = newChromaticAberration;
    if (newBlurSigma != null) blurSigma.value = newBlurSigma;
    if (newLightIntensity != null) lightIntensity.value = newLightIntensity;
    if (newBorderWidth != null) borderWidth.value = newBorderWidth;

    await _persistAll();
    _notifyChange();
  }

  static Future<void> resetToDefaults() async {
    await applyPreset(GlassPreset.standard);
  }

  static Future<void> _persistAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyPreset, preset.value.name);
    await prefs.setDouble(_keyHoverScale, hoverScale.value);
    await prefs.setDouble(_keyWobbleIntensity, wobbleIntensity.value);
    await prefs.setDouble(_keyRefractionIndex, refractionIndex.value);
    await prefs.setDouble(_keyMagnification, magnification.value);
    await prefs.setDouble(_keyChromaticAberration, chromaticAberration.value);
    await prefs.setDouble(_keyBlurSigma, blurSigma.value);
    await prefs.setDouble(_keyLightIntensity, lightIntensity.value);
    await prefs.setDouble(_keyBorderWidth, borderWidth.value);
  }

  static void _notifyChange() {
    styleRevision.value++;
  }
}
