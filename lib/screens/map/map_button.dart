import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/colors.dart';
import '../../data/maps/repo/maps_repo.dart';
import '../../data/maps/web_services/maps_web_servies.dart';
import 'map_screen/cubit/map_cubit.dart';
import 'map_screen/map_screen.dart';

class MapButton extends StatelessWidget {
  const MapButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body:Center(
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (BuildContext context) =>
                  MapsCubit(MapsRepository(PlacesWebservices())),
              child: const MapScreen(),
            ),
          ));
        },
        child: Text('Go To Map Screen',style: TextStyle(
          color: Colors.white,
        ),),
        color: mainColor,

      ),
    )

    );
  }
}
