const String tblSalat = 'tbl_salat';
const String tblSalatColId = 'id';
const String tblSalatColDate = 'date';
const String tblSalatColFazr = 'fazr';
const String tblSalatColDuhr = 'duhr';
const String tblSalatColAsr = 'asr';
const String tblSalatColMagrib = 'magrib';
const String tblSalatColEsha = 'esha';

class SalatModel {
  int? id;
  String? date;
  int? fazr;
  int? duhr;
  int? asr;
  int? magrib;
  int? esha;

  // SalatModel();

  SalatModel({
    this.id,
    required this.date,
    this.fazr,
    this.duhr,
    this.asr,
    this.magrib,
    this.esha
  });

  SalatModel.fromString({required SalatModel salat, required String salatName, required int value}){
    salatName == 'Fazr'? this.fazr = value : this.fazr = salat.fazr;
    salatName == 'Duhr'? this.duhr = value: this.duhr = salat.duhr;
    salatName == 'Asr'? this.asr = value: this.asr = salat.asr;
    salatName == 'Magrib'? this.magrib = value: this.magrib = salat.magrib;
    salatName == 'Esha'? this.esha = value: this.esha = salat.esha;
    this.date = salat.date;
  }

  SalatModel.fromMap(Map<String, Object?> map) {
    id = map[tblSalatColId] as int?;
    date = map[tblSalatColDate] as String?;
    fazr = map[tblSalatColFazr] as int?;
    duhr = map[tblSalatColDuhr] as int?;
    asr = map[tblSalatColAsr] as int?;
    magrib = map[tblSalatColMagrib] as int?;
    esha = map[tblSalatColEsha] as int?;

  }

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      tblSalatColDate: date,
      tblSalatColFazr: fazr,
      tblSalatColDuhr: duhr,
      tblSalatColAsr: asr,
      tblSalatColMagrib: magrib,
      tblSalatColEsha: esha,
    };
    if (id != null) {
      map[tblSalatColId] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'SalatModel{id: $id, date: $date, fazr: $fazr, duhr: $duhr, asr: $asr, magrib: $magrib, esha: $esha}';
  }
}
