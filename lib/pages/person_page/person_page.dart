import 'package:faturcodetestnttflutter/bloc/get_persons_bloc.dart';
import 'package:faturcodetestnttflutter/injection_container.dart';
import 'package:faturcodetestnttflutter/model/person_model/person.dart';
import 'package:faturcodetestnttflutter/model/person_model/person_response.dart';
import 'package:faturcodetestnttflutter/pages/person_page/detail_person_page.dart';
import 'package:faturcodetestnttflutter/style/theme.dart' as Style;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  void initState() {
    super.initState();
    sl<PersonsListBloc>().getPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "TRENDING PERSONS ON THIS WEEK",
            style: TextStyle(
                color: Style.Colors.titleColor,
                fontWeight: FontWeight.w500,
                fontSize: 12.0),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        StreamBuilder<PersonResponse>(
          stream: sl<PersonsListBloc>().subject.stream,
          builder: (context, AsyncSnapshot<PersonResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.error.isNotEmpty) {
                return _buildErrorWidget(snapshot.data!.error);
              }
              return _buildHomeWidget(snapshot.data!);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error.toString());
            } else {
              return _buildLoadingWidget();
            }
          },
        )
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          ),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildHomeWidget(PersonResponse data) {
    List<PersonModel?> persons = data.persons;
    if (persons.isEmpty) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: const <Widget>[
                Text(
                  "No More Persons",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else {
      return Container(
        height: 116.0,
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: persons.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(top: 10.0, right: 8.0),
              width: 100.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPersonPage(person: persons[index]),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    persons[index]!.profileImg == ''
                        ? Hero(
                            tag: persons[index]!.id,
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Style.Colors.secondColor),
                              child: const Icon(
                                FontAwesomeIcons.userLarge,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Hero(
                            tag: persons[index]!.id,
                            child: Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w300/${persons[index]!.profileImg}")),
                                )),
                          ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      persons[index]!.name,
                      maxLines: 2,
                      style: const TextStyle(
                          height: 1.4,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 9.0),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Trending for ${persons[index]!.known}",
                      maxLines: 2,
                      style: const TextStyle(
                          height: 1.4,
                          color: Style.Colors.titleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 7.0),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
