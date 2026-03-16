import 'package:flutter/material.dart';

class AnimatedGlowButton extends StatefulWidget {
  const AnimatedGlowButton({super.key});

  @override
  State<AnimatedGlowButton> createState() => _AnimatedGlowButtonState();
}

class _AnimatedGlowButtonState extends State<AnimatedGlowButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _borderController;

  @override
  void initState() {
    super.initState();
    _borderController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _borderController.dispose();
    super.dispose();
  }

  void _onPressed() {
    // setState(() {
    //   _isAnimating = !_isAnimating;
    //   if (_isAnimating) {
    //     _borderController.repeat();
    //   } else {
    //     _borderController.stop();
    //   }
    // });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'AI Compare Quotation...',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _AnimatedProcessingButton(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const purpleColor =
        Color.fromARGB(255, 191, 116, 229); // Matches your screenshot

    return GestureDetector(
      onTap: _onPressed,
      child: Container(
        decoration: BoxDecoration(
          // gradient: borderGradient,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(3), // border thickness
        child: Container(
          decoration: BoxDecoration(
            color: purpleColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: purpleColor.withOpacity(0.6),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.auto_awesome, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'AI Compare Quotation',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),

      // AnimatedBuilder(
      //   animation: _borderController,
      //   builder: (context, child) {
      //     final borderGradient = SweepGradient(
      //       startAngle: 0,
      //       endAngle: 6.28319, // 2π radians
      //       tileMode: TileMode.repeated,
      //       colors: const [
      //         Colors.white,
      //         Colors.transparent,
      //         Colors.white,
      //       ],
      //       stops: [
      //         (_borderController.value - 0.1).clamp(0.0, 1.0),
      //         _borderController.value,
      //         (_borderController.value + 0.1).clamp(0.0, 1.0),
      //       ],
      //     );

      //     return Container(
      //       decoration: BoxDecoration(
      //         gradient: borderGradient,
      //         shape: BoxShape.rectangle,
      //         borderRadius: BorderRadius.circular(40),
      //       ),
      //       padding: const EdgeInsets.all(3), // border thickness
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: purpleColor,
      //           borderRadius: BorderRadius.circular(10),
      //           boxShadow: [
      //             BoxShadow(
      //               color: purpleColor.withOpacity(0.6),
      //               blurRadius: 20,
      //               spreadRadius: 2,
      //             ),
      //           ],
      //         ),
      //         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      //         child: const Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(Icons.auto_awesome, color: Colors.white),
      //             SizedBox(width: 8),
      //             Text('Generate Site', style: TextStyle(color: Colors.white, fontSize: 16),
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

class _AnimatedProcessingButton extends StatefulWidget {
  @override
  State<_AnimatedProcessingButton> createState() =>
      _AnimatedProcessingButtonState();
}

class _AnimatedProcessingButtonState extends State<_AnimatedProcessingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const purpleColor = Color.fromARGB(255, 191, 116, 229);

    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        decoration: BoxDecoration(
          color: purpleColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: purpleColor.withOpacity(0.6),
              blurRadius: 12,
              spreadRadius: 3,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Please wait...",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
