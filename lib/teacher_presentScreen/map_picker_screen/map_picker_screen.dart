import 'package:first_project/teacher_presentScreen/create_newclasses/classCreateController/class_create_controller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPickerScreen extends StatefulWidget {
  // Variable to receive the controller from the previous screen
  final CreateClassController controller;

  const MapPickerScreen({super.key, required this.controller});

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  GoogleMapController? _mapController;
  final TextEditingController _searchController = TextEditingController();

  // Default location (Coordinates for Dhaka)
  LatLng currentCenter = const LatLng(23.8103, 90.4125);
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Get the user's current location when the screen starts
    _getCurrentLocation();
  }

  // Logic to get the phone's current GPS location
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
    _animateToLocation(LatLng(position.latitude, position.longitude));
  }

  // Move the map camera to a specific location
  void _animateToLocation(LatLng latLng) {
    setState(() {
      currentCenter = latLng; // Update the center point
    });
    _mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  // Search for a place name and move the map there
  Future<void> _searchAndNavigate() async {
    String query = _searchController.text;
    if (query.isEmpty) return;

    setState(() => isLoading = true);
    try {
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        Location loc = locations.first;
        _animateToLocation(LatLng(loc.latitude, loc.longitude));
        if (mounted) FocusScope.of(context).unfocus(); // Close the keyboard
      } else {
        Get.snackbar("Not Found", "Location not found");
      }
    } catch (e) {
      Get.snackbar("Error", "Could not find location");
    } finally {
      setState(() => isLoading = false);
    }
  }

  // Convert map coordinates into a readable address and send back to controller
  Future<void> _confirmLocation() async {
    setState(() => isLoading = true);
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentCenter.latitude,
        currentCenter.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        // Logic to remove "Plus Codes" (e.g., 8V5+...) from address text
        bool isBadCode(String? text) {
          if (text == null || text.isEmpty) return true;
          return text.contains("+");
        }

        // Combine address parts (Street, Area, City, Country)
        List<String> parts = [];
        if (!isBadCode(place.name)) parts.add(place.name!);
        if (!isBadCode(place.subLocality) && place.subLocality != place.name) {
          parts.add(place.subLocality!);
        }
        if (!isBadCode(place.locality)) parts.add(place.locality!);
        if (place.country != null) parts.add(place.country!);

        String formattedAddress = parts.join(", ");

        // Final check: if address is too short, use street name or default text
        if (formattedAddress.isEmpty || formattedAddress.length < 5) {
          if (!isBadCode(place.street)) {
            formattedAddress = place.street!;
          } else {
            formattedAddress = "selected Location";
          }
        }

        // Update the main controller with the selected location details
        widget.controller.setLocationFromMap(
          currentCenter.latitude,
          currentCenter.longitude,
          formattedAddress,
        );
        Get.back(); // Return to the previous screen
      }
    } catch (e) {
      Get.snackbar("Error", "Could not fetch address details");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Pick Class Location")),
      body: Stack(
        children: [
          // The Google Map view
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentCenter,
              zoom: 15,
            ),
            onMapCreated: (ctrl) => _mapController = ctrl,

            // Update center point whenever user moves the map
            onCameraMove: (pos) {
              currentCenter = pos.target;
            },

            onTap: (latLng) => _animateToLocation(latLng),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),

          // Static Red Pin icon in the center of the map
          const Center(
            child: Icon(Icons.location_on, size: 40, color: Colors.red),
          ),

          // Search Input Bar
          Positioned(
            top: 10,
            left: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: "Search city or area...",
                        border: InputBorder.none,
                      ),
                      onSubmitted: (val) => _searchAndNavigate(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _searchAndNavigate,
                  ),
                ],
              ),
            ),
          ),

          // "My Location" button
          Positioned(
            top: 70,
            right: 15,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.white,
              onPressed: _getCurrentLocation,
              child: const Icon(Icons.my_location, color: Colors.blue),
            ),
          ),

          // "Confirm Location" button at the bottom
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: isLoading ? null : _confirmLocation,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.blue,
              ),
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      "Confirm Location",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
