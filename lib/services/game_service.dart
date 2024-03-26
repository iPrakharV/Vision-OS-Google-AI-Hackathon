import '../models/game_state.dart';
import '../api/gemini_api.dart';

class GameService {
  final GeminiApi _api = GeminiApi();

  Future<GameState> fetchGameState() async {
    final data = await _api.getGameUpdates();
    return GameState.fromJson(data);
  }

  // Additional game logic and service methods...
}
