import 'dart:io';
import 'package:csv/csv.dart';

abstract class ICSVService{
  writeCSV(List<int>countList, int positionOnList);
  isFileEmpty();
  isTimeEmpty();
}

class CSVService extends ICSVService{
  @override
  isFileEmpty() {
    // TODO: implement isFileEmpty
    throw UnimplementedError();
  }

  @override
  isTimeEmpty() {
    // TODO: implement isTimeEmpty
    throw UnimplementedError();
  }

  String convertPositionToTime(int pos){
    return "${pos~/4<10?"0"+(pos~/4).toString():pos~/4}:${pos%4 == 0 ? "00" : (pos%4)*15}";
  }

  @override
  writeCSV(List<int>countList, int positionOnList) async{
    File file = File("lib/service//planilha_tabulacao.csv");
    String data = '';
    if(await file.exists()){
      data = await file.readAsString();
    }else{

      var items = List<List<String>>.generate(24*4, (i) => [convertPositionToTime(i)]);

      file = await file.writeAsString(ListToCsvConverter().convert(items));
    }

    List<List<dynamic>> linesList = CsvToListConverter().convert(data);
    print(linesList.length);

    linesList[positionOnList] = [convertPositionToTime(positionOnList)]+ countList.map((e) => e.toString()).toList();
    print(linesList[positionOnList]);
    file.writeAsString(ListToCsvConverter().convert(linesList));
  }

}