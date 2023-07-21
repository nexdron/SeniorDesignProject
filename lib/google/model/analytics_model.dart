import 'package:collection/collection.dart';

class PricePoint{
  final double x;
  final double y;

  PricePoint({required this.x, required this.y});

}

List<PricePoint> getPricePoints(){
  final data = <double>[100000000,200000,30000,4000000];
  return data.mapIndexed(((index, element) => 
                            PricePoint(x: index.toDouble(), y: element)))
                            .toList();
}