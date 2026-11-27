import 'dart:typed_data';

/// Routes glyphs by script without touching the original font file.
/// Only the in-memory SFNT cmap is replaced.
class FontCmap {
  FontCmap(Uint8List bytes) : data = ByteData.sublistView(bytes) {
    if (bytes.length < 12) throw const FormatException('Invalid font');
    final magic = data.getUint32(0);
    if (magic != 0x00010000 && magic != 0x4f54544f && magic != 0x74727565) {
      throw const FormatException('Only single-face TTF and OTF supported');
    }
    final n = data.getUint16(4);
    if (n == 0 || 12 + 16 * n > bytes.length) {
      throw const FormatException('Invalid table directory');
    }
    for (var i = 0; i < n; i++) {
      final p = 12 + i * 16,
          tag = data.getUint32(p),
          off = data.getUint32(p + 8),
          len = data.getUint32(p + 12);
      if (off + len > bytes.length) {
        throw const FormatException('Invalid font table');
      }
      if (tag == 0x636d6170) {
        cmapRecord = p;
        cmapOffset = off;
        cmapLength = len;
      }
      if (tag == 0x68656164 && len >= 12) headOffset = off;
    }
    if (cmapRecord < 0 || headOffset < 0 || cmapLength < 4) {
      throw const FormatException('Missing cmap/head');
    }
    final count = data.getUint16(cmapOffset + 2);
    if (4 + count * 8 > cmapLength) throw const FormatException('Invalid cmap');
    for (var i = 0; i < count; i++) {
      final p = cmapOffset + 4 + i * 8,
          platform = data.getUint16(p),
          encoding = data.getUint16(p + 2);
      if (platform != 0 &&
          !(platform == 3 && (encoding == 1 || encoding == 10))) {
        continue;
      }
      final off = cmapOffset + data.getUint32(p + 4);
      if (off + 2 > cmapOffset + cmapLength) continue;
      final fmt = data.getUint16(off);
      if (fmt == 12 && off + 16 <= cmapOffset + cmapLength) {
        final len = data.getUint32(off + 4), groups = data.getUint32(off + 12);
        if (len >= 16 &&
            off + len <= cmapOffset + cmapLength &&
            groups <= (len - 16) ~/ 12) {
          format12 = off;
        }
      } else if (fmt == 4 && off + 16 <= cmapOffset + cmapLength) {
        final len = data.getUint16(off + 2), seg = data.getUint16(off + 6) ~/ 2;
        if (seg > 0 &&
            len >= 16 + seg * 8 &&
            off + len <= cmapOffset + cmapLength) {
          format4 = off;
        }
      }
    }
    if (format4 < 0 && format12 < 0) {
      throw const FormatException('Unsupported Unicode cmap');
    }
  }
  final ByteData data;
  int cmapRecord = -1, cmapOffset = 0, cmapLength = 0, headOffset = -1;
  int format4 = -1, format12 = -1;

  int glyph(int c) {
    if (format12 >= 0) {
      final o = format12;
      var lo = 0, hi = data.getUint32(o + 12) - 1;
      while (lo <= hi) {
        final mid = (lo + hi) ~/ 2, p = o + 16 + mid * 12;
        final start = data.getUint32(p), end = data.getUint32(p + 4);
        if (c < start) {
          hi = mid - 1;
        } else if (c > end) {
          lo = mid + 1;
        } else {
          return data.getUint32(p + 8) + c - start;
        }
      }
    }
    if (format4 < 0 || c > 0xffff) return 0;
    final o = format4, n = data.getUint16(format4 + 6) ~/ 2;
    final ends = o + 14,
        starts = ends + 2 * n + 2,
        deltas = starts + 2 * n,
        ranges = deltas + 2 * n;
    for (var i = 0; i < n; i++) {
      if (c > data.getUint16(ends + i * 2)) continue;
      final start = data.getUint16(starts + i * 2);
      if (c < start) return 0;
      final delta = data.getInt16(deltas + i * 2),
          rp = ranges + i * 2,
          r = data.getUint16(rp);
      if (r == 0) return (c + delta) & 0xffff;
      final gp = rp + r + (c - start) * 2;
      if (gp + 2 > o + data.getUint16(o + 2)) return 0;
      final g = data.getUint16(gp);
      return g == 0 ? 0 : (g + delta) & 0xffff;
    }
    return 0;
  }

  static bool digit(int c) =>
      (c >= 48 && c <= 57) || (c >= 0xff10 && c <= 0xff19);
  static bool latin(int c) =>
      !digit(c) &&
      ((c >= 0x20 && c <= 0x7e) ||
          (c >= 0xa0 && c <= 0x024f) ||
          (c >= 0x0300 && c <= 0x036f) ||
          (c >= 0x1e00 && c <= 0x1eff) ||
          (c >= 0x2000 && c <= 0x206f) ||
          (c >= 0xff21 && c <= 0xff3a) ||
          (c >= 0xff41 && c <= 0xff5a));
  static bool timer(int c) =>
      digit(c) || const [32, 43, 45, 46, 47, 58, 37, 0x2212].contains(c);

  Uint8List restrict(bool Function(int) keep) {
    final codes = <int>[], gids = <int>[];
    for (var c = 0; c < 0xffff; c++) {
      if (!keep(c)) continue;
      final g = glyph(c);
      if (g > 0 && g <= 0xffff) {
        codes.add(c);
        gids.add(g);
      }
    }
    if (codes.isEmpty) throw const FormatException('No matching glyphs');
    codes.add(0xffff);
    gids.add(0);
    final n = codes.length, len = 16 + n * 8;
    if (len > 0xffff) throw const FormatException('Too many glyphs');
    final cmap = ByteData(20 + len);
    cmap.setUint16(2, 2);
    cmap.setUint16(4, 0);
    cmap.setUint16(6, 3);
    cmap.setUint32(8, 20);
    cmap.setUint16(12, 3);
    cmap.setUint16(14, 1);
    cmap.setUint32(16, 20);
    const o = 20;
    cmap.setUint16(o, 4);
    cmap.setUint16(o + 2, len);
    cmap.setUint16(o + 6, n * 2);
    var power = 1, selector = 0;
    while (power * 2 <= n) {
      power *= 2;
      selector++;
    }
    cmap.setUint16(o + 8, power * 2);
    cmap.setUint16(o + 10, selector);
    cmap.setUint16(o + 12, n * 2 - power * 2);
    final ends = o + 14, starts = ends + n * 2 + 2, deltas = starts + n * 2;
    for (var i = 0; i < n; i++) {
      cmap.setUint16(ends + i * 2, codes[i]);
      cmap.setUint16(starts + i * 2, codes[i]);
      cmap.setUint16(deltas + i * 2, (gids[i] - codes[i]) & 0xffff);
    }
    final original = data.lengthInBytes, offset = (original + 3) & ~3;
    final out = Uint8List((offset + cmap.lengthInBytes + 3) & ~3);
    out.setRange(
      0,
      original,
      data.buffer.asUint8List(data.offsetInBytes, original),
    );
    out.setRange(
      offset,
      offset + cmap.lengthInBytes,
      cmap.buffer.asUint8List(),
    );
    final b = ByteData.sublistView(out);
    b.setUint32(cmapRecord + 4, _sum(b, offset, out.length));
    b.setUint32(cmapRecord + 8, offset);
    b.setUint32(cmapRecord + 12, cmap.lengthInBytes);
    b.setUint32(headOffset + 8, 0);
    b.setUint32(
      headOffset + 8,
      (0xb1b0afba - _sum(b, 0, out.length)) & 0xffffffff,
    );
    return out;
  }

  static int _sum(ByteData b, int start, int end) {
    var sum = 0;
    for (var i = start; i < end; i += 4) {
      sum = (sum + b.getUint32(i)) & 0xffffffff;
    }
    return sum;
  }
}
