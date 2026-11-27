# Kiru immersive content layout

Home is the first opt-in consumer of ImmersiveContentLayout. The visual
artwork spans the hero and the first rail; only the art overlaps, never the
buttons or pointer hit areas. ImmersiveHeroGroup keeps both in one vertical
scroll item. The bottom scrim ends exactly at the page theme background. The
separate blurred backdrop is disabled for this layout.

- Desktop/tablet gutters: 32 / 48 / 64 dp based on viewport width.
- Artwork target: 72% of viewport height including chrome, with a minimum
  content budget. Overlap: 12% of height, clamped to 72-120 dp.
- Rail gap 36 dp, card gap 16 dp, image radius 12 dp.
- Continue-watching: 16:9 artwork, inset progress, captions outside the art.
- Poster frames: no heavy shadow or bloom within the opt-in layout.
- Existing selection, focus, filtering and callbacks stay with their owners.
- Preserve mobile and TV layouts and the compact/minimalist hero height presets.
- No changes to global navigation or window-drag behavior.

Next pages can opt in using the same scope and geometry; the hero and rail
business data remain page-specific. A genre filter is optional, not a new
mandatory Home feature.
