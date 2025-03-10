import 'package:flutter/material.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AmountField extends StatefulWidget {
  final double mukdary;
  final Function(double) onMukdaryChanged;

  const AmountField({
    super.key,
    required this.mukdary,
    required this.onMukdaryChanged,
  });

  @override
  AmountFieldState createState() => AmountFieldState();
}

class AmountFieldState extends State<AmountField> {
  late double mukdary;

  @override
  void initState() {
    super.initState();
    mukdary = widget.mukdary; // Initialize state from widget property
  }

  void _increaseMukdary() {
    setState(() {
      mukdary += 0.5;
      widget.onMukdaryChanged(mukdary); // Notify parent
    });
  }

  void _decreaseMukdary() {
    setState(() {
      if (mukdary > 0) mukdary -= 0.5;
      widget.onMukdaryChanged(mukdary); // Notify parent
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: MiddleTextWidget(
            text: AppLocalizations.of(context)!.mukdary,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 30,
            width: 110,
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.5),
              borderRadius: AppSpacing.cardRadius,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: _decreaseMukdary,
                  icon: const Icon(Icons.remove),
                  alignment: Alignment.center,
                  padding: EdgeInsets.zero,
                ),
                MiddleTextWidget(text: '$mukdary'),
                IconButton(
                  onPressed: _increaseMukdary,
                  icon: const Icon(Icons.add),
                  alignment: Alignment.center,
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
