import 'package:cashrich/Model/model.dart';
import 'package:flutter/material.dart';

class CoinContainer extends StatelessWidget {
  Usd usd;
  Btc btc;
  CoinContainer({required this.btc, required this.usd, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  overflow: TextOverflow.clip,
                  btc.name,
                  style: const TextStyle(
                      fontSize: 21,
                      color: Color.fromARGB(
                        255,
                        245,
                        220,
                        1,
                      ),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              usd.percentChange24H > 0
                  ? const Icon(
                      Icons.arrow_drop_up_sharp,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Colors.red,
                    ),
              Text(
                '${usd.percentChange24H.toStringAsFixed(2)}%',
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const Spacer(),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 19),
                  color: const Color.fromARGB(
                    255,
                    49,
                    49,
                    48,
                  ),
                  child: Text(
                    btc.symbol,
                    style: const TextStyle(color: Colors.white),
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Price   \$ ${usd.price.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 23,
              ),
              Text(
                'Rank     ${btc.cmcRank}',
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_circle_right_rounded,
                color: Color.fromARGB(255, 250, 226, 1),
                size: 34,
              )
            ],
          )
        ],
      ),
    );
  }
}
