import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AmountField extends StatefulWidget {
  const AmountField({
    super.key,
  });

  @override
  AmountFieldState createState() => AmountFieldState();
}

class AmountFieldState extends State<AmountField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: MiddleTextWidget(
            text: AppLocalizations.of(context)!.mukdary,
          ),
        ),
        SizedBox(
          width: 75.0,
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(5),
            ],
            style: const TextStyle(fontSize: 15),
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
            ),
          ),
        ),
        const MiddleTextWidget(text: 'SM'),
        const SizedBox(width: 10),
      ],
    );
  }
}
