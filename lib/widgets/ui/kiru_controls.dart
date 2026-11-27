import '../../services/layout/form_factor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart' as f;
import 'package:material_ui/material_ui.dart' as mui;
import '../../services/theme/forui_theme.dart';

/// Stable application-facing controls. The Forui backend stays here so
/// feature pages do not need to know its variant and callback conventions.
enum KiruButtonKind { primary, secondary, outline, ghost, destructive }

class KiruButton extends StatelessWidget {
  const KiruButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.icon,
    this.kind = KiruButtonKind.primary,
    this.compact = false,
    this.expand = false,
    this.style,
  });
  final VoidCallback? onPressed;
  final Widget child;
  final Widget? icon;
  final KiruButtonKind kind;
  final bool compact, expand;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) => KiruForuiTheme.ensure(
    context,
    (context) => f.FButton(
      style: style == null
          ? const .context()
          : _buttonStyle(context, style!, kind, compact),
      shortcuts: const {
        SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.select): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.gameButtonA): ActivateIntent(),
      },
      onPress: onPressed,
      variant: switch (kind) {
        KiruButtonKind.primary => f.FButtonVariant.primary,
        KiruButtonKind.secondary => f.FButtonVariant.secondary,
        KiruButtonKind.outline => f.FButtonVariant.outline,
        KiruButtonKind.ghost => f.FButtonVariant.ghost,
        KiruButtonKind.destructive => f.FButtonVariant.destructive,
      },
      size: compact ? f.FButtonSizeVariant.sm : f.FButtonSizeVariant.md,
      mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
      prefix: icon,
      child: child,
    ),
  );
}

class KiruSwitchRow extends StatelessWidget {
  const KiruSwitchRow({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.icon,
    this.subtitle,
    this.activeColor,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
  });
  final Widget title;
  final Widget? subtitle;
  final Color? activeColor;
  final EdgeInsetsGeometry contentPadding;
  final Widget? icon;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) => Padding(
    padding: contentPadding,
    child: Row(
      children: [
        if (icon != null) ...[icon!, const SizedBox(width: 16)],
        Expanded(
          child: f.FSwitch(
            style: activeColor == null
                ? const .context()
                : f.FSwitchStyle.inherit(
                    colors: f.FTheme.of(
                      context,
                    ).colors.copyWith(primary: activeColor),
                    style: f.FTheme.of(context).style,
                  ),
            leadingLabel: true,
            label: title,
            description: subtitle,
            value: value,
            enabled: onChanged != null,
            onChange: onChanged,
          ),
        ),
      ],
    ),
  );
}

class KiruBadge extends StatelessWidget {
  const KiruBadge({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) =>
      f.FBadge(variant: f.FBadgeVariant.secondary, child: child);
}

/// Controlled select: externally persisted values always remain authoritative.
class KiruSelect<T> extends StatelessWidget {
  const KiruSelect({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.label,
    this.hint,
  });
  final T? value;
  final Map<String, T> items;
  final ValueChanged<T?>? onChanged;
  final String? label, hint;
  @override
  Widget build(BuildContext context) => f.FSelect<T>(
    items: items,
    control: f.FSelectControl<T>.lifted(
      value: value,
      onChange: onChanged ?? (_) {},
    ),
    enabled: onChanged != null,
    label: label == null ? null : Text(label!),
    hint: hint,
  );
}

/// Form field backed by the feature's original text controller.
class KiruTextField extends StatelessWidget {
  const KiruTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.keyboardType,
    this.enabled = true,
    this.obscureText = false,
  });
  final TextEditingController controller;
  final String? label, hint;
  final TextInputType? keyboardType;
  final bool enabled, obscureText;
  @override
  Widget build(BuildContext context) => f.FTextField(
    control: f.FTextFieldControl.managed(controller: controller),
    label: label == null ? null : Text(label!),
    hint: hint,
    keyboardType: keyboardType,
    enabled: enabled,
    obscureText: obscureText,
    autocorrect: keyboardType != TextInputType.url && !obscureText,
    enableSuggestions: keyboardType != TextInputType.url && !obscureText,
  );
}

/// Standalone Forui toggle for existing composite rows.
class KiruSwitch extends StatelessWidget {
  const KiruSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.semanticsLabel,
    this.activeColor,
  });
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? semanticsLabel;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) => f.FSwitch(
    style: activeColor == null
        ? const .context()
        : f.FSwitchStyle.inherit(
            colors: f.FTheme.of(context).colors.copyWith(primary: activeColor),
            style: f.FTheme.of(context).style,
          ),
    value: value,
    enabled: onChanged != null,
    onChange: onChanged,
    semanticsLabel: semanticsLabel,
  );
}

