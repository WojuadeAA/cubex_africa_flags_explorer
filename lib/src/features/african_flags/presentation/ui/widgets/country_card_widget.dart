import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/ui/screens/country_details_screen.dart';
import 'package:flutter/material.dart';

class CountryCardWidget extends StatelessWidget {
  const CountryCardWidget({super.key, required this.country});
  final Country country;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CountryDetailsScreen(countryName: country.name.common),
        ),
      ),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: country.name.common,
                child: CachedNetworkImage(
                  imageUrl: country.flags.png,
                  fit: BoxFit.cover,
                  height: 200,
                  placeholder: (context, url) => Container(
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      country.name.common,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      country.capital.firstOrNull ?? 'No Capital',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 4,
                      children: country.languages.entries
                          .map((e) => Chip(
                                label: Text(e.value),
                                labelStyle: const TextStyle(fontSize: 10),
                                backgroundColor: Colors.white.withOpacity(0.2),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
