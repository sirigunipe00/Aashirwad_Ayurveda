import 'package:aashirwad/core/app_router/app_route.dart';
import 'package:aashirwad/core/model/page_list_filters.dart';
import 'package:aashirwad/core/model/pair.dart';
import 'package:aashirwad/core/utils/string_utils.dart';
import 'package:aashirwad/features/stock_transfer/presentation/bloc/block_provider.dart';
import 'package:aashirwad/features/stock_transfer/presentation/bloc/stock_entry_filters.dart';
import 'package:aashirwad/features/stock_transfer/presentation/ui/widget/stock_entry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockEntryListScrn extends StatefulWidget {
  const StockEntryListScrn({super.key});

  @override
  State<StockEntryListScrn> createState() => _StockEntryListScrnState();
}

class _StockEntryListScrnState extends State<StockEntryListScrn> {
  late final StockEntriesCubit _entriesCubit;
  late final StockEntryFilterCubit _filterCubit;

  final TextEditingController _searchController = TextEditingController();

  static const _statusOptions = ['All', 'Draft', 'Submitted'];
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _entriesCubit = StockEntryBlocProvider.get().fetchStockEntries();
    _filterCubit = StockEntryFilterCubit();
    _fetchInitial();
  }

  @override
  void dispose() {
    _entriesCubit.close();
    _filterCubit.close();
    _searchController.dispose();
    super.dispose();
  }

  void _fetchInitial() {
    final filter = _filterCubit.state;
    _entriesCubit.fetchInitial(
      Pair(StringUtils.docStatusInt(filter.status), filter.query),
    );
  }

  void _fetchMore() {
    final filter = _filterCubit.state;
    _entriesCubit.fetchMore(
      Pair(StringUtils.docStatusInt(filter.status), filter.query),
    );
  }

  void _onSearch(String value) {
  _filterCubit.onSearch(value);
  final filter = _filterCubit.state;
  _entriesCubit.fetchInitial(
    Pair(StringUtils.docStatusInt(filter.status), value), 
  );
}

