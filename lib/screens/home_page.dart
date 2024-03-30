import 'package:curalog/components/adaptive_page_scaffold.dart';
import 'package:curalog/components/button.dart';
import 'package:curalog/config/theme/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AdaptivePageScaffold(
      title: Text(
        'Home',
        style: typography(context).largeBody,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: colors(context).primary.s500,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Dr. John Doe!',
                    style: typography(context)
                        .title2
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Do you want to add a new patient? Curalog is here to assist you!',
                    style:
                        typography(context).body.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Button(
                      label: 'Learn how this works',
                      onPressed: () {},
                      labelColor: colors(context).primary.s500,
                      buttonColor: Colors.white,
                      variant: 'filled',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Recent Patients',
                    style: typography(context).title2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
