import 'dart:convert';
import 'dart:io';

import 'package:com_app_tienda/Enrollment/model/enrollment_entity.dart';
import 'package:com_app_tienda/Enrollment/resources/EnrollmentRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

class Afiliacion extends StatefulWidget {
  @override
  _AfiliacionState createState() => _AfiliacionState();
}

class _AfiliacionState extends State<Afiliacion> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  String _fileName2;
  String _fileName3;
  String _fileName4;
  String _fileName5;
  List<PlatformFile> _paths;
  List<PlatformFile> _paths2;
  List<PlatformFile> _paths3;
  List<PlatformFile> _paths4;
  List<PlatformFile> _paths5;
  String _directoryPath;
  String _directoryPath2;
  String _directoryPath3;
  String _directoryPath4;
  String _directoryPath5;
  //String _extension;
  bool _loadingPath = false;
  bool _loadingPath2 = false;
  bool _loadingPath3 = false;
  bool _loadingPath4 = false;
  bool _loadingPath5 = false;
  TextEditingController _controller = TextEditingController();
  bool sendingRequest = false;
  EnrollmentRepository enrollmentRepository = new EnrollmentRepository();
  @override
  void initState() {
    super.initState();
    //  _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorerRB() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['JPG', 'PDF', 'PNG'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }

  void _openFileExplorerRA() async {
    setState(() => _loadingPath2 = true);
    try {
      _directoryPath2 = null;
      _paths2 = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['JPG', 'PDF', 'PNG'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath2 = false;
      _fileName2 =
          _paths2 != null ? _paths2.map((e) => e.name).toString() : '...';
    });
  }

  void _openFileExplorerRL() async {
    setState(() => _loadingPath3 = true);
    try {
      _directoryPath3 = null;
      _paths3 = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['JPG', 'PDF', 'PNG'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath3 = false;
      _fileName3 =
          _paths3 != null ? _paths3.map((e) => e.name).toString() : '...';
    });
  }

  void _openFileExplorerRT() async {
    setState(() => _loadingPath4 = true);
    try {
      _directoryPath4 = null;
      _paths4 = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['JPG', 'PDF', 'PNG'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath4 = false;
      _fileName4 =
          _paths4 != null ? _paths4.map((e) => e.name).toString() : '...';
    });
  }

  void _openFileExplorerPag() async {
    setState(() => _loadingPath5 = true);
    try {
      _directoryPath5 = null;
      _paths5 = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['JPG', 'PDF', 'PNG'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath5 = false;
      _fileName5 =
          _paths5 != null ? _paths5.map((e) => e.name).toString() : '...';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_backspace, color: Color(0xFFFFFFFF)),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Color(0xFFFF9800),
        title: const Text('Afiliación'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            sendingRequest
                ? Container(
                    height: 8,
                    child: LinearProgressIndicator(),
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [BoxShadow(offset: Offset(0, 3), blurRadius: 10)],
              ),
              child: ListView(
                shrinkWrap: true,
                primary: false,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.check),
                    title: Text(
                      'Referencia bancaria',
                    ),
                  ),
                  ListTile(
                    onTap: () => _openFileExplorerRB(),
                    title: Text(
                      'Seleccione un archivo...',
                    ),
                    trailing: Icon(Icons.file_upload),
                  ),
                  Builder(
                    builder: (BuildContext context) => _loadingPath
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: const CircularProgressIndicator(),
                          )
                        : _directoryPath != null
                            ? ListTile(
                                title: Text('Directory path'),
                                subtitle: Text(_directoryPath),
                              )
                            : _paths != null
                                ? Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                    child: Scrollbar(
                                        child: Center(
                                      child: ListView.separated(
                                        itemCount: 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final bool isMultiPath =
                                              _paths != null &&
                                                  _paths.isNotEmpty;
                                          final String name = (isMultiPath
                                              ? _paths
                                                  .map((e) => e.name)
                                                  .toList()[index]
                                              : _fileName ?? '...');
                                          final path = _paths
                                              .map((e) => e.path)
                                              .toList()[index]
                                              .toString();

                                          return ListTile(
                                            title: Text(
                                              name,
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const Divider(),
                                      ),
                                    )),
                                  )
                                : const SizedBox(),
                  ),
                  Divider(
                    color: Color(0xFFFF9800),
                  ),
                  ListTile(
                    leading: Icon(Icons.check),
                    title: Text(
                      'Recibo de Agua.',
                    ),
                  ),
                  ListTile(
                    onTap: () => _openFileExplorerRA(),
                    title: Text(
                      'Seleccione un archivo...',
                    ),
                    trailing: Icon(Icons.file_upload),
                  ),
                  Builder(
                    builder: (BuildContext context) => _loadingPath2
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: const CircularProgressIndicator(),
                          )
                        : _directoryPath2 != null
                            ? ListTile(
                                title: Text('Directory path'),
                                subtitle: Text(_directoryPath2),
                              )
                            : _paths2 != null
                                ? Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                    child: Scrollbar(
                                        child: Center(
                                      child: ListView.separated(
                                        itemCount: 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final bool isMultiPath2 =
                                              _paths2 != null &&
                                                  _paths2.isNotEmpty;
                                          final String name2 = (isMultiPath2
                                              ? _paths2
                                                  .map((e) => e.name)
                                                  .toList()[index]
                                              : _fileName2 ?? '...');
                                          final path = _paths2
                                              .map((e) => e.path)
                                              .toList()[index]
                                              .toString();

                                          return ListTile(
                                            title: Text(
                                              name2,
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const Divider(),
                                      ),
                                    )),
                                  )
                                : const SizedBox(),
                  ),
                  Divider(
                    color: Color(0xFFFF9800),
                  ),
                  ListTile(
                    leading: Icon(Icons.check),
                    title: Text(
                      'Recibo de Luz.',
                    ),
                  ),
                  ListTile(
                    onTap: () => _openFileExplorerRL(),
                    title: Text(
                      'Seleccione un archivo...',
                    ),
                    trailing: Icon(Icons.file_upload),
                  ),
                  Builder(
                    builder: (BuildContext context) => _loadingPath3
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: const CircularProgressIndicator(),
                          )
                        : _directoryPath3 != null
                            ? ListTile(
                                title: Text('Directory path'),
                                subtitle: Text(_directoryPath3),
                              )
                            : _paths3 != null
                                ? Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                    child: Scrollbar(
                                        child: Center(
                                      child: ListView.separated(
                                        itemCount: 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final bool isMultiPath3 =
                                              _paths3 != null &&
                                                  _paths3.isNotEmpty;
                                          final String name3 = (isMultiPath3
                                              ? _paths3
                                                  .map((e) => e.name)
                                                  .toList()[index]
                                              : _fileName3 ?? '...');
                                          final path = _paths3
                                              .map((e) => e.path)
                                              .toList()[index]
                                              .toString();

                                          return ListTile(
                                            title: Text(
                                              name3,
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const Divider(),
                                      ),
                                    )),
                                  )
                                : const SizedBox(),
                  ),
                  Divider(
                    color: Color(0xFFFF9800),
                  ),
                  ListTile(
                    leading: Icon(Icons.check),
                    title: Text(
                      'Recibo de Telefono.',
                    ),
                  ),
                  ListTile(
                    onTap: () => _openFileExplorerRT(),
                    title: Text(
                      'Seleccione un archivo...',
                    ),
                    trailing: Icon(Icons.file_upload),
                  ),
                  Builder(
                    builder: (BuildContext context) => _loadingPath4
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: const CircularProgressIndicator(),
                          )
                        : _directoryPath4 != null
                            ? ListTile(
                                title: Text('Directory path'),
                                subtitle: Text(_directoryPath4),
                              )
                            : _paths4 != null
                                ? Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                    child: Scrollbar(
                                        child: Center(
                                      child: ListView.separated(
                                        itemCount: 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final bool isMultiPath4 =
                                              _paths4 != null &&
                                                  _paths4.isNotEmpty;
                                          final String name4 = (isMultiPath4
                                              ? _paths4
                                                  .map((e) => e.name)
                                                  .toList()[index]
                                              : _fileName4 ?? '...');
                                          final path = _paths4
                                              .map((e) => e.path)
                                              .toList()[index]
                                              .toString();

                                          return ListTile(
                                            title: Text(
                                              name4,
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const Divider(),
                                      ),
                                    )),
                                  )
                                : const SizedBox(),
                  ),
                  Divider(
                    color: Color(0xFFFF9800),
                  ),
                  ListTile(
                    leading: Icon(Icons.check),
                    title: Text(
                      'Pagare',
                    ),
                  ),
                  ListTile(
                    onTap: () => _openFileExplorerPag(),
                    title: Text(
                      'Seleccione un archivo...',
                    ),
                    trailing: Icon(Icons.file_upload),
                  ),
                  Builder(
                    builder: (BuildContext context) => _loadingPath5
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: const CircularProgressIndicator(),
                          )
                        : _directoryPath5 != null
                            ? ListTile(
                                title: Text('Directory path'),
                                subtitle: Text(_directoryPath5),
                              )
                            : _paths5 != null
                                ? Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                    child: Scrollbar(
                                        child: Center(
                                      child: ListView.separated(
                                        itemCount: 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final bool isMultiPath5 =
                                              _paths5 != null &&
                                                  _paths5.isNotEmpty;
                                          final String name5 = (isMultiPath5
                                              ? _paths5
                                                  .map((e) => e.name)
                                                  .toList()[index]
                                              : _fileName5 ?? '...');
                                          final path = _paths5
                                              .map((e) => e.path)
                                              .toList()[index]
                                              .toString();

                                          return ListTile(
                                            title: Text(
                                              name5,
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const Divider(),
                                      ),
                                    )),
                                  )
                                : const SizedBox(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 4.0,
                      onPressed: sendEnrollmentRequest,
                      padding: EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Color(0xFFFF9800),
                      child: Text(
                        'Subir Documentos',
                        style: TextStyle(
                          color: Color(0xFF527DAA),
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendEnrollmentRequest() async {
    // Reading bank reference
    if (_paths == null) {
      showAlert('Ingrese la referencia bancaria');
      return;
    }
    File bankReferenceFile = new File(_paths[0]?.path);
    List<int> imageBytes = await bankReferenceFile.readAsBytes();
    String bankReferenceEncoded = base64Encode(imageBytes);

    // Reading water bill
    if (_paths2 == null) {
      showAlert('Ingrese el recibo de agua');
      return;
    }
    File waterBillFile = new File(_paths2[0]?.path);
    List<int> waterBillBytes = await waterBillFile.readAsBytes();
    String waterBillEncoded = base64Encode(waterBillBytes);

    // Reading energy bill
    if (_paths3 == null) {
      showAlert('Ingrese el recibo de energia');
      return;
    }
    File energyBillFile = new File(_paths3[0]?.path);
    List<int> energyBillBytes = await energyBillFile.readAsBytes();
    String energyBillEncoded = base64Encode(energyBillBytes);

    // Reading phone
    if (_paths4 == null) {
      showAlert('Ingrese el recibo de agua');
      return;
    }
    File phoneBillFile = new File(_paths4[0]?.path);
    List<int> phoneBillBytes = await phoneBillFile.readAsBytes();
    String phoneBillEncoded = base64Encode(phoneBillBytes);

    // Reading pagare
    if (_paths5 == null) {
      showAlert('Ingrese el recibo de agua');
      return;
    }
    File pagareFile = new File(_paths5[0]?.path);
    List<int> pagareBytes = await pagareFile.readAsBytes();
    String pagareBillEncoded = base64Encode(pagareBytes);

    EnrollmentEntity enrollmentEntity = new EnrollmentEntity();
    enrollmentEntity = enrollmentEntity.rebuild((b) => b
      ..bankReferenceUrl = bankReferenceEncoded
      ..waterBillUrl = waterBillEncoded
      ..phoneBillUrl = phoneBillEncoded
      ..energyBillUrl = energyBillEncoded
      ..pagareUrl = pagareBillEncoded);

    try {
      final result =
          await enrollmentRepository.createEnrollmentRequest(enrollmentEntity);
      showAlert('Se envió la solicitud de afiliación', title: 'Exito');
    } catch (e) {
      showAlert(e.toString());
    }
  }

  showAlert(String message, {String title}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title != null ? '$title' : 'Error'),
            content: Text('$message'),
            actions: [
              RaisedButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.red,
              ),
            ],
          );
        });
  }
}
