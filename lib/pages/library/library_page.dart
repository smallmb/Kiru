import 'package:zplay/l10n/l10n.dart';

import 'package:flutter/material.dart';

import '../../services/content/content_settings.dart';
import '../../services/download/download_service.dart';
import '../../services/my_list/my_list_service.dart';
import '../../widgets/common/segmented_tabs.dart';
import '../../widgets/common/animated_ambient_background.dart';
import '../downloads/downloads_page.dart';
import '../my_list/my_list_page.dart';

/// The two Library tabs. Declaration order is the switcher order and the stack
/// index at once, so one list drives both.
enum LibraryTab { myList, downloads }

extension LibraryTabX on LibraryTab {
  String get label {
    switch (this) {
      case LibraryTab.myList:
        return 'My List';
      case LibraryTab.downloads:
        return 'Downloads';
    }
  }

  Widget get page {
    switch (this) {
      case LibraryTab.myList:
        return const MyListPage(embedded: true);
      case LibraryTab.downloads:
        return const DownloadsPage(embedded: true);
    }
  }
}

/// The switcher's options, carrying the live count each tab's body holds.
///
/// The prototype labels the two tabs with their totals (`My List (8)`,
/// `Downloads (4)`), and `SegmentedTabs` draws a count under the label rather
/// than beside it, so the label text the tests match stays exactly `My List`.
List<SegmentedTabOption<LibraryTab>> _libraryTabOptions(BuildContext context) =>
    [
      for (final tab in LibraryTab.values)
        SegmentedTabOption<LibraryTab>(
          value: tab,
          icon: MediaQuery.sizeOf(context).width < 600
              ? null
              : tab == LibraryTab.myList
              ? Icons.bookmark_border_rounded
              : Icons.download_rounded,
          label: switch (tab) {
            LibraryTab.myList => l10nOf(context).libraryMyList,
            LibraryTab.downloads => l10nOf(context).libraryDownloads,
          },
          count: switch (tab) {
            LibraryTab.myList => MyListService.visibleItems.length,
            LibraryTab.downloads =>
              DownloadService.instance.tasksNotifier.value.length,
          },
        ),
    ];

/// Shared library chrome. Both tabs keep their own independent scroll state
/// and paint their contents underneath the same clipped glass overlay.
class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  LibraryTab _tab = LibraryTab.myList;

  @override
  Widget build(BuildContext context) {
    Widget tabs() => ListenableBuilder(
      listenable: Listenable.merge([
        MyListService.items,
        ContentSettings.adultEnabled,
        DownloadService.instance.tasksNotifier,
      ]),
      builder: (context, _) => SegmentedTabs<LibraryTab>(
        options: _libraryTabOptions(context),
        selected: _tab,
        onSelected: (tab) => setState(() => _tab = tab),
        semanticsLabel: l10nOf(context).librarySection,
        height: 48,
        inlineCounts: true,
      ),
    );
    return FocusTraversalGroup(
      child: AnimatedAmbientBackground(
        child: IndexedStack(
          index: _tab.index,
          children: [
            MyListPage(embedded: true, libraryTabs: tabs()),
            DownloadsPage(embedded: true, libraryTabs: tabs()),
          ],
        ),
      ),
    );
  }
}
