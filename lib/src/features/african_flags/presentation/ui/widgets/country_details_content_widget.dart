import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_details_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'country_details_section_information_row.dart';
import 'country_details_section_title.dart';

class CountryDetailsContent extends StatelessWidget {
  final CountryDetails country;

  const CountryDetailsContent({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: '${country.cca3}-flag',
                child: Image.network(
                  country.flags?.png ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.flag_outlined, size: 60)),
                ),
              ),
            ),
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      country.name?.common ?? 'Unknown Country',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 20),
                    const CountryDetailsSectiontitle(title: 'Basic Information'),
                    CountryDetailsSectionInfoRow(label: 'Official Name', value: country.name?.official),
                    CountryDetailsSectionInfoRow(label: 'Population', value: country.population),
                    CountryDetailsSectionInfoRow(label: 'Area', value: '${country.area?.toStringAsFixed(0)} km²'),
                    CountryDetailsSectionInfoRow(label: 'Region', value: country.region),
                    CountryDetailsSectionInfoRow(label: 'UN Member', value: country.unMember ?? false ? 'Yes' : 'No'),
                    const SizedBox(height: 20),
                    const CountryDetailsSectiontitle(title: 'Geography'),
                    if (country.latlng?.isNotEmpty ?? false)
                      CountryDetailsSectionInfoRow(
                          label: 'Coordinates', value: '${country.latlng![0]}, ${country.latlng![1]}'),
                    CountryDetailsSectionInfoRow(
                        label: 'Landlocked', value: country.landlocked ?? false ? 'Yes' : 'No'),
                    CountryDetailsSectionInfoRow(label: 'Borders', value: country.borders?.join(', ') ?? 'None'),
                    const SizedBox(height: 20),
                    const CountryDetailsSectiontitle(title: 'Currency & Language'),
                    if (country.currencies != null)
                      ...country.currencies!.entries.map(
                        (e) => CountryDetailsSectionInfoRow(
                            label: 'Currency (${e.key})', value: '${e.value.name} (${e.value.symbol})'),
                      ),
                    if (country.languages != null)
                      CountryDetailsSectionInfoRow(label: 'Languages', value: country.languages!.values.join(', ')),
                    const SizedBox(height: 20),
                    const CountryDetailsSectiontitle(title: 'Maps'),
                    if (country.maps != null)
                      Wrap(
                        spacing: 10,
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(Icons.map),
                            label: const Text('Google Maps'),
                            onPressed: () => _openMap(country.maps!.googleMaps),
                          ),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.map_outlined),
                            label: const Text('OpenStreetMap'),
                            onPressed: () => _openMap(country.maps!.openStreetMaps),
                          ),
                        ],
                      ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  void _openMap(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
