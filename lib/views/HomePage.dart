import 'package:conversorcripto/services/via_cripto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _searchCriptoController = TextEditingController();
  bool _loading = false;
  bool _enableField = true;
  String? _result;
  List<String> cripto = ["BTC", "LTC", "ADA", "UNI", "USDC"];
  String? _selectedCripto;

  @override
  void dispose() {
    super.dispose();
    _searchCriptoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
                height: 20
            ),
            Container(
              width: 150,
              height: 200,
              child: Image(
                image: AssetImage('assets/imagens/cripto.jpg'),
              ),
            ),
            Text(
              'Conversão  de: ',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.yellow),
            ),
            SizedBox(
                height: 10
            ),
          _buildSearchCriptoTextField(),
            SizedBox(
                height: 10
            ),
            Text(
              'Para: ',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.yellow),
            ),
            DropdownButton<String>(
              onChanged: (value) {
                setState(() {
                  _selectedCripto = value;
                });
              },
              value: _selectedCripto,

              underline: Container(),
              hint: Center(
                  child: Text(
                    'Selecione a Cripto',
                    style: TextStyle(color: Colors.yellow
                    ),
                  )),
              icon: Icon(
                Icons.arrow_downward,
                color: Colors.yellow,
              ),
              isExpanded: true,

              // The list of options
              items: cripto
                  .map((e) => DropdownMenuItem(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    e,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                value: e,
              ))
                  .toList(),
              selectedItemBuilder: (BuildContext context) => cripto
                  .map((e) => Center(
                child: Text(
                  e,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.amber,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ))
                  .toList(),
            ),
           _buildResultForm(),
          _buildSearchCriptoButton(),
          ],
        ),
      ),
    );
  }
  Widget _buildSearchCriptoTextField() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      controller: _searchCriptoController,
      enabled: _enableField,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.money, color: Colors.yellow,),
        suffixText: "RS",
        suffixStyle: const TextStyle(color: Colors.yellow),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      style: TextStyle(
        color: Colors.yellow,
      ),
    );
  }

  Widget _buildSearchCriptoButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        onPressed: _searchCep,
        child: _loading ? _circularLoading() : Text('Consultar'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
        color: Colors.yellow,
      ),
    );
  }

  void _searching(bool enable) {
    setState(() {
      _result = enable ? '' : _result;
      _loading = enable;
      _enableField = !enable;
    });
  }

  Widget _circularLoading() {
    return Container(
      height: 15.0,
      width: 15.0,
      child: CircularProgressIndicator(),
    );
  }

  Future _searchCep() async {
    _searching(true);

      final criptoValor = _searchCriptoController.text;
      final cripto= _selectedCripto;
      final resultCripto = await ViaCriptoService.fetchCripto(cripto : cripto);

      setState(() {
        _result =
      });

      _searching(false);
  }

  Widget _buildResultForm() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(_result ?? '',textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.yellow),),
    );
  }
}

