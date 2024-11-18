

import 'package:get/get.dart';
import 'package:gs_comentado/domain/car.dart';
import 'package:gs_comentado/service/request.service.dart';

class CarController extends GetxController {
  //Serviço responsável pelas operações relacionadas a requisições, como leitura e criação de dados.
  final _requestService = RequestService();

  //Um estado reativo que armazena uma lista de objetos Car.
  Rx<List<Car>> cars = Rx([]);

  //Um estado reativo para indicar se há uma operação de carregamento em andamento.
  Rx<bool> loading = Rx(false);

  //Um construtor vazio, já que todas as propriedades são inicializadas diretamente na classe.
  CarController();


  //Atualiza o estado de loading para true enquanto busca a lista de carros.
  // Obtém a lista de carros chamando o método readCarsService do serviço de requisições.
  // Atualiza o estado de cars com os resultados e define loading como false ao finalizar.
  Future<void> fetchCars() async {
    loading.value = true;
    cars.value = await _requestService.readCarsService();
    loading.value = false;
  }

  //Recebe os detalhes de um carro como parâmetros.
  // Cria uma nova instância da classe Car.
  // Envia essa instância para o método createCarService do serviço de requisições.
  // Retorna um bool indicando se a criação foi bem-sucedida.
  Future<bool> createCar({required String chassi,required String name,required String year,}) async {
    final car = Car(chassi: chassi, name: name, year: year);
    return  await _requestService.createCarService(car);
  }
}
