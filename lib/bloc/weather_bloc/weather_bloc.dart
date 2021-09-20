import 'package:bloc/bloc.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/bloc/weather_event/weather_event.dart';
import 'package:weather_app/bloc/weather_state/weather_state.dart';
import 'package:weather_app/model/weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  FetchWeather fetchWeather;
  WeatherBloc(this.fetchWeather) : super(WeatherNotLoadedState());

  @override
  WeatherState get InitialWeatherState => WeatherNotLoadedState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeatherEvent) {
      yield LoadingState();

      Weather? weather = await fetchWeather.getWeather(event.city);
      yield LoadedState(weather);
    } else if (event is InitialWeatherEvent) {
      yield InitialState();
    
    }
  }
}

