import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: DockerScreen(),
  ));
}

class DockerScreen extends StatefulWidget {
  @override
  _DockerScreenState createState() => _DockerScreenState();
}

class _DockerScreenState extends State<DockerScreen> {
  List<List<String>> _tableData = [];

  @override
  void initState() {
    super.initState();
    fetchDockerOutput();
  }

  Future<void> fetchDockerOutput() async {
    try {
      // Start the process
      var process = await Process.start('docker', ['ps']);
      
      await process.stdin.close();

      // Capture output
      String output = await process.stdout.transform(SystemEncoding().decoder).join();
List<String> lines = output.split('\n');
      // Parse the output into a table format
     List<String> nonEmptyLines = lines.where((line) => line.trim().isNotEmpty).toList();

if (nonEmptyLines.isNotEmpty) {
  List<List<String>> tableData = nonEmptyLines.map((line) {
    return line.split(RegExp(r'\s{2,}')); // Split by 2 or more spaces
  }).toList();

        setState(() {
          _tableData = tableData;
        });
      }
    } catch (e) {
      setState(() {
        _tableData = [
          ["Error fetching Docker details: $e"]
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Docker Containers"),
      ),
      body: _tableData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: _tableData.isNotEmpty
                    ? _tableData.first
                        .map((header) => DataColumn(label: Text(header, style: TextStyle(fontWeight: FontWeight.bold))))
                        .toList()
                    : [],
                rows: _tableData.length > 1
                    ? _tableData
                        .skip(1)
                        .where((row) => row != "") 
                        .map((row) => DataRow(
                              cells: row.map((cell) => DataCell(Text(cell))).toList(),
                            ))
                        .toList()
                    : [],
              ),
            ),
    );
  }
}

