import 'package:bike_rental_online/presentation/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressSelectionScreen extends StatelessWidget {
  final ProfileController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn địa chỉ nhận xe'),
        bottom: PreferredSize(
          child: Container(
            height: 1.0,
            color: Colors.grey.withOpacity(0.5),
          ),
          preferredSize: Size.fromHeight(1.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Địa chỉ',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${_controller.user.name}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' | ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            '${_controller.user.phoneNumber}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${_controller.user.address}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  value: false,
                  groupValue: !_controller.isReceiveAtStore.value,
                  onChanged: (value) {
                    _controller.isReceiveAtStore.value = !value!;
                  },
                ),
                RadioListTile(
                  title: Text('Nhận tại cửa hàng'),
                  value: true,
                  groupValue: _controller.isReceiveAtStore.value,
                  onChanged: (value) {
                    _controller.isReceiveAtStore.value = value!;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle address selection or navigation to another screen
                  },
                  child: Text('Change Address'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
