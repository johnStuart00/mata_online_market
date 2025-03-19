import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/icon_container_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/mark_text_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';

class BasketContainerWidget extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String productDescription;
  final double productPrice;
  final double productQuantity;
  final bool onLiked;
  final Function(double) onQuantityChanged;
  final Function(bool) onLikedChanged;

  const BasketContainerWidget({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productQuantity,
    required this.onLiked,
    required this.onQuantityChanged,
    required this.onLikedChanged,
  });

  @override
  State<BasketContainerWidget> createState() => _BasketContainerWidgetState();
}

class _BasketContainerWidgetState extends State<BasketContainerWidget> {
  late double productQuantity;
  late bool isLiked;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    productQuantity = widget.productQuantity;
    isLiked = widget.onLiked;
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      widget.onLikedChanged(isLiked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        borderRadius: AppSpacing.cardRadius,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Theme.of(context).shadowColor.withOpacity(0.3),
            blurRadius: 5.0,
            spreadRadius: 0.01,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: AppSpacing.cardRadius,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.imageUrl),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //const NumberInputField(),
                    MiddleTextWidget(text: widget.productName),
                    GestureDetector(
                      onTap: () {
                        _toggleLike();
                        widget.onLikedChanged(isLiked);
                      },
                      child: isLiked
                          ? const IconWidget(icon: AppIcons.liked)
                          : const IconWidget(icon: AppIcons.unliked),
                    ),
                  ],
                ),
                MiddleTextWidget(text: widget.productDescription),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: MarkTextWidget(
                          text:
                              '${widget.productPrice.toStringAsFixed(2)} TMT'),
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
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const MiddleTextWidget(text: 'SM'),
                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