/// Forui separator with explicit dimensions so list spacing does not drift.
class KiruDivider extends StatelessWidget {
  const KiruDivider({
    super.key,
    required this.color,
    this.height = 1,
    this.thickness = 1,
    this.indent = 0,
    this.endIndent = 0,
  });
  final Color color;
  final double height, thickness, indent, endIndent;
  @override
  Widget build(BuildContext context) => f.FDivider(
    style: f.FDividerStyle(
      color: color,
      width: thickness,
      padding: EdgeInsetsDirectional.fromSTEB(
        indent,
        ((height - thickness) / 2).clamp(0.0, double.infinity).toDouble(),
        endIndent,
        ((height - thickness) / 2).clamp(0.0, double.infinity).toDouble(),
      ),
    ),
  );
}

/// Forui indeterminate loading indicator. Determinate circular indicators
/// remain separate because Forui's circular loader has no progress value.
class KiruLoader extends StatelessWidget {
  const KiruLoader({
    super.key,
    this.color,
    this.valueColor,
    this.strokeWidth = 4,
  });
  final Color? color;
  final Animation<Color?>? valueColor;
  final double strokeWidth;
  @override
  Widget build(BuildContext context) => KiruForuiTheme.ensure(context, _build);

  Widget _build(BuildContext context) {
    final colors = f.FTheme.of(context).colors;
    Widget spinner(Color? animatedColor) => LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.hasBoundedWidth ? constraints.maxWidth : 36.0;
        final height = constraints.hasBoundedHeight
            ? constraints.maxHeight
            : 36.0;
        final size = width.clamp(0.0, 36.0).clamp(0.0, height).toDouble();
        return Center(
          widthFactor: 1,
          heightFactor: 1,
          child: f.FCircularProgress(
            style: f.FCircularProgressStyle(
              iconStyle: IconThemeData(
                color: animatedColor ?? color ?? colors.primary,
                size: size,
              ),
            ),
          ),
        );
      },
    );
    return valueColor == null
        ? spinner(null)
        : AnimatedBuilder(
            animation: valueColor!,
            builder: (_, _) => spinner(valueColor!.value),
          );
  }
}

class KiruProgress extends StatelessWidget {
  const KiruProgress({
    super.key,
    this.value,
    this.color,
    this.valueColor,
    this.backgroundColor,
    this.minHeight = 4,
  });
  final double? value;
  final Color? color, backgroundColor;
  final Animation<Color?>? valueColor;
  final double minHeight;
  @override
  Widget build(BuildContext context) => KiruForuiTheme.ensure(context, _build);

  Widget _build(BuildContext context) {
    final colors = f.FTheme.of(context).colors;
    Widget bar(Color? animatedColor) {
      final track = BoxDecoration(
        color: backgroundColor ?? colors.muted,
        borderRadius: BorderRadius.circular(minHeight / 2),
      );
      final fill = BoxDecoration(
        color: animatedColor ?? color ?? colors.primary,
        borderRadius: BorderRadius.circular(minHeight / 2),
      );
      final constraints = BoxConstraints.tightFor(height: minHeight);
      return SizedBox(
        width: double.infinity,
        child: value == null
            ? f.FProgress(
                style: f.FProgressStyle(
                  trackDecoration: track,
                  fillDecoration: fill,
                  constraints: constraints,
                ),
              )
            : f.FDeterminateProgress(
                value: value!.clamp(0.0, 1.0).toDouble(),
                style: f.FDeterminateProgressStyle(
                  trackDecoration: track,
                  fillDecoration: fill,
                  constraints: constraints,
                ),
              ),
      );
    }

    return valueColor == null
        ? bar(null)
        : AnimatedBuilder(
            animation: valueColor!,
            builder: (_, _) => bar(valueColor!.value),
          );
  }
}

