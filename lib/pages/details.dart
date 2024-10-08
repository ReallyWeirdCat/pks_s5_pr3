import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

ConfettiController confettiController = ConfettiController();

class Details extends StatelessWidget {
  final Product product;

  const Details({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        titleTextStyle: const TextStyle(
          fontSize: 24,
          color: Colors.black
        ),
        title: const Center(child: Text('Овощной')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text(
                product.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Center(
                child: Image(
                  image: AssetImage(product.photo),
                  width: MediaQuery.of(context).size.width*0.9,
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      margin: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                      width: MediaQuery.of(context).size.height * 0.1,
                      height: MediaQuery.of(context).size.height * 0.045,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: const Color(0xFF40DF40),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Text(
                        "${product.discount} р",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(1),
                      margin: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                      width: MediaQuery.of(context).size.height * 0.1,
                      height: MediaQuery.of(context).size.height * 0.045,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.red,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Text(
                        "${product.discount}%",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    ConfettiWidget(
                      confettiController: confettiController,
                      blastDirectionality: BlastDirectionality.explosive,
                      numberOfParticles: 100,
                    ),
                    Container(
                      padding: EdgeInsets.all(1),
                      margin: const EdgeInsets.only(right: 10, top: 10, bottom: 9),
                      //width: MediaQuery.of(context).size.height * 0.32,
                      height: MediaQuery.of(context).size.height * 0.05,
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () async {
                          confettiController.play();
                          await Future.delayed(const Duration(seconds: 1));
                          confettiController.stop();
                          //Navigator.of(context).pop();
                          },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFFF00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: Text(
                          "В корзину!",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: MediaQuery.of(context).size.height * 0.03,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}