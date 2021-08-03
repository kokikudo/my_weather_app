import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'search date',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Icon(Icons.refresh)
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Location Name',
              style: Theme.of(context).textTheme.headline5,
            ),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 30,
              endIndent: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Address',
                  style: Theme.of(context).textTheme.subtitle2,
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Address Text',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 30,
              endIndent: 30,
            ),
            Row(
              children: [
                Icon(Icons.wb_sunny),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Current weather',
                  style: Theme.of(context).textTheme.subtitle2,
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  '00',
                  style: _textTheme.headline4,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '℃',
                  style: _textTheme.headline5,
                ),
                Expanded(child: SizedBox()),
                Container(
                  color: Colors.blue,
                  child: Text('weater icon'),
                ),
                Expanded(child: SizedBox()),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Feels like',
                          style: _textTheme.bodyText2,
                        ),
                        Text(
                          '+15',
                          style: _textTheme.bodyText1,
                        )
                      ],
                    ),
                    Text(
                      'weather condition',
                      style: _textTheme.bodyText2,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