/// Uses Forui's dialog surface with the existing route and action callbacks.
/// Material is transparent here only for legacy descendant input controls.
class KiruAlertDialog extends StatelessWidget {
  const KiruAlertDialog({
    super.key,
    this.title,
    this.content,
    this.actions = const [],
    this.backgroundColor,
    this.shape,
  });
  final Widget? title, content;
  final List<Widget> actions;
  final Color? backgroundColor;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) => KiruForuiTheme.ensure(context, _build);

  Widget _build(BuildContext context) {
    final theme = f.FTheme.of(context);
    final style = theme.dialogStyle;
    return f.FDialog(
      style: f.FDialogStyle(
        titleTextStyle: style.titleTextStyle,
        bodyTextStyle: style.bodyTextStyle,
        slidePressHapticFeedback: style.slidePressHapticFeedback,
        decoration: ShapeDecoration(
          color: backgroundColor ?? theme.colors.card,
          shape:
              shape ??
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
        ),
      ),
      builder: (context, dialogStyle) => Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (title != null)
                DefaultTextStyle(
                  style: dialogStyle.titleTextStyle,
                  child: title!,
                ),
              if (title != null && content != null) const SizedBox(height: 16),
              if (content != null)
                Flexible(
                  child: SingleChildScrollView(
                    child: DefaultTextStyle(
                      style: dialogStyle.bodyTextStyle,
                      child: content!,
                    ),
                  ),
                ),
              if (actions.isNotEmpty) ...[
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.end,
                  spacing: 8,
                  runSpacing: 8,
                  children: actions,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Bridge explicit legacy style values while migrating call sites. Every
/// rendered button is a Forui button, including its hover and focus handling.
f.FButtonStyle _buttonStyle(
  BuildContext context,
  ButtonStyle style,
  KiruButtonKind kind,
  bool compact,
) {
  final theme = f.FTheme.of(context);
  final c = theme.colors;
  final defaultFg = switch (kind) {
    KiruButtonKind.primary => c.primaryForeground,
    KiruButtonKind.destructive => c.destructiveForeground,
    _ => c.foreground,
  };
  final defaultBg = switch (kind) {
    KiruButtonKind.primary => c.primary,
    KiruButtonKind.secondary => c.secondary,
    KiruButtonKind.destructive => c.destructive,
    _ => Colors.transparent,
  };
  const idle = <WidgetState>{};
  const disabled = {WidgetState.disabled};
  final fg = style.foregroundColor?.resolve(idle) ?? defaultFg;
  final bg = style.backgroundColor?.resolve(idle) ?? defaultBg;
  final side =
      style.side?.resolve(idle) ??
      (kind == KiruButtonKind.outline
          ? BorderSide(color: c.border)
          : BorderSide.none);
  final shape =
      (style.shape?.resolve(idle) ??
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
          .copyWith(side: side);
  final minimum =
      style.minimumSize?.resolve(idle) ?? Size(36, compact ? 30 : 36);
  final fixed = style.fixedSize?.resolve(idle);
  final pad =
      style.padding?.resolve(idle) ??
      const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  Color stateColor(WidgetState state) {
    final set = {state};
    final base = style.backgroundColor?.resolve(set) ?? bg;
    final overlay = style.overlayColor?.resolve(set);
    return overlay == null ? base : Color.alphaBlend(overlay, base);
  }

  final constraints =
      fixed != null && fixed.width.isFinite && fixed.height.isFinite
      ? BoxConstraints.tight(fixed)
      : BoxConstraints(
          minWidth: fixed?.width.isFinite == true
              ? fixed!.width
              : minimum.width.isFinite
              ? minimum.width
              : 0,
          minHeight: fixed?.height.isFinite == true
              ? fixed!.height
              : minimum.height.isFinite
              ? minimum.height
              : 0,
        );
  return f.FButtonStyle.inherit(
    style: theme.style,
    decoration: f.FVariants.from(
      ShapeDecoration(color: bg, shape: shape),
      variants: {
        [f.FTappableVariant.hovered]: f.DecorationDelta.shapeDelta(
          color: stateColor(WidgetState.hovered),
        ),
        [f.FTappableVariant.pressed]: f.DecorationDelta.shapeDelta(
          color: stateColor(WidgetState.pressed),
        ),
        [f.FTappableVariant.disabled]: f.DecorationDelta.shapeDelta(
          color:
              style.backgroundColor?.resolve(disabled) ??
              bg.withValues(alpha: bg.a * 0.5),
        ),
      },
    ),
    foregroundColor: fg,
    disabledForegroundColor:
        style.foregroundColor?.resolve(disabled) ?? fg.withValues(alpha: 0.4),
    textStyle: theme.typography.body.sm.merge(style.textStyle?.resolve(idle)),
    contentConstraints: constraints,
    contentPadding: pad,
    contentSpacing: 8,
    iconConstraints: constraints,
    iconSize: style.iconSize?.resolve(idle) ?? 20,
    iconPadding: pad,
  );
}

/// Numeric slider keeps the original range and discrete steps; Forui works
/// internally with normalized positions.
class KiruSlider extends StatelessWidget {
  const KiruSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 1,
    this.divisions,
    this.label,
    this.onChangeEnd,
    this.sliderStyle,
  });
  final double value, min, max;
  final int? divisions;
  final String? label;
  final ValueChanged<double>? onChanged, onChangeEnd;
  final f.FSliderStyleDelta? sliderStyle;

  @override
  Widget build(BuildContext context) =>
      KiruForuiTheme.ensure(context, (context) {
        final span = max - min;
        final current = span <= 0
            ? 0.0
            : ((value - min) / span).clamp(0.0, 1.0).toDouble();
        double denormalize(double position) {
          final count = divisions;
          final normalized = count != null && count > 0
              ? (position * count).round() / count
              : position;
          return (min + normalized * span).clamp(min, max).toDouble();
        }

        // Lifted controllers may report the previous value on release
        // before the parent has rebuilt. Retain the last interaction value.
        double? pending;
        return f.FSlider(
          style: sliderStyle ?? const .context(),
          onEnd: onChangeEnd == null
              ? null
              : (v) => onChangeEnd!(pending ?? denormalize(v.max)),
          enabled: onChanged != null && span > 0,
          control: f.FSliderControl.liftedContinuous(
            value: f.FSliderValue(max: current),
            onChange: (v) {
              pending = denormalize(v.max);
              onChanged?.call(pending!);
            },
            stepPercentage: divisions == null || divisions! <= 0
                ? 0.05
                : 1 / divisions!,
          ),
          tooltipControls: label == null
              ? const f.FSliderTooltipControls.disabled()
              : const f.FSliderTooltipControls(),
          tooltipBuilder: (_, position) =>
              Text(label ?? denormalize(position).toStringAsFixed(2)),
          semanticValueFormatterCallback: (position) =>
              denormalize(position).toStringAsFixed(2),
        );
      });
}

class KiruIconButton extends StatelessWidget {
  const KiruIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.color,
    this.iconSize,
    this.style,
    this.constraints,
    this.padding,
    this.visualDensity,
    this.splashRadius,
    this.focusNode,
  });
  final Widget icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color? color;
  final double? iconSize, splashRadius;
  final ButtonStyle? style;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? padding;
  final VisualDensity? visualDensity;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) =>
      KiruForuiTheme.ensure(context, (context) {
        final minimum = constraints == null
            ? null
            : Size(constraints!.minWidth, constraints!.minHeight);
        final merged = (style ?? const ButtonStyle()).copyWith(
          foregroundColor: color == null ? null : WidgetStatePropertyAll(color),
          minimumSize: minimum == null ? null : WidgetStatePropertyAll(minimum),
          padding: padding == null ? null : WidgetStatePropertyAll(padding),
          iconSize: iconSize == null ? null : WidgetStatePropertyAll(iconSize),
        );
        final child = f.FButton.icon(
          shortcuts: const {
            SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
            SingleActivator(LogicalKeyboardKey.select): ActivateIntent(),
            SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
            SingleActivator(LogicalKeyboardKey.gameButtonA): ActivateIntent(),
          },
          onPress: onPressed,
          focusNode: focusNode,
          variant: f.FButtonVariant.ghost,
          style:
              style == null &&
                  constraints == null &&
                  padding == null &&
                  iconSize == null &&
                  color == null
              ? const .context()
              : _buttonStyle(context, merged, KiruButtonKind.ghost, false),
          semanticsTooltip: tooltip,
          child: IconTheme.merge(
            data: IconThemeData(color: color, size: iconSize),
            child: icon,
          ),
        );
        return tooltip == null
            ? child
            : KiruTooltip(message: tooltip!, child: child);
      });
}

