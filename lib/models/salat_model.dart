class SalatModel {
  int? _fazr;
  int? _duhr;
  int? _asr;
  int? _magrib;
  int? _esha;

  int get fazr => _fazr!;

  set fazr(int value) {
    _fazr = value;
  }

  int get duhr => _duhr!;

  set duhr(int value) {
    _duhr = value;
  }

  int get asr => _asr!;

  set asr(int value) {
    _asr = value;
  }

  int get magrib => _magrib!;

  set magrib(int value) {
    _magrib = value;
  }

  int get esha => _esha!;

  set esha(int value) {
    _esha = value;
  }
}
