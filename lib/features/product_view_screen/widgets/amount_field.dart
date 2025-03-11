import 'package:flutter/material.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/widgets/icon_container_widget.dart';
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
    mukdary = widget.mukdary;
  }

  void _increaseMukdary() {
    setState(() {
      mukdary += 0.5;
      widget.onMukdaryChanged(mukdary);
    });
  }

  void _decreaseMukdary() {
    setState(() {
      if (mukdary > 0) mukdary -= 0.5;
      widget.onMukdaryChanged(mukdary);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: MiddleTextWidget(
            text: AppLocalizations.of(context)!.mukdary,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                _decreaseMukdary();
              },
              child: const IconWidget(icon: AppIcons.remove),
            ),
            SizedBox(
              width: 50,
              child: Center(
                child: MiddleTextWidget(
                  text: '$mukdary',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _increaseMukdary();
              },
              child: const IconWidget(icon: AppIcons.add),
            )
          ],
        ),
      ],
    );
  }
}