class KiruTooltip extends StatelessWidget {
  const KiruTooltip({
    super.key,
    required this.message,
    required this.child,
    this.waitDuration,
  });
  final String message;
  final Widget child;
  final Duration? waitDuration;
  @override
  Widget build(BuildContext context) =>
      KiruForuiTheme.ensure(context, (context) {
        if (FormFactorService.hasRemoteInput) {
          return Semantics(tooltip: message, child: child);
        }
        final base = f.FTheme.of(context).tooltipStyle;
        return Semantics(
          tooltip: message,
          child: f.FTooltip(
            style: base.copyWith(hoverEnterDuration: waitDuration),
            tipBuilder: (_, _) => Text(message),
            child: child,
          ),
        );
      });
}

class KiruChoiceChip extends StatelessWidget {
  const KiruChoiceChip({
    super.key,
    this.avatar,
    required this.label,
    required this.selected,
    this.onSelected,
    this.selectedColor,
    this.backgroundColor,
    this.labelStyle,
    this.side,
    this.shape,
  });
  final Widget? avatar;
  final Widget label;
  final bool selected;
  final ValueChanged<bool>? onSelected;
  final Color? selectedColor, backgroundColor;
  final TextStyle? labelStyle;
  final BorderSide? side;
  final OutlinedBorder? shape;
  @override
  Widget build(BuildContext context) => KiruButton(
    kind: KiruButtonKind.ghost,
    compact: true,
    icon: avatar,
    onPressed: onSelected == null ? null : () => onSelected!(!selected),
    style: TextButton.styleFrom(
      backgroundColor: selected ? selectedColor : backgroundColor,
      foregroundColor: labelStyle?.color,
      textStyle: labelStyle,
      side: side ?? shape?.side,
      shape: shape,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
    ),
    child: Semantics(selected: selected, child: label),
  );
}

/// Rich menu item contents remain intact (including custom voice badges).
class KiruDropdown<T> extends StatelessWidget {
  const KiruDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.decoration,
    this.dropdownColor,
    this.icon,
    this.isExpanded = false,
    this.style,
    this.underline,
  });
  final List<DropdownMenuItem<T>>? items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final InputDecoration? decoration;
  final Color? dropdownColor;
  final Widget? icon, underline;
  final bool isExpanded;
  final TextStyle? style;
  String _label(Widget w) {
    if (w is Text) return w.data ?? w.textSpan?.toPlainText() ?? '';
    if (w is Row) {
      for (final child in w.children) {
        final text = _label(child);
        if (text.isNotEmpty) return text;
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) =>
      KiruForuiTheme.ensure(context, (context) {
        final options = items ?? <DropdownMenuItem<T>>[];
        String format(T v) {
          for (final item in options) {
            if (item.value == v) {
              final t = _label(item.child);
              return t.isEmpty ? v.toString() : t;
            }
          }
          return v.toString();
        }

        return LayoutBuilder(
          builder: (context, bounds) => SizedBox(
            width: bounds.hasBoundedWidth ? bounds.maxWidth : 136,
            child: f.FSelect<T>.rich(
              format: format,
              children: [
                for (final item in options)
                  if (item.value != null)
                    f.FSelectItem<T>(
                      value: item.value as T,
                      title: item.child,
                      enabled: item.enabled,
                    ),
              ],
              size: f.FTextFieldSizeVariant.sm,
              label: decoration?.labelText == null
                  ? null
                  : Text(decoration!.labelText!),
              enabled: onChanged != null,
              control: f.FSelectControl<T>.lifted(
                value: value,
                onChange: onChanged ?? (_) {},
              ),
            ),
          ),
        );
      });
}

class KiruPopupMenu<T> extends StatelessWidget {
  const KiruPopupMenu({
    super.key,
    required this.itemBuilder,
    required this.onSelected,
    required this.child,
    this.tooltip,
    this.color,
    this.shape,
    this.constraints,
    this.initialValue,
  });
  final PopupMenuItemBuilder<T> itemBuilder;
  final ValueChanged<T>? onSelected;
  final Widget child;
  final String? tooltip;
  final Color? color;
  final ShapeBorder? shape;
  final BoxConstraints? constraints;
  final T? initialValue;
  @override
  Widget build(BuildContext context) => KiruForuiTheme.ensure(
    context,
    (context) => f.FPopoverMenu.tiles(
      maxHeight: constraints?.maxHeight ?? 360,
      menuBuilder: (context, controller, _) => [
        f.FTileGroup(
          children: [
            for (final item in itemBuilder(context))
              if (item is PopupMenuItem<T>)
                f.FTile(
                  title: item.child ?? const SizedBox.shrink(),
                  enabled: item.enabled,
                  selected: item.value == initialValue,
                  onPress: () {
                    controller.hide();
                    if (item.value != null || null is T)
                      onSelected?.call(item.value as T);
                  },
                ),
          ],
        ),
      ],
      builder: (context, controller, _) => f.FTappable.static(
        semanticsTooltip: tooltip,
        onPress: controller.toggle,
        child: child,
      ),
    ),
  );
}

/// Form adapter preserves controllers, input actions, decorations and focus.
class KiruFormField extends StatelessWidget {
  const KiruFormField({
    super.key,
    this.controller,
    this.decoration,
    this.style,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction,
    this.cursorColor,
    this.validator,
  });
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final TextStyle? style;
  final ValueChanged<String>? onChanged, onSubmitted;
  final FocusNode? focusNode;
  final bool autofocus, obscureText, autocorrect, enableSuggestions;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color? cursorColor;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) => KiruForuiTheme.ensure(context, (
    context,
  ) {
    final theme = f.FTheme.of(context);
    final base =
        (decoration?.border == InputBorder.none || decoration?.isDense == true)
        ? theme.textFieldStyles.sm
        : theme.textFieldStyles.md;
    final d = decoration ?? const InputDecoration();
    mui.InputBorder? convertBorder(InputBorder? b) {
      if (b == null) return null;
      if (b == InputBorder.none) return mui.InputBorder.none;
      if (b is OutlineInputBorder)
        return mui.OutlineInputBorder(
          borderSide: b.borderSide,
          borderRadius: b.borderRadius,
          gapPadding: b.gapPadding,
        );
      if (b is UnderlineInputBorder)
        return mui.UnderlineInputBorder(
          borderSide: b.borderSide,
          borderRadius: b.borderRadius,
        );
      return mui.OutlineInputBorder(borderSide: b.borderSide);
    }

    final border = convertBorder(d.enabledBorder ?? d.border);
    final focus =
        convertBorder(d.focusedBorder) ??
        (border == mui.InputBorder.none
            ? mui.InputBorder.none
            : base.border.resolve({f.FTextFieldVariant.focused}));
    final prefix = d.prefixIcon ?? d.prefix;
    final suffix = d.suffixIcon ?? d.suffix;
    final compact = d.isDense == true || border == mui.InputBorder.none;
    if (validator != null) {
      return f.FTextFormField(
        control: f.FTextFieldControl.managed(
          controller: controller,
          onChange: onChanged == null
              ? null
              : (value) => onChanged!(value.text),
        ),
        focusNode: focusNode,
        autofocus: autofocus,
        obscureText: obscureText,
        autocorrect: autocorrect,
        enableSuggestions: enableSuggestions,
        maxLines: maxLines,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onSubmit: onSubmitted,
        validator: validator,
        label:
            d.label ??
            (d.labelText == null
                ? null
                : Text(d.labelText!, style: d.labelStyle)),
        hint: d.hintText,
        description:
            d.helper ??
            (d.helperText == null
                ? null
                : Text(d.helperText!, style: d.helperStyle)),
        prefixBuilder: prefix == null ? null : (_, _, _) => prefix,
        suffixBuilder: suffix == null ? null : (_, _, _) => suffix,
      );
    }
    return f.FTextField(
      size: compact ? f.FTextFieldSizeVariant.sm : f.FTextFieldSizeVariant.md,
      control: f.FTextFieldControl.managed(
        controller: controller,
        onChange: onChanged == null ? null : (value) => onChanged!(value.text),
      ),
      focusNode: focusNode,
      autofocus: autofocus,
      obscureText: obscureText,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onSubmit: onSubmitted,
      label:
          d.label ??
          (d.labelText == null
              ? null
              : Text(d.labelText!, style: d.labelStyle)),
      hint: d.hintText,
      description:
          d.helper ??
          (d.helperText == null
              ? null
              : Text(d.helperText!, style: d.helperStyle)),
      error:
          d.error ??
          (d.errorText == null
              ? null
              : Text(d.errorText!, style: d.errorStyle)),
      prefixBuilder: prefix == null
          ? null
          : (_, _, _) => compact && border == mui.InputBorder.none
                ? SizedBox(width: 30, height: 30, child: prefix)
                : prefix,
      suffixBuilder: suffix == null
          ? null
          : (_, _, _) => compact && border == mui.InputBorder.none
                ? SizedBox(
                    height: 30,
                    width: suffix is Row ? null : 30,
                    child: suffix,
                  )
                : suffix,
      style: base.copyWith(
        constraints: compact ? const BoxConstraints() : null,
        color:
            d.filled != true &&
                (d.filled == false || border == mui.InputBorder.none)
            ? f.FVariants(null, variants: {})
            : d.fillColor == null
            ? null
            : f.FVariants(d.fillColor, variants: {}),
        border: border == null && d.focusedBorder == null
            ? null
            : f.FVariants(
                border ?? base.border.base,
                variants: {
                  [f.FTextFieldVariant.focused]: focus,
                  if (d.disabledBorder != null)
                    [f.FTextFieldVariant.disabled]: convertBorder(
                      d.disabledBorder,
                    )!,
                  if (d.errorBorder != null)
                    [f.FTextFieldVariant.error]: convertBorder(d.errorBorder)!,
                },
              ),
        contentTextStyle: style == null
            ? null
            : f.FVariants.from(
                base.contentTextStyle.base.merge(style),
                variants: {},
              ),
        hintTextStyle: d.hintStyle == null
            ? null
            : f.FVariants.from(
                base.hintTextStyle.base.merge(d.hintStyle),
                variants: {},
              ),
        contentPadding: compact && border == mui.InputBorder.none
            ? f.EdgeInsetsGeometryDelta.value(
                EdgeInsets.only(
                  left:
                      d.contentPadding
                          ?.resolve(Directionality.of(context))
                          .left ??
                      8,
                  right:
                      d.contentPadding
                          ?.resolve(Directionality.of(context))
                          .right ??
                      8,
                ),
              )
            : d.contentPadding == null
            ? null
            : f.EdgeInsetsGeometryDelta.value(d.contentPadding!),
        cursorColor: cursorColor,
      ),
    );
  });
}

