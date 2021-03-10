import 'package:flutter/cupertino.dart';

class NoConnections extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container
    (
      child: Center
      (
        child: Column
        (
          children: <Widget>
          [
            Text("There seems to be a connections problem! Please check your connection")
          ],
        ),
      ),
    );
  }


}