import 'custom_event_bus.dart';

class EventBusService {
  factory EventBusService() => _instance;

  EventBusService._private();

  static final EventBusService _instance = EventBusService._private();

  final CustomEventBus _eventBus = CustomEventBus();

  CustomEventBus get eventBus => _eventBus;

  void dispose() {
    _eventBus.destroy();
  }
}

// EVENT NAMES
class UpdateHomeData {}

class ProfileUpdatedEvent {}

class FavoriteUpdatedEvent {
  final int clubId;
  final bool isFavorite;

  FavoriteUpdatedEvent({required this.clubId, required this.isFavorite});
}