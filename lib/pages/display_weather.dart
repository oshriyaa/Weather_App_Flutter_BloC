import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event/weather_event.dart';
import 'package:weather_app/bloc/weather_state/weather_state.dart';
import 'package:weather_app/pages/weather_info.dart';

class DisplayWeather extends StatelessWidget {
  const DisplayWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _searchKey = GlobalKey<FormState>();
    String? city;
    late TextEditingController? cityController = TextEditingController();

    return BlocProvider<WeatherBloc>(
      create: (context) =>
          WeatherBloc(FetchWeather())..add(InitialWeatherEvent()),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Form(
                key: _searchKey,
                child: TextFormField(
                  onChanged: (value) {
                    city = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a city name';
                    }
                    return null;
                  },
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: 'Search City',
                  ),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      if (_searchKey.currentState!.validate()) {
                        print(city);

                        context
                            .read<WeatherBloc>()
                            .add(FetchWeatherEvent("$city"));
                        cityController.clear();
                      }
                    },
                    icon: Icon(Icons.search))
              ],
            ),
            body: Center(
              child: SingleChildScrollView(
                child: state is InitialState
                    ? Container(
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                'images/logo1.png',
                              ),
                            ),
                            Text('Weather Search Application'),
                            Text('Obtain real-time weather data of any city.')
                          ],
                        ),
                      )
                    : state is LoadingState
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : state is LoadedState
                            ? WeatherInfo(weatherInfo: state.weatherData)
                            : (state is WeatherNotLoadedState)
                                ? const Text("Error loading data")
                                : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