class KiruCheckboxRow extends StatelessWidget {
  const KiruCheckboxRow({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.contentPadding = EdgeInsets.zero,
  });
  final Widget title;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final EdgeInsetsGeometry contentPadding;
  @override
  Widget build(BuildContext context) => KiruForuiTheme.ensure(
    context,
    (context) => Padding(
      padding: contentPadding,
      child: f.FCheckbox(
        label: title,
        leadingLabel: true,
        value: value,
        enabled: onChanged != null,
        onChange: onChanged,
      ),
    ),
  );
}

class KiruListTile extends StatelessWidget {
  const KiruListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.contentPadding,
    this.dense,
    this.tileColor,
    this.hoverColor,
    this.shape,
  });
  final Widget title;
  final Widget? subtitle, leading, trailing;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final bool? dense;
  final Color? tileColor, hoverColor;
  final ShapeBorder? shape;
  @override
  Widget build(BuildContext context) => KiruForuiTheme.ensure(
    context,
    (context) => Padding(
      padding: contentPadding ?? EdgeInsets.zero,
      child: f.FTile(
        title: title,
        subtitle: subtitle,
        prefix: leading,
        suffix: trailing,
        onPress: onTap,
      ),
    ),
  );
}

class KiruTabs extends StatelessWidget {
  const KiruTabs({
    super.key,
    required this.labels,
    required this.children,
    this.initialIndex = 0,
    this.scrollable = false,
  });
  final List<Widget> labels, children;
  final int initialIndex;
  final bool scrollable;
  @override
  Widget build(BuildContext context) => KiruForuiTheme.ensure(
    context,
    (context) => f.FTabs(
      control: f.FTabControl.managed(initial: initialIndex),
      expands: true,
      scrollable: scrollable,
      children: [
        for (var i = 0; i < labels.length; i++)
          f.FTabEntry(label: labels[i], child: children[i]),
      ],
    ),
  );
}

