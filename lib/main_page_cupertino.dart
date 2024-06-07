import 'package:flutter/cupertino.dart';

class MainPageCupertino extends StatefulWidget {
  const MainPageCupertino({super.key});

  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void pressed() {
      setState(() {
        result = double.parse(textEditingController.text) * 83.52;
      });
    }

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: Text(
          'Currency Converter',
          style: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result != 0 ? result.toStringAsFixed(2) : '0',
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              CupertinoTextField(
                placeholder: 'Enter amount to convert in USD',
                prefix: const Icon(CupertinoIcons.money_dollar),
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const BoxDecoration(
                  color: CupertinoColors.white,
                ),
              ),
              const SizedBox(height: 10),
              CupertinoButton(
                onPressed: pressed,
                color: CupertinoColors.black,
                child: const Text('Convert'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
