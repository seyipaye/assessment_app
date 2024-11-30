import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

import 'match_details_screen.dart';

typedef Data = Map<String, dynamic>;

typedef GraphPoints = List<GraphPoint>;

class GraphPoint {
  double minute;
  double value;
  GraphPoint({
    required this.minute,
    required this.value,
  });
}

class MatchDetailsController extends GetxController {
  Future<Data> loadData(String path) async {
    // Load the JSON file as a string
    final String jsonString = await rootBundle.loadString(path);

    // Decode the JSON string into a Map
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    return jsonData;
  }

  final incidents = Rxn<Data>();
  final RxList<Widget> incidentWidgets = RxList.empty();
  final RxList<GraphPoint> momentum = RxList.empty();

  @override
  Future<void> onInit() async {
    incidents.value = await loadData('assets/data_samples/incidents.json');
    sortIncidents(incidents.value!);
    momentum.value = await loadMomentum();
    // print(momentum.length);
    super.onInit();
  }

  Future<GraphPoints> loadMomentum() async {
    final response = await loadData('assets/data_samples/momentum.json');

    return (response['data']['graphPoints'] as List)
        .map((e) => GraphPoint(
            minute: (e['minute'] as num?)!.toDouble(),
            value: (e['value'] as num?)!.toDouble()))
        .toList();
  }

  void sortIncidents(Data value) {
    List<Widget> widgets = [];
    final list = value['data']['incidents'] as List;

    List<Data> penalties = [];
    var sortingPenalties = false;

    for (Data incident in list) {
      if (incident.containsKey('text')) {
        if (sortingPenalties == true) {
          widgets.addAll(sortPenalties(penalties));
          sortingPenalties = false;
        }

        String text = 'Invalid';

        if (incident['text'] == 'PEN') {
          text =
              'Penalties (${incident['homeScore']} - ${incident['awayScore']})';
          sortingPenalties = true;
        } else if (incident['text'] == 'ET') {
          text =
              'Extra-Time (${incident['homeScore']} - ${incident['awayScore']})';
        } else if (incident['text'] == 'FT') {
          text =
              'End of 90 Minutes (${incident['homeScore']} - ${incident['awayScore']})';
        } else if (incident['text'] == 'HT') {
          text =
              'Half-time (${incident['homeScore']} - ${incident['awayScore']})';
        }

        // It is a text
        widgets.add(StatText(text));
        continue;
      }

      if (incident.containsKey('player') && sortingPenalties) {
        penalties.add(incident);
        continue;
      }

      if (incident.containsKey('playerIn')) {
        widgets.add(buidInOutItem(incident: incident));
        continue;
      }

      if (incident.containsKey('player')) {
        widgets.add(buidPlayerIncident(incident: incident));
        continue;
      }
    }
    incidentWidgets.value = widgets;
    // debugPrint(list.length.toString());
    // debugPrint(penalties.length.toString());
    // debugPrint(widgets.length.toString());
  }

  List<Widget> sortPenalties(List<Data> values) {
    List<Widget> widgets = [];
    Data? lastPenalty;

    for (int i = 0; i < values.length; i++) {
      final thisPenalty = values[i];

      if ((i + 1).isEven) {
        widgets.add(
          StatsRow(
            time: ((values.length - i) / 2).round().toString(),
            homeWidget: buidPenalityItem(
              thisPenalty['isHome'] ? thisPenalty : lastPenalty!,
            ),
            awayWidget: buidPenalityItem(
              thisPenalty['isHome'] ? lastPenalty! : thisPenalty,
            ),
          ),
        );
      }
      lastPenalty = thisPenalty;
    }

    // for (Data penalty in values) {
    //   // It is a text
    //   if (penalty['isHome']) {
    //     widgets.add();
    //   }
    // }
    return widgets;
  }

  Widget buildPlayerSubTitle(Data incident) {
    var text = '';

    if (incident.containsKey('reason')) {
      text = '(${incident['reason']})';
    }

    if (incident['incidentType'] == 'goal') {
      text = '(Goal)';
    }
    return RowHalf.buildSubTitle(text);
  }

  Widget buildPlayerIcon(Data incident) {
    var path = 'assets/icons/var_icon.png';

    if (incident['incidentType'] == 'card') {
      if (incident['incidentClass'] == 'yellow') {
        path = 'assets/icons/card_yellow.png';
      }
      if (incident['incidentClass'] == 'red') {
        path = 'assets/icons/card_red.png';
      }
    } else if (incident['incidentType'] == 'goal') {
      path = 'assets/icons/goal_icon_black.png';
    }

    return RowHalf.buildIcon(path);
  }

  Widget buidPlayerIncident({required Data incident}) {
    final widget = RowHalf(
      isHome: incident['isHome'],
      leading: RowHalf.buildPlayer(
        incident['isHome']
            ? 'assets/images/player.png'
            : 'assets/images/player2.png',
      ),
      title: RowHalf.buildTitle(incident['player']['shortName']),
      subTitle: buildPlayerSubTitle(incident),
      trailing: buildPlayerIcon(incident),
    );
    return StatsRow(
      time: incident['time'].toString(),
      homeWidget: incident['isHome'] ? widget : null,
      awayWidget: incident['isHome'] ? null : widget,
    );
  }

  Widget buidPenalityItem(Data penalty) {
    return RowHalf(
      isHome: penalty['isHome'],
      leading: RowHalf.buildPlayer(
        penalty['isHome']
            ? 'assets/images/player.png'
            : 'assets/images/player2.png',
      ),
      title: RowHalf.buildTitle(penalty['player']['shortName']),
      trailing: RowHalf.buildIcon(penalty['incidentClass'] == 'scored'
          ? 'assets/icons/goal.png'
          : 'assets/icons/no_goal.png'),
    );
  }

  Widget buidInOutItem({required Data incident}) {
    final widget = RowHalf(
      isHome: incident['isHome'],
      title: RowHalf.buildSubstitution(
          isHome: incident['isHome'],
          inName: incident['playerIn']['shortName'],
          outName: incident['playerOut']['shortName']),
      trailing: RowHalf.buildIcon('assets/icons/swap_icon.png'),
    );
    return StatsRow(
      time: incident['time'].toString(),
      homeWidget: incident['isHome'] ? widget : null,
      awayWidget: incident['isHome'] ? null : widget,
    );

    // return RowHalf(
    //   isHome: penalty['isHome'],
    //   leading: RowHalf.buildPlayer(
    //     penalty['isHome']
    //         ? 'assets/images/player.png'
    //         : 'assets/images/player2.png',
    //   ),
    //   title: RowHalf.buildTitle(penalty['player']['shortName']),
    //   trailing: RowHalf.buildIcon(penalty['incidentClass'] == 'scored'
    //       ? 'assets/icons/goal.png'
    //       : 'assets/icons/no_goal.png'),
    // );
  }
}