/// Forui only supports indeterminate circular progress. Determinate media
/// progress uses a dedicated ring painter rather than a Material indicator.
class KiruCircularProgress extends StatelessWidget {
  const KiruCircularProgress({
    super.key,
    this.value,
    this.color,
    this.strokeWidth = 4,
  });
  final double? value;
  final Color? color;
  final double strokeWidth;
  @override
  Widget build(BuildContext context) => value == null
      ? KiruLoader(color: color, strokeWidth: strokeWidth)
      : Semantics(
          value: (value!.clamp(0.0, 1.0) * 100).round().toString() + '%',
          child: CustomPaint(
            painter: _KiruRingPainter(
              value!.clamp(0.0, 1.0).toDouble(),
              color ?? Theme.of(context).colorScheme.primary,
              strokeWidth,
            ),
            size: const Size.square(24),
          ),
        );
}

class _KiruRingPainter extends CustomPainter {
  const _KiruRingPainter(this.value, this.color, this.width);
  final double value, width;
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final radius = (size.shortestSide - width) / 2;
    if (radius <= 0) return;
    final rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: radius,
    );
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      rect,
      0,
      6.283185307179586,
      false,
      paint..color = color.withValues(alpha: .16),
    );
    canvas.drawArc(
      rect,
      -1.5707963267948966,
      6.283185307179586 * value,
      false,
      paint..color = color,
    );
  }

  @override
  bool shouldRepaint(_KiruRingPainter old) =>
      old.value != value || old.color != color || old.width != width;
}

