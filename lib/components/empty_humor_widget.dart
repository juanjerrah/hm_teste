import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyHumorWidget extends StatelessWidget {
  const EmptyHumorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Dê o primeiro passo para a sua mudança",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(55, 73, 87, 1)),
          ),
          SizedBox(
            child: SvgPicture.asset("lib/assets/Chakras-bro.svg"),
          )
        ],
      ),
    );
  }
}
