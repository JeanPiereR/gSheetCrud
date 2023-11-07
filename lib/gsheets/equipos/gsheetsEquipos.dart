import 'package:api_proyect/gsheets/equipos/equipos.dart';
import 'package:gsheets/gsheets.dart';


class UserSheetsApi {
  ///static String _sheetId= "1nKt6XoCMpA57Q8zNaTUQWWO-ZKwREKWXvgaMV8nuXfU";
  static const _credentials= r'''
  {
  "type": "service_account",
  "project_id": "ribi-htpp",
  "private_key_id": "16e3fcaee5867a44901e8814aa006e588dc10b68",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCETC0bHzs3+pUK\nDUHFaIWKjU3oyFcPIhsozD03v81TC0/UzWWvAfQj3crw4fvi7YNjDlpZjCoJYX1l\nfMu2KvWTKpjCgpuaCcdqr94iDuRWdpbKZwdVK+qlgjtQfdSoLrALA1Mcn+Wy5ohU\nVNpIWokmDk+ZEGsb1k81JmcH8g2lUqUsywJ4ykL1YVl9bvaS3QQ9uXbgja3GNlgL\ngsXsTADYJu/rvTHcEKAFBvO/se/FPoC7rc4X3METgaNd9z03IMbUx5u979qgw8wT\nfQN65115Z+OuDfXnw0NAFmG7ncH16hS1FdZTsjhVbZ03QxsKDa60WuvV50iv/wMH\nrM5VG+SpAgMBAAECggEAB6YT0YabuN/O8BbWH6CsX9dNktDKX8CcC17Lh0aai1uT\nEP2TDGwzfkNbcVPPaU5ME1UIGjdFUueFBXISoQSY0BpdXJmKf3xjQCLM1/E+eFVA\n4JDWVrFETq9Z2Ix91/9jBC/8BSKleBNl/GIvgJFjboTTS0ksuB5K1ArVWBtBeLZa\nOHzfmOQX2SxSRbqqJtKsbaovSH+A2kgj31Se0hdjDpGEK+VAtCKQnK6WulAqJn0z\npxhvU6/SY5Dz2kwqbgoix5y23m3BmzhVslrUGTVH/l4l32vUkdzB8+4LUhx7mhcW\nsJDJ93WKim+fF+9DBZ7A2UbhfeRY+te+OfCtjWfGRQKBgQC5qYWmDJxI3msegY0E\nskWA1vS7WIwP+/R34+Uh5eRehtLM4XmgdwJskzC+oki1mLWFJySiTHBayv4Trt9i\nvyxtvJKBPOwKc5xb93OAHeZGw830nhU6WSy/bnF9zvPXn45bJ75WNVvXBSEPI8dQ\nEg1fpl8le/JVYVgsZHxvGf8ElwKBgQC2axOg0DH7Fc1Bq1m+bZwXNWfEmzV7WNFf\nAhWfybfj25frz/6/T+PJsLmq9ABndxoZwuD5yf6aWVB0XwdRke2r4KLuGtDeGJ5b\nL4cVgHMfhDPUEN64mtzLQVPdOaHlB1ROwb03RItZrjO5JPVpNizejvs/+2DKjaPc\nZtxbTntIvwKBgGYAswLFjt+iAywhdP6Niw38Cz0aqujlPizYMjzrdwpP/GS/w/jb\nKaPJQlCaDGRo3+Gl3cSlRl07hVf/DY/NBHXN0pfahrw/RDpquzQ6ORfL381zRKpn\n7+PEo+nA18sxSB7guPvYGPsLQFx3BbwCDwLr/v4zGLK75puNIahQmgFFAoGARva6\nyQmVF/9wPQbCv9D2MxUkjBhxIs33jUVLUkDv16V6oVLl4Fjc3X5xjC6l5ZowvirQ\nyHurHzJ1mP/K4hGp6v5Vg9lMvcnH+OMxYsz4fB865lm1uw0Lrcp5LIuaDnXed1Dp\nIhH5P+cD2helnMtlgyMOXOKW0dVuFHSzbpXGYhMCgYEAsH5DHgT7z0BhbhRLfp/6\nXY330qSOAX6NjkscTOHUE9XMSY8cjQopkvbVKs4j9WciIyKmq40u+f+cLbH2EFNM\njLxTyQGLndMSaTo3NWCN/UO9Y7tE29BK/0pf19a1bXUFvrfaHXmrun97LLPoEJox\n4agzYPX4u9JFVEUsZlA5IVk=\n-----END PRIVATE KEY-----\n",
  "client_email": "ribi-services@ribi-htpp.iam.gserviceaccount.com",
  "client_id": "103358982057681566411",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/ribi-services%40ribi-htpp.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
  }
  ''';
  
  static const _spreadSheetId= "1nKt6XoCMpA57Q8zNaTUQWWO-ZKwREKWXvgaMV8nuXfU"; ///const * final
  static final _gSheets = GSheets(_credentials);
  static Worksheet? _userSheet;



  static Future init() async {

    try {
      final spreadsheet = await _gSheets.spreadsheet(_spreadSheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title:"equipos");
      final firstRow = SheetEquipos.getFields();
      _userSheet!.values.insertRow(1, firstRow);

    } catch (e) {
      print (" error: $e");
    }

    
  }



  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
      required String title,
    }) async {
      try{
        return await spreadsheet.addWorksheet(title);
      } catch(e){
        return spreadsheet.worksheetByTitle(title)!;
      }
      
    }

  static Future insert (List<Map<String, dynamic>> rowList) async {
    if( _userSheet == null ) return;

    _userSheet!.values.map.appendRows(rowList);
  }
  

}
