//verificar dependencias no pubspec.yalm
//olhar as depencias que foram adicionadas da linha 38 ate a linha 42

class Car {
  final String chassi;
  final String name;
  final String year;

  Car({required this.chassi, required this.name, required this.year});

  //cria uma instância da classe Car a partir de um mapa JSON.
  // É útil para converter dados recebidos em formato JSON (como em respostas de APIs) para objetos da classe
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      chassi: json['chassi'],
      name: json['name'],
      year: json['year'],
    );
  }

  //converte uma instância da classe Car para um mapa JSON,
  //permitindo que o objeto seja serializado para envio, como em uma requisição a uma API.
  Map<String, dynamic> toJson() {
    return {
      'chassi': chassi,
      'name': name,
      'year': year,
    };
  }
}