class KiruVerticalDivider extends StatelessWidget {
  const KiruVerticalDivider({super.key, required this.color, this.width = 1});
  final Color color;
  final double width;
  @override
  Widget build(BuildContext context) => SizedBox(
    width: width,
    child: ColoredBox(color: color),
  );
}

/// Forui accordion with the former expansion tile call-site contract.
class KiruAccordion extends StatelessWidget {
  const KiruAccordion({
    super.key,
    required this.title,
    required this.children,
    this.collapsedShape,
    this.shape,
    this.backgroundColor,
    this.collapsedBackgroundColor,
  });
  final Widget title;
  final List<Widget> children;
  final ShapeBorder? shape, collapsedShape;
  final Color? backgroundColor, collapsedBackgroundColor;
  @override
  Widget build(BuildContext context) => KiruForuiTheme.ensure(
    context,
    (context) => f.FAccordion(
      children: [
        f.FAccordionItem(
          title: title,
          child: Column(mainAxisSize: MainAxisSize.min, children: children),
        ),
      ],
    ),
  );
}

/// Imperative anchored menus keep the Navigator route contract while using
/// Forui tiles for the actual menu surface.
Future<T?> showKiruMenu<T>({
  required BuildContext context,
  required RelativeRect position,
  required List<PopupMenuEntry<T>> items,
  Color? color,
  ShapeBorder? shape,
  BoxConstraints? constraints,
}) {
  final label = MaterialLocalizations.of(context).modalBarrierDismissLabel;
  final theme = Theme.of(context);
  return showGeneralDialog<T>(
    context: context,
    useRootNavigator: false,
    barrierDismissible: true,
    barrierLabel: label,
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 120),
    pageBuilder: (context, _, _) => Theme(
      data: theme,
      child: KiruForuiTheme.ensure(
        context,
        (context) => SafeArea(
          child: CustomSingleChildLayout(
            delegate: _KiruMenuLayout(position, constraints?.maxHeight ?? 360),
            child: Material(
              type: MaterialType.transparency,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColoredBox(
                  color: color ?? theme.colorScheme.surface,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (final (i, item) in items.indexed)
                          if (item is PopupMenuItem<T>)
                            f.FTile(
                              title: item.child ?? const SizedBox.shrink(),
                              enabled: item.enabled,
                              autofocus: i == 0 && item.enabled,
                              shortcuts: const {
                                SingleActivator(LogicalKeyboardKey.enter):
                                    ActivateIntent(),
                                SingleActivator(LogicalKeyboardKey.select):
                                    ActivateIntent(),
                                SingleActivator(LogicalKeyboardKey.space):
                                    ActivateIntent(),
                              },
                              onPress: () {
                                Navigator.of(context).pop(item.value);
                              },
                            ),
                        for (final item in items)
                          if (item is PopupMenuDivider) const f.FDivider(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _KiruMenuLayout extends SingleChildLayoutDelegate {
  const _KiruMenuLayout(this.position, this.maxHeight);
  final RelativeRect position;
  final double maxHeight;
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    final width = (constraints.maxWidth - 16).clamp(0.0, 300.0).toDouble();
    final height = (constraints.maxHeight - 16)
        .clamp(0.0, maxHeight)
        .toDouble();
    return BoxConstraints(minWidth: width, maxWidth: width, maxHeight: height);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) => Offset(
    position.left
        .clamp(
          8.0,
          (size.width - childSize.width - 8).clamp(8.0, double.infinity),
        )
        .toDouble(),
    position.top
        .clamp(
          8.0,
          (size.height - childSize.height - 8).clamp(8.0, double.infinity),
        )
        .toDouble(),
  );
  @override
  bool shouldRelayout(_KiruMenuLayout oldDelegate) =>
      oldDelegate.position != position || oldDelegate.maxHeight != maxHeight;
}
