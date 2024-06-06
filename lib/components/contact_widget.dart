import 'package:flutter/material.dart';
import 'package:revmed/my_flutter_app_icons.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    side: BorderSide(color: Theme.of(context).primaryColor)),
                child: Icon(
                  Icons.pageview_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 22,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    side: BorderSide(color: Theme.of(context).primaryColor)),
                child: Icon(
                  CustomIcons.instagram,
                  color: Theme.of(context).primaryColor,
                  size: 22,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    side: BorderSide(color: Theme.of(context).primaryColor)),
                child: Icon(
                  Icons.facebook,
                  color: Theme.of(context).primaryColor,
                  size: 22,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    side: BorderSide(color: Theme.of(context).primaryColor)),
                child: Icon(
                  CustomIcons.whatsapp,
                  color: Theme.of(context).primaryColor,
                  size: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
