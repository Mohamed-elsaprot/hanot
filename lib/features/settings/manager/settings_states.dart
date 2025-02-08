abstract class SettingsStates{}

class SettingsInitial extends SettingsStates{}
class SettingsLoading extends SettingsStates{}
class SettingsSuccess extends SettingsStates{}
class SettingsFailure extends SettingsStates{
  final String errorMessage;
  SettingsFailure({required this.errorMessage});
}