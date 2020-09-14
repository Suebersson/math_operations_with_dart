
import 'dart:io';
import 'dart:math';

// ignore: omit_local_variable_types
const Set<String> operationList = {'adicao', 'subtracao', 'multiplicacao', 'divisao', 'aleatorio'};
const Set<String> finalizeOperations = {'sair', 'cancelar', 'terminar', 'finalizar', 'encerrar', 'exit', 'finish'};
String operationType;
String maxValue;

void main(){

  print(
    '\n\n'
    '############################################################################################################'
    '\n*'
    '\n*'
    '\n* --- Exercício de operações matemáticas ---'
    '\n*'
    '\n* Tipo de operações: $operationList'
    '\n* Comandos para finalizar o exercício: $finalizeOperations'
    '\n*'
    '\n*'
    '\n############################################################################################################'
    '\n\n'
  );

  while(!operationList.contains(operationType)){
    if(operationList.contains(operationType)){
      return;
    }else{
      stdout.write('Digite o tipo de operação: ');
      operationType = stdin.readLineSync();
      if(operationList.contains(operationType)){
        while(maxValue == null){
          if(finalizeOperations.contains(maxValue)){
            return;
          }else{
            stdout.write('Digite o valor máximo dos operadores: ');
            maxValue = stdin.readLineSync();
            try{
              operate(int.parse(maxValue)+1);
            }catch(e){
              try{
                operate(double.parse(maxValue)+1);
              }catch(e){
                print('Insira um valor númerico!!!');
                maxValue = null;
              }
            }
          }
        }
      }else{
        print(
          'Tipo de operação não definida'
          '\nDigite uma das opções: adicao, subtracao, multiplicacao, divisao'
        );
      }
    }
  }
}

void operate(num _maxValue){
  num x, y;
  Map<String, num> value;
  String type;
  String resp;

  while(resp == null){
    x = Random().nextInt(_maxValue);
    y = Random().nextInt(_maxValue);

    type = operationType != 'aleatorio'
      ? operationType
      : operationList.elementAt(Random().nextInt(operationList.length-1));

    value = calculate(type, x, y);

    stdout.write('Quanto é $x ${value.keys.elementAt(0)} $y ? ');
    resp = stdin.readLineSync();

    if(finalizeOperations.contains(resp)) {
      print('\nOperações encerradas');
      return;
    }else{
      try{
        result(int.parse(resp), value.values.elementAt(0));
        resp = null;
      }catch(e){
        try{
          result(double.parse(resp), value.values.elementAt(0));
          resp = null;
        }catch(e){
          print(
            '\nErro: digite apenas valores númericos!!!'
            '\n\nSe o valor da resposta for uma fração, use o ponto'
            '\nEx: 5.7\n'
          );
          resp = null;
        }
      }
    }
  }
}

Map<String, num> calculate(String type, num x, num y){
  switch (type) {
    case 'adicao':
      return {'+': x + y};
    case 'subtracao':
      return {'-': x - y};
    case 'multiplicacao':
      return {'*': x * y};
    case 'divisao':
      return {'/': x / y};
  }
  return null;
}

void result(num resp, num value){
  if(resp == value){
    print('Parabéns, resposta correta.\n');
  }else{
    print('Resposta incorreta!!!\n');
  }
}

