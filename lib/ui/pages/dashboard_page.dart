part of 'pages.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<void> _fetchStatisticsFuture;

  List<String> chartTitles = [
    'Waktu Mulai Mencari Pekerjaan',
    'Instansi Pekerjaan',
    'Waktu Tunggu',
    'Range Gaji Alumni',
    'Kesesuaian Prodi dengan Pekerjaan',
  ];

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<DashoardViewmodel>(context, listen: false);
    _fetchStatisticsFuture = viewModel.fetchStatistics();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DashoardViewmodel>(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [lightBlue, darkBlue]),
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(25)),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Dashboard',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
            ),
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: _fetchStatisticsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              itemCount: viewModel.statistics?.data.length ?? 0,
              itemBuilder: (context, index) {
                String key = viewModel.statistics!.data.keys.elementAt(index);
                Statistic statistic = viewModel.statistics!.data[key]!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          Container(
                            height: 49,
                            width: 20,
                            decoration: BoxDecoration(color: orangeColor),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Color(0xff0558A4), Color(0xff0038FF)],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight)),
                              child: Text(
                                chartTitles[index],
                                style: whiteTextStyle.copyWith(fontSize: 13, fontWeight: bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    _buildChart(statistic),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildChart(Statistic statistic) {
    switch (statistic.chartType.type) {
      case 'bar':
        return _buildBarChart(statistic);
      case 'doughnut':
        return _buildDoughnutChart(statistic);
      default:
        return Container();
    }
  }

  Widget _buildBarChart(Statistic statistic) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: BarChart(
          BarChartData(
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        statistic.counts[value.toInt()].label,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    );
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            barGroups: statistic.counts.map(
                  (data) {
                int index = statistic.counts.indexOf(data);
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: data.count.toDouble(),
                      color: Colors.blue,
                      width: 24,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildDoughnutChart(Statistic statistic) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: PieChart(
          PieChartData(
            sections: statistic.counts.map(
                  (data) {
                int index = statistic.counts.indexOf(data);
                return PieChartSectionData(
                  value: data.count.toDouble(),
                  title: data.label,
                  color: Colors.primaries[index % Colors.primaries.length],
                  radius: 100,
                  titleStyle: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }

  Widget titleSection(BuildContext context, String title) {
    return Row(
      children: [
        Container(
          height: 49,
          width: 20,
          decoration: BoxDecoration(color: orangeColor),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff0558A4), Color(0xff0038FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: Text(
              title,
              style: whiteTextStyle.copyWith(fontSize: 13, fontWeight: bold),
            ),
          ),
        )
      ],
    );
  }
}