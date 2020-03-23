# Mini proyecto con ROM (Ruby Object Mapper)

A partir de https://medium.com/igkuz/how-to-setup-ruby-object-mapper-rom-for-standalone-project-15472fcf31e1

## Migrations para crear una nueva tabla

Tomamos como ejemplo la creación de la tabla **Company**.
Se corre ``bundle exec rake db:create_migration[<nombre_migration>]`` para que se genere
un nuevo archivo en ``db/migrate``. 

Se crea automáticamente con el timestamp y 
se debe escribir en ese archivo lo correspondiente a la estructura de la tabla

Para que impacte la migration, se corre luego ``bundle exec rake db:migrate``

## Migrations para crear relaciones entre tablas

Parecido a la creación de commands, se crea una nueva clase en ``lib/relations`` para cada
tabla involucrada en la relación. Las mismas heredan de ``ROM::Relation[:sql]``. 
En este caso, **Company** y **Posts** tienen una relación **1 a n.**

Se debe registrar esta relación en la configuración del **MAIN_CONTAINER** que se define en 
application.rb => ``configuration.register_relation(Companies, Posts)``

## Commands para hacer ABM de alguna entidad

Se deben generar nuevos clases en ``lib/commands`` para afectar cada entidad. Éstas extienden
de ``ROM::Commands::<Tipo_Comando>``, donde se declara qué relation impacta (entre otras cosas).

Luego, hay que volver a registrarlas en el **MAIN_CONTAINER**, así como las relations:
``configuration.register_command(CreateCompany, DeleteCompany)``

Para utilizar estas clases que hacen de repository:

``companies_repository = MAIN_CONTAINER.relations[:companies]``
``companies_repository.command(:create).call(atributo_1: valor, atributo_2: valor, ..)``

## Testing

Se utiliza una nueva gema: **ROM-Factory** con la idea de tener distintas factories 
para generar instancias de cada entidad (factories.rb). 

El ejemplo de test queda en ``company_spec.rb``

