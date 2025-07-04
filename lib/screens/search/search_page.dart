import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/layouts/grid_layout.dart';
import 'package:khedma_link/constants/widgets/appbar/tabbar.dart';
import 'package:khedma_link/constants/widgets/menu_icon.dart';
import 'package:khedma_link/screens/home_page/components/search_container.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';
import 'package:khedma_link/screens/project_detail_page/project_detail_screen.dart';
import 'package:khedma_link/screens/search/components/brand_name.dart';
import 'package:khedma_link/screens/search/components/categorytab.dart';
import 'package:khedma_link/screens/search/components/filter_sheet.dart';
import 'package:khedma_link/model/freelancer_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<String> _allServices = [
    'Web Development',
    'Mobile App Development',
    'UI/UX Design',
    'Graphic Design',
    'Video Editing',
    'Content Writing',
    'Translation Services',
    'Digital Marketing'
  ];
  List<String> _filteredServices = [];

  // Sample freelancer data by category
  final List<Freelancer> codingFreelancers = [
    const Freelancer(
        name: 'Laith', role: 'Flutter Developer', offeredPrice: '\$200'),
    const Freelancer(
        name: 'Sarah', role: 'Full Stack Developer', offeredPrice: '\$300'),
  ];

  final List<Freelancer> designFreelancers = [
    const Freelancer(
        name: 'Maya', role: 'UI/UX Designer', offeredPrice: '\$150'),
    const Freelancer(
        name: 'Zaid', role: 'Graphic Designer', offeredPrice: '\$120'),
  ];

  final List<Freelancer> videoFreelancers = [
    const Freelancer(name: 'Omar', role: 'Video Editor', offeredPrice: '\$100'),
  ];

  final List<Freelancer> writingFreelancers = [
    const Freelancer(
        name: 'Lina', role: 'Content Writer', offeredPrice: '\$90'),
  ];

  @override
  void initState() {
    super.initState();
    _filteredServices = _allServices;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
      _filteredServices = _allServices.where((service) {
        return service.toLowerCase().contains(_searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: TColors.white,
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Search",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          automaticallyImplyLeading: false,
          actions: [
            MenuIcon(
              onPressed: () {},
              iconColor: Colors.black,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: TColors.white,
                expandedHeight: 500,
                flexibleSpace: Container(
                  color: TColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: TSizes.spaceBtwItems),
                        Row(
                          children: [
                            Expanded(
                              child: SearchContainer(
                                controller: _searchController,
                                showBorder: true,
                                showBackground: false,
                                padding: EdgeInsets.zero,
                                onChanged: (value) => _onSearchChanged(),
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (_) => const FilterSheets(),
                                );
                              },
                              icon: const Icon(Icons.filter_list),
                              tooltip: "Filter",
                            ),
                          ],
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        SectionHeading(
                          title: 'Featured services',
                          onPressed: () {},
                          showActionButton: false,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                        GridLayout(
                          itemCount: _filteredServices.length,
                          mainAxisExtent: 75,
                          iteamBuilder: (_, index) {
                            return BrandCart(
                              title: 'Flutter Developer',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const ProjectDetail(
                                      projectId: '123',
                                      title: 'Flutter Developer',
                                      description:
                                          'Looking for experienced Flutter developer',
                                      suggestedPrice: 200,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                bottom: const SearchTabbar(
                  tabs: [
                    Tab(child: Text("Coding")),
                    Tab(child: Text("Designing")),
                    Tab(child: Text("Video & Animation")),
                    Tab(child: Text("Writing & Translation")),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              CategoryTab(
                searchQuery: _searchQuery,
                freelancers: codingFreelancers,
              ),
              CategoryTab(
                searchQuery: _searchQuery,
                freelancers: designFreelancers,
              ),
              CategoryTab(
                searchQuery: _searchQuery,
                freelancers: videoFreelancers,
              ),
              CategoryTab(
                searchQuery: _searchQuery,
                freelancers: writingFreelancers,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
