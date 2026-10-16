import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareProductButton extends StatelessWidget {
  final String productId;
  const ShareProductButton({super.key, required this.productId});
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final productLink =
            "https://ecommerce-huma-volve-e32af.web.app/products/$productId";
        final String shareMessage = productLink;
        SharePlus.instance.share(
          ShareParams(
            text: shareMessage,
            subject: "Check out this product on Huma Volve",
          ),
        );
      },
      icon: Icon(Icons.share),
    );
  }
}
