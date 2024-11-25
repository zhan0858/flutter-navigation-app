import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /**
   * The home page should be made with a StatelessWidget with a Column that fills the screen and is divided equally between two parts. 
   * The top half uses an AssetImage as a background image. 
   * The bottom half should have a dark background color with light coloured text in a Text() widget. 
   * The color and font settings for the Text() widget should come from the Theme, not a custom TextStyle() widget.
   * The Text() widget in the lower half should also have a transformation applied to it.

   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/lemons.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
              child: Center(
                  child: Transform.scale(
                scaleX: 2,
                scaleY: 1.3,
                child: Text(
                  "Home Page",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
