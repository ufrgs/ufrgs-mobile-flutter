import 'package:flutter/material.dart';
import 'package:ufrgs_mobile/models/ticket.dart';
import 'package:ufrgs_mobile/utils/colors.dart';

StatefulBuilder getTicketsAlert(Future<List<Tiquete>> future) {
  return StatefulBuilder(builder: (context, setState) {
    var maxHeight = MediaQuery.of(context).size.height * 0.40;

    return AlertDialog(
      scrollable: false,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.translate(
            offset: Offset(0, -60),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/circulo_ticket.png'),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -30),
            child: ConstrainedBox(
              constraints: new BoxConstraints(
                maxHeight: maxHeight,
              ),
              child: FutureBuilder(
                  future: future,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      List<Tiquete> list = snapshot.data;
                      var map = list.map((e) => TicketRow(e)).toList();
                      return SingleChildScrollView(
                        child: Column(
                          children: map,
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  });
}

class TicketRow extends StatelessWidget {
  final Tiquete ticket;

  const TicketRow(this.ticket, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          ticket.nrtiquete,
          style: TextStyle(
            fontSize: 45,
            color: AppColors.red,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(height: 4),
        Text(
          '${ticket.nrrefeicoesresta} de ${ticket.nrrefeicoestotal} disponível',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Container(height: 4),
        LinearProgressIndicator(
          value: ticket.getProgress(),
          backgroundColor: Colors.grey.shade200,
          color: AppColors.red,
        ),
        Container(height: 16),
      ],
    );
  }
}
