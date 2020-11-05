import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentify/models/office.dart';

class ReservationDetailPage extends StatelessWidget {
  final reservation;
  final office;

  ReservationDetailPage(this.reservation, this.office);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle'),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(
            'https://www.ceosuite.com/wp-content/uploads/2017/10/Hanoi-Lotte-Center-Serviced-Office-1.jpg?x27776'
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Dirección: ' + office['address'].toString().toUpperCase() + ' Piso ' + office['floor'].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                      ),
                      Text(
                        'Fecha de reserva: ' + reservation['initialDate'].toString().substring(0,10),
                        style: TextStyle(
                          color: Colors.grey[500]
                        ),
                      ),
                      Text(
                        'Hasta: ' + reservation['finishDate'].toString().substring(0,10),
                        style: TextStyle(
                          color: Colors.grey[500]
                        ),
                      ),
                      Text(
                        'Precio: S/.' + office['price'].toString(),
                        style: TextStyle(
                            color: Colors.grey[500]
                        ),
                      ),
                      Text(
                        'Cuenta con una capacidad para ' + office['capacity'].toString() + ' personas.',
                        style: TextStyle(
                            color: Colors.grey[500]
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          office['description'],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow[500]
                ),
                Text(
                  office['score'].toString()
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
