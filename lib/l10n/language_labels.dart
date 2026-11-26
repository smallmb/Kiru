import 'package:flutter/widgets.dart';
import '../utils/language_names.dart';

/// UI-only language names; provider language identity and grouping stay intact.
String localizedLanguageLabel(
  BuildContext context,
  String raw, {
  bool uppercaseFallback = false,
}) {
  final fallback = uppercaseFallback ? raw.toUpperCase() : raw;
  if (Localizations.localeOf(context).languageCode != 'zh' ||
      raw.trim().isEmpty)
    return fallback;
  final normalized = raw.trim().toLowerCase().replaceAll('_', '-');
  if (const {
    'zh-cn',
    'zh-hans',
    'chs',
    'simplified chinese',
    'chinese (simplified)',
  }.contains(normalized))
    return '简体中文';
  if (const {
    'zh-tw',
    'zh-hk',
    'zh-hant',
    'cht',
    'traditional chinese',
    'chinese (traditional)',
  }.contains(normalized))
    return '繁体中文';
  if (const {'und', 'unknown', 'undefined'}.contains(normalized)) return '未知语言';
  if (const {
    'mul',
    'multi',
    'multiple languages',
    'multi audio',
  }.contains(normalized))
    return '多语言';
  final name = subtitleLanguageName(raw);
  final codeLike = RegExp(
    r'^[a-z]{2,3}([-_][a-z0-9]{2,8})*$',
  ).hasMatch(normalized);
  if (!codeLike && normalized != name.toLowerCase()) return fallback;
  return const {
        'Arabic': '阿拉伯语',
        'English': '英语',
        'Spanish': '西班牙语',
        'French': '法语',
        'German': '德语',
        'Italian': '意大利语',
        'Japanese': '日语',
        'Korean': '韩语',
        'Russian': '俄语',
        'Portuguese': '葡萄牙语',
        'Portuguese (BR)': '巴西葡萄牙语',
        'Chinese': '中文',
        'Hindi': '印地语',
        'Turkish': '土耳其语',
        'Indonesian': '印度尼西亚语',
        'Vietnamese': '越南语',
        'Thai': '泰语',
        'Polish': '波兰语',
        'Dutch': '荷兰语',
        'Swedish': '瑞典语',
        'Norwegian': '挪威语',
        'Danish': '丹麦语',
        'Finnish': '芬兰语',
        'Hebrew': '希伯来语',
        'Czech': '捷克语',
        'Greek': '希腊语',
        'Hungarian': '匈牙利语',
        'Romanian': '罗马尼亚语',
        'Ukrainian': '乌克兰语',
        'Persian': '波斯语',
        'Croatian': '克罗地亚语',
        'Bulgarian': '保加利亚语',
        'Estonian': '爱沙尼亚语',
        'Malay': '马来语',
        'Tagalog': '他加禄语',
        'Filipino': '菲律宾语',
        'Bengali': '孟加拉语',
        'Urdu': '乌尔都语',
        'Tamil': '泰米尔语',
        'Telugu': '泰卢固语',
        'Macedonian': '马其顿语',
        'Slovenian': '斯洛文尼亚语',
        'Serbian': '塞尔维亚语',
        'Bosnian': '波斯尼亚语',
        'Albanian': '阿尔巴尼亚语',
        'Slovak': '斯洛伐克语',
        'Lithuanian': '立陶宛语',
        'Latvian': '拉脱维亚语',
        'Icelandic': '冰岛语',
        'Malayalam': '马拉雅拉姆语',
        'Catalan': '加泰罗尼亚语',
      }[name] ??
      fallback;
}