void _onStatusChange(String status) {
  _filterCubit.onChangeStatus(status);
  final filter = _filterCubit.state;
  _entriesCubit.fetchInitial(
    Pair(StringUtils.docStatusInt(status), filter.query), 
  );
}

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _entriesCubit),
        BlocProvider.value(value: _filterCubit),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F0FA),
        body: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: RefreshIndicator(
    onRefresh: () async {
      _searchController.clear();

      _filterCubit.onSearch('');

      _entriesCubit.fetchInitial(
        Pair(
          StringUtils.docStatusInt(_filterCubit.state.status),
          '',
        ),
      );

      await Future.delayed(const Duration(milliseconds: 500));
    },
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          _buildSearchBar(),
                          const SizedBox(height: 10),
                          _buildStatusFilter(),
                          const SizedBox(height: 10),
                          _buildTodayBanner(),
                          const SizedBox(height: 12),
                          const Text(
                            'Entries',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333),
                            ),
                          ),
                          const SizedBox(height: 6),
                        ]),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                      sliver: BlocBuilder<StockEntriesCubit, StockEntriesCubitState>(
                        bloc: _entriesCubit,
                        builder: (context, state) {
                          if (state.records.isEmpty && state.isLoading) {
                            return const SliverFillRemaining(
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          if (state.records.isEmpty) {
                            return const SliverFillRemaining(
                              child: Center(
                                child: Text(
                                  'No Stock Entries Found',
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xFF999999)),
                                ),
                              ),
                            );
                          }
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                // if (index == state.records.length - 3) {
                                //   _fetchMore();
                                // }
                                
                                _fetchMore();
                                final entry = state.records[index];
                                return StockEntryWidget(
                                  stockEntry: entry,
                                  onTap: () => AppRoute.newStockEntry
                                      .push<bool?>(context, extra: entry.name),
                                );
                              },
                              childCount: state.records.length,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomSheet: _buildBottomSheet(context),
      ),
    );
  }

  // ── Header ────────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF9B82DB), Color(0xFFB89FE8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                  ),
                  const Expanded(
                    child: Text(
                      'Material Transfer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                 GestureDetector(
  onTap: () async {
    setState(() => _isRefreshing = true);

    _fetchInitial();

    await Future.delayed(const Duration(milliseconds: 500));

    if (mounted) {
      setState(() => _isRefreshing = false);
    }
  },
  child: _isRefreshing
      ? const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
      : const Icon(
          Icons.sync,
          color: Colors.white,
          size: 20,
        ),
),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color:  Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _warehouseBox('From warehouse', 'FQC Warehouse -\nRCPL'),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, left: 8, right: 8),
                      child: Icon(Icons.arrow_forward, color: Colors.black, size: 18),
                    ),
                    const SizedBox(width: 5),
                    _warehouseBox('To warehouse', 'Finished Goods -\nRCPL'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _warehouseBox(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.black, fontSize: 14)),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ── Search bar ────────────────────────────────────────────────────────────
  Widget _buildSearchBar() {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Icon(Icons.search, color: Color(0xFFAAAAAA), size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: _onSearch,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                hintText: 'Search entry...',
                hintStyle: TextStyle(color: Color(0xFFBBBBBB), fontSize: 16),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  // ── Status filter ─────────────────────────────────────────────────────────
  Widget _buildStatusFilter() {
    return BlocBuilder<StockEntryFilterCubit, PageListFilters>(
      bloc: _filterCubit,
      builder: (context, filterState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(8),
            //     border: Border.all(color: const Color(0xFFE0E0E0)),
            //   ),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       const Icon(Icons.filter_list, size: 15, color: Color(0xFF888888)),
            //       const SizedBox(width: 6),
            //       Text(
            //         'Status: ${filterState.status}',
            //         style: const TextStyle(fontSize: 13, color: Color(0xFF444444)),
            //       ),
            //       const SizedBox(width: 4),
            //       const Icon(Icons.keyboard_arrow_down, size: 16, color: Color(0xFF888888)),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 8),
            Row(
              children: _statusOptions.map((s) {
                final selected = filterState.status == s;
                return GestureDetector(
                  onTap: () => _onStatusChange(s),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                    decoration: BoxDecoration(
                      color: selected ? _pillSelectedBg(s) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: selected
                            ? _pillSelectedBorder(s)
                            : const Color(0xFFE0E0E0),
                      ),
                    ),
                    child: Text(
                      s,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: selected ? _pillSelectedFg(s) : const Color(0xFF666666),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  Color _pillSelectedBg(String s) => switch (s) {
        'All' => const Color(0xFF9B82DB),
        'Draft' => const Color(0xFFFFF0C2),
        'Submitted' => const Color(0xFFC6F0D8),
        _ => const Color(0xFFEEEEEE),
      };

  Color _pillSelectedBorder(String s) => switch (s) {
        'All' => const Color(0xFF7B62BB),
        'Draft' => const Color(0xFFF5E6B0),
        'Submitted' => const Color(0xFFB2DFCA),
        _ => const Color(0xFFCCCCCC),
      };

  Color _pillSelectedFg(String s) => switch (s) {
        'All' => Colors.white,
        'Draft' => const Color(0xFFB8860B),
        'Submitted' => const Color(0xFF2D7A50),
        _ => Colors.black,
      };


 Widget _buildTodayBanner() {
  return BlocBuilder<StockEntriesCubit, StockEntriesCubitState>(
    bloc: _entriesCubit,
    builder: (context, state) {
      final today = DateTime.now();

      // Count only entries whose creation date matches today
      final todayCount = state.records.where((entry) {
        if (entry.creation == null) return false;
        final created = DateTime.tryParse(entry.creation!);
        if (created == null) return false;
        return created.year == today.year &&
            created.month == today.month &&
            created.day == today.day;
      }).length;

      final hour = today.hour.toString().padLeft(2, '0');
      final minute = today.minute.toString().padLeft(2, '0');

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE8E8E8)),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Today',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(
                  'Last update: $hour:$minute',
                  style: const TextStyle(fontSize: 16, color: Color(0xFF999999)),
                ),
              ],
            ),
            const Spacer(),
            Text(
              '$todayCount',
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF9B82DB)),
            ),
            const SizedBox(width: 4),
            const Text('entries',
                style: TextStyle(fontSize: 15, color: Color(0xFF999999))),
          ],
      ),
      );
    },
  );
}


  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFFF3F0FA),
        border: Border(top: BorderSide(color: Color(0xFFE0E0E0))),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
  final result = await AppRoute.newStockEntry.push<bool>(context);

  if (result == true) {
    _fetchInitial(); // Refresh list
  }
},
              icon: const Icon(Icons.add, size: 18),
              label: const Text('New Material Transfer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9B82DB),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}