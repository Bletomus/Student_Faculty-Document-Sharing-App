import 'package:flutter_test/flutter_test.dart';
import 'package:repository/ExistenceRepository.dart';

import 'package:repository/repository.dart';

void main() {
  test('test repo response', ()
  async {
    ExistenceRepository existenceRepository = ExistenceRepository(1);
    expect(await existenceRepository.fetchisAvaible('1712510101'), true);
    //expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
