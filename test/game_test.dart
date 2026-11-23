import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_skor_tahtasi/oyun_skor_tahtasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(skorTahtasiConfig.title.length, 33);
    expect(skorTahtasiConfig.tagline.length, 33);
    for (final s in skorTahtasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(skorTahtasiConfig.gameId, skorTahtasiId);
    expect(skorTahtasiRules.gameId, skorTahtasiId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(skorTahtasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: skorTahtasiId, optionalMechanics: skorTahtasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(skorTahtasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
