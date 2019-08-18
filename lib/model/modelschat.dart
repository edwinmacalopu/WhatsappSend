 class Manager{
  int id;
  String nombre;
  String numero;
  String fecha;
  Manager({this.id,this.nombre,this.numero,this.fecha});

  Map<String,dynamic> topMap()=>{
    "id":id,
      "nombre":nombre,
      "numero":numero,
      "fecha":fecha,

  };

  factory Manager.fromMap(Map<String,dynamic>json)=>new Manager(
    id: json["id"],
    nombre: json["nombre"],
    numero: json["numero"],
    fecha: json["fecha"],
  );

}