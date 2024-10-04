import 'package:flutter/material.dart';
import 'package:fashion/models/fidget_image.dart';

class Fidget extends StatefulWidget {
  const Fidget({super.key, required this.fidgetImage});

  final FidgetImage fidgetImage;

  @override
  State<Fidget> createState() {
    return _FidgetState();
  }
}

class _FidgetState extends State<Fidget> {
  var _isRaiting = false;
  final _rateHover = [false, false, false, false, false];

  void startRating() {
    setState(() {
      _isRaiting = true;
    });
  }

  void stopRating() {
    setState(() {
      _isRaiting = false;
    });
  }

  void onRateHover(int rate) {
    
    setState(() {
      for (int i = 0; i < 5; i++) {
        _rateHover[i] = i < rate ? true : false; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            widget.fidgetImage.path,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (_isRaiting) raiting(context),
              GestureDetector(
                onLongPress: startRating,
                onLongPressUp: stopRating,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_reaction),
                ),
              ),
              for (int i = 5; i >= 1; i--) rate(context, i),
            ],
          ),
        ),
      ],
    );
  }

  Widget raiting(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.4),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          for (int i = 5; i >= 1; i--) rate(context, i),
        ],
      ),
    );
  }

  Widget rate(BuildContext context, int rate) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        onPressed: () {},
        onHover: (value) {
          if (value) {
            onRateHover(rate);
          }
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: _rateHover[rate - 1]
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface),
        child: Text(
          rate.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
