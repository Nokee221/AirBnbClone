import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_airbnb/models/booking_steps.dart';
import 'package:flutter_airbnb/shared/theme/colors.dart';
import 'package:flutter_airbnb/widgets/select_data_widget.dart';
import 'package:flutter_airbnb/widgets/selected_destination_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  var step = BookingStep.selectedData;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
      child: Scaffold(
        backgroundColor: appWhite.withOpacity(0.6),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.close),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Stays',
                  style: textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Experiences',
                  style: textTheme.titleMedium,
                ),
              ),
            ],
          ),
          actions: const [
            SizedBox(
              width: 48.0,
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    step = BookingStep.selectedDestination;
                  });
                },
                child: Hero(
                  tag: 'search',
                  child: SelectedDestinationWidget(step: step),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    step = BookingStep.selectedData;
                  });
                },
                child: SelectDateWidget(step: step),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
