import 'package:flutter/material.dart';

class CartButtonWidget extends StatelessWidget {
  const CartButtonWidget({
    Key? key,
    required this.animationController,
  }) : super(key: key);
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const AnimatedOpacity(
              opacity: 1,
              duration: Duration(
                seconds: 1,
              ),
              child: Text(
                'The aluminium case is lightweight and made from 100 percent recycled aerospace grade alloy.',
                style: TextStyle(
                  color: Color(0xFF9095A6),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Spacer(),
            SafeArea(
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animationController),
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF4136F1),
                        Color(0xFF8743FF),
                      ],
                    ),
                  ),
                  child: const Center(
                      child: Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
