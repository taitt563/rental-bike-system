import 'package:bike_rental_online/data/models/bikes_model.dart';
import 'package:bike_rental_online/data/repositories_impl/bike_repository_impl.dart';
import 'package:bike_rental_online/domain/repositories/bike_repository.dart';
import 'package:get/get.dart';

class BikeController extends GetxController {
  final BikeRepository _bikeRepo = BikeRepositoryImpl();
  final String title = 'Bikes';
  final RxList<BikesModel> bikes = RxList<BikesModel>([]);

  @override
  void onInit() {
    super.onInit();
    fetchBikes();
  }

  void fetchBikes() {
    try {
      final bikeStream = _bikeRepo.getBikesStream();
      bikeStream.listen((bikeList) {
        bikes.value = bikeList;
      }, onError: (e) {
        print('Error fetching bikes: $e');
      });
    } catch (e) {
      print('Error fetching bikes: $e');
    }
  }
}
