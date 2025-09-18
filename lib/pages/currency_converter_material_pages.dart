import 'package:flutter/material.dart';
// 1. create a variable that stores converted currency value
// 2. create a function that multiplies the value given by the textfied to 81
// 3. store the value in the variable we created
// 4. display that variable

class CurrencyConverterMaterialPages extends StatefulWidget{
  const CurrencyConverterMaterialPages({super.key});

  @override
  State<CurrencyConverterMaterialPages> createState() => _CurrencyConverterMaterialPages();
}

class _CurrencyConverterMaterialPages extends State<CurrencyConverterMaterialPages> {
  double result = 0.0;
  final TextEditingController textEditingController = TextEditingController();
    
  void convert() {
    result = double.parse(textEditingController.text) * 81;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();  
  }
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
    );

    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: const Text("Currency Converter",
          style: TextStyle(
            color:Color.fromARGB(255, 6, 41, 69),
            fontWeight: FontWeight.bold
          )
          ),

        ),
        body: Center(
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
            
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: "Enter currency in USD",
                    prefixIcon: Icon(Icons.monetization_on),
                    prefixIconColor: Color.fromARGB(255, 6, 41, 69),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    convert();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 6, 41, 69),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                  child: const Text('Convert'), 
                ),
              ],
            ),
          )
        ),
      );
  }
}
