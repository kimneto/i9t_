import 'package:flutter/material.dart';

import 'package:i9trafego/src/app/app.controller.dart';
import 'package:i9trafego/src/component/trafego_card.dart';
import 'package:provider/src/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text("Transaction"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              child: homePageContent(),
              top: 0,
              right: 0,
              left: 0,
            ),
            Positioned(
              top: 215,
              bottom: 0,
              left: 0,
              right: 0,
              child: ListView(
                children: <Widget>[
                  TrafegoCard('token', 'name', 'cryptoAmount', 'cryptoCurrency',
                      'usdAmount', 'cryptoIconURL'),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 9.0, horizontal: 21.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.all(21),
                    child: Row(
                      children: <Widget>[
                        Material(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 21,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Add Token",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Bitcoin, CashCoin, Monero...",
                              style: Theme.of(context).textTheme.subtitle1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                          ],
                        ),
                      ],
                    ),
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

class homePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 269,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 21.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FittedBox(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "Ropten testnet",
                        style: TextStyle(color: Colors.orange, fontSize: 15.0),
                      ),
                    ),
                  ],
                  onChanged: (data) {},
                ),
                DropdownButton<String>(items: [
                  DropdownMenuItem(
                    child: Text(
                      "WfO9TNscPrLMHHwKfJhiCOeAkIiQZNqd",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ], onChanged: (_) {})
              ],
            ),
          ),
          Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Total Balance",
                  style: Theme.of(context).textTheme.subtitle1),
              SizedBox(height: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "\$525.39",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  CustomButton(),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Your Tokens",
                      style: Theme.of(context).textTheme.subtitle1),
                  FlatButton(
                    child: Text(
                      "Make Changes",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                "Add Token",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appController = context.watch<AppController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meus Trafegos'),
        actions: [
          Row(
            children: [
              Text('Escuro'),
              Switch(
                  value: appController.isThemeDark,
                  onChanged: (value) => {appController.setThemeDark(value)}),
            ],
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text('Three-line ListTile'),
              subtitle:
                  Text('A sufficiently long subtitle warrants three lines.'),
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text('Three-line ListTile'),
              subtitle:
                  Text('A sufficiently long subtitle warrants three lines.'),
              isThreeLine: true,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/
