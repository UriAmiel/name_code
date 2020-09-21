import 'package:flutter/material.dart';
import 'package:name_code/Components/RegularInfoRow.dart';
import 'package:name_code/Components/WinningInfoRow.dart';
import 'package:name_code/Utilities/BoardData.dart';
import 'package:provider/provider.dart';

class UpperInfoRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<BoardData>(context).getSomeoneWon()
        ? WinningInfoRow()
        : RegulartInfoRow();
  }
}
