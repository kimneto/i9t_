import 'package:flutter/material.dart';

class TrafegoCard extends StatelessWidget {
  String token, name, cryptoAmount, cryptoCurrency, usdAmount, cryptoIconURL;

  TrafegoCard(
    this.token,
    this.name,
    this.cryptoAmount,
    this.cryptoCurrency,
    this.usdAmount,
    this.cryptoIconURL,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 21.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.all(21),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Image.network(
                cryptoIconURL,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    token,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Text(
                    "$cryptoAmount $cryptoCurrency",
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    "\$$usdAmount",
                    style: Theme.of(context).textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
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
