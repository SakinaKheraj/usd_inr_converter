import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class CurrencyConverterCupertinoPages extends StatefulWidget {
  const CurrencyConverterCupertinoPages({super.key});

  @override
  State<CurrencyConverterCupertinoPages> createState() =>
      _CurrencyConverterCupertinoPagesState();
      
}

class _CurrencyConverterCupertinoPagesState extends
 State<CurrencyConverterCupertinoPages> {
  double result = 0.0;
  final TextEditingController textEditingController = TextEditingController();
    
  void convert() {
    result = double.parse(textEditingController.text) * 81 ;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    
    return CupertinoPageScaffold (
        backgroundColor: CupertinoColors.activeBlue,
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: CupertinoColors.activeBlue,
          middle: Text("Currency Converter",
          style: TextStyle(
            color:Color.fromARGB(255, 6, 41, 69),
            fontWeight: FontWeight.bold
          )
          ),

        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'INR ${result !=0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                ),
            
                CupertinoTextField(
                  controller: textEditingController,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    color: CupertinoColors.white,
                  ),
                  placeholder: "Enter currency in USD",
                  prefix: Icon(CupertinoIcons.money_dollar),
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
                const SizedBox(height: 20),
                CupertinoButton(
                  onPressed: () {
                    convert();
                  },
                  color: CupertinoColors.black,
                  child: const Text('Convert'),
                ),
              ],
            ),
          )
        ),
      );
  }
}