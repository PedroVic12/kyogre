//import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/sheets/v4.dart' as sheets;

class DataBaseExcel {
  late final sheets.SheetsApi _api;
  late final String _spreadsheetId;
  final String _sheetName;

  DataBaseExcel(String credentialsPath, this._spreadsheetId, this._sheetName) {
    final scopes = [sheets.SheetsApi.spreadsheetsScope];
    //auth.clientViaServiceAccountFromFile(credentialsPath, scopes).then((client) {
    //_api = sheets.SheetsApi(client);
    //});
  }

  Future<void> salvarProduto(
      String nome, String descricao, double preco, int quantidade) async {
    if (_api == null) {
      throw Exception('API não inicializada');
    }

    final values = [
      [nome, descricao, preco.toString(), quantidade.toString()],
    ];

    final range = '$_sheetName!A1:D1';
    final request = sheets.ValueRange.fromJson({
      'range': range,
      'values': values,
    });
    await _api.spreadsheets.values.append(request, _spreadsheetId, range,
        valueInputOption: 'USER_ENTERED');
  }
}
