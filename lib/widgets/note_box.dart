import 'package:flutter/material.dart';

enum NoteType {
  info,
  warning,
  error,
}

class NoteBox extends StatefulWidget {
  const NoteBox({required this.note, required this.type, super.key});
  const NoteBox.info({required this.note, super.key}) : type = NoteType.info;
  const NoteBox.warning({required this.note, super.key})
      : type = NoteType.warning;
  const NoteBox.error({required this.note, super.key}) : type = NoteType.error;
  final String note;
  final NoteType type;

  @override
  State<NoteBox> createState() => _NoteBoxState();
}

class _NoteBoxState extends State<NoteBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            color: _onBackgroundColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.note,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: _onBackgroundColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Color get _backgroundColor {
    switch (widget.type) {
      case NoteType.info:
        return Theme.of(context).colorScheme.secondaryContainer;
      case NoteType.warning:
        return Theme.of(context).colorScheme.primaryContainer;
      case NoteType.error:
        return Theme.of(context).colorScheme.errorContainer;
    }
  }

  Color get _onBackgroundColor {
    switch (widget.type) {
      case NoteType.info:
        return Theme.of(context).colorScheme.onSecondaryContainer;
      case NoteType.warning:
        return Theme.of(context).colorScheme.onPrimaryContainer;
      case NoteType.error:
        return Theme.of(context).colorScheme.onErrorContainer;
    }
  }
}
