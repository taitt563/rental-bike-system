import 'package:bike_rental_online/data/models/bikes_model.dart';
import 'package:bike_rental_online/data/repositories_impl/bike_repository_impl.dart';
import 'package:bike_rental_online/domain/repositories/bike_repository.dart';
import 'package:get/get.dart';

class BikeController extends GetxController {
  final BikeRepository _bikeRepo = BikeRepositoryImpl();
  final String title = 'Bikes';
  final RxList<BikesModel> bikes = RxList<BikesModel>([]);
  final RxList<BikesModel> filteredBikes = RxList<BikesModel>([]);
  List<BikesModel> orderedBikes = [];

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
        filteredBikes.value =
            bikeList; // Initialize filteredBikes with all bikes
      }, onError: (e) {
        print('Error fetching bikes: $e');
      });
    } catch (e) {
      print('Error fetching bikes: $e');
    }
  }

  void searchBikes(String keyword) {
    if (keyword.isEmpty) {
      filteredBikes.value = bikes;
    } else {
      filteredBikes.value = bikes
          .where((bike) =>
              bike.name!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
  }

  List<BikesModel> get bikesList => bikes;

  void filterOrderedBikes(List<String> bikeIds) {
    // Clear the previous list of ordered bikes
    orderedBikes.clear();

    // Filter the bikes based on the bikeIds
    for (var bikeId in bikeIds) {
      if (bikeId != null) {
        BikesModel? bike = bikes.firstWhere(
          (bike) => bike.id == bikeId,
          orElse: () => BikesModel(), // Default BikesModel object if not found
        );
        if (bike != null) {
          orderedBikes.add(bike); // Add the bike to the orderedBikes list
        }
      }
    }
  }

  List<BikesModel> getOrderedBikes(List<String> bikeIds) {
    return bikes.where((bike) => bikeIds.contains(bike.id)).toList();
  }
}
