import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:filter_list/filter_list.dart';
import 'package:sp_flutter_app/models/event.dart';
import 'package:sp_flutter_app/shared/constants.dart';
import 'package:sp_flutter_app/shared/widgets/heading_text.dart';
import 'package:sp_flutter_app/shared/widgets/latest_event_card.dart';
import 'package:sp_flutter_app/shared/widgets/scaffold_with_gradient.dart';
import 'package:sp_flutter_app/shared/widgets/sponsored_event_card.dart';

class EventListView extends StatefulWidget {
  @override
  _EventListViewState createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  List<String> countList = [
    "Alphabetical",
    "Newest",
    "Oldest",
    "Soonest",
    "Latest"
  ];
  List<String> selectedCountList = [];

  List<SEvent> sponsoredEvents = [
    SEvent(
      title: "Become an RA interest meeting",
      date: "Wednesday, 7:30PM",
      location: "Taylor Auditorium",
    ),
    SEvent(
      title: "Intramural Football",
      date: "Friday, 6:30PM",
      location: "Intramural Fields",
    ),
    SEvent(
      title: "Cowbell yell",
      date: "Wednesday, 7:30PM",
      location: "Bettersworth Auditorium",
    ),
  ];

  List<LEvent> latestEvents = [
    LEvent(
      title: "Become an RA interest meeting",
      date: "Wednesday, 7:30PM",
      location: "Taylor Auditorium",
    ),
    LEvent(
      title: "Cowbell yell",
      date: "Wednesday, 7:30PM",
      location: "Bettersworth Auditorium",
    ),
    LEvent(
      title: "Intramural Football",
      date: "Friday, 6:30PM",
      location: "Intramural Fields",
    ),
    LEvent(
      title: "Become an RA interest meeting",
      date: "Wednesday, 7:30PM",
      location: "Taylor Auditorium",
    ),
    LEvent(
      title: "Intramural Football",
      date: "Friday, 6:30PM",
      location: "Intramural Fields",
    )
  ];

  void _openFilterDialog() async {
    await FilterListDialog.display(context,
        listData: countList,
        height: 380,
        borderRadius: 20,
        headlineText: "Select Filters",
        searchFieldHintText: "Search Here",
        selectedListData: selectedCountList, onApplyButtonClick: (list) {
      if (list != null) {
        setState(() {
          selectedCountList = List.from(list);
        });
      }
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ScaffoldWithGradient(
      bottomBar: true,
      children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              child: Container(
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: size.width,
                      margin: const EdgeInsets.only(
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                        bottom: kDefaultPadding,
                      ),
                      child: HeadingText(
                        text: "Sponsored Events",
                        scale: 0.5,
                        align: TextAlign.left,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 210,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: sponsoredEvents.length,
                          itemBuilder: (context, index) {
                            return SponsoredEventCard(
                              title: sponsoredEvents[index].title,
                              location: sponsoredEvents[index].location,
                              date: sponsoredEvents[index].date,
                            );
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //latest event
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                            vertical: kDefaultPadding,
                          ),
                          child: HeadingText(
                            text: "Latest Events",
                            scale: 0.5,
                            align: TextAlign.left,
                          ),
                        ),
                        Container(
                          //take away this
                          child: IconButton(
                            icon: Icon(Icons.filter_list),
                            color: Colors.white,
                            onPressed: _openFilterDialog,
                            iconSize: 30,
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: latestEvents.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return LatestEventCard(
                            title: latestEvents[index].title,
                            location: latestEvents[index].location,
                            date: latestEvents[index].date,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
