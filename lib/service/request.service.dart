
import 'package:dio/dio.dart';
import 'package:gs_comentado/domain/car.dart';

class RequestService {
  //instanciando o DIO para fzr requisicoes HTTP
  final dio = Dio();
  //URL base das requisições HTTP
  final host = "https://gdapp.com.br/api";

  //Realiza uma requisição GET e retorna uma lista de objetos Car.
  Future<List<Car>> readCarsService() async {
    try {
      final response = await dio.get('$host/cars'); // realiza o GET na rota CARS
      return (response.data as List) //dados retornados são convertidos de JSOn para uma lista de Objetos
          .map((json) => Car.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  //realiza uma requisição POST para adicionar um novo carro
  Future<bool> createCarService(Car car) async {
    final data = {'car': car.toJson()}; //Converte o objeto Car para JSON usando o método toJson

    try {
      final response = await dio.post(
        '$host/car',
        data: data,//Realiza um POST para a rota /car enviando os dados do carro.
      );
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
      return true; //Retorna true se a requisição foi bem-sucedida.
    } catch (e) {
      print('Error: $e'); //Imprime o erro no console e retorna false caso ocorra alguma falha.
      return false;
    }
  }
}
