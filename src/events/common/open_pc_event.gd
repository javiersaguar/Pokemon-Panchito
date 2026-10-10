extends StoryEvent
## Terminal de PC de los hospitales. Usa el almacenamiento normal de la partida.
func run() -> void:
 var screen := GlobalClasses.find(&"PCScreen")
 if screen != null and GlobalClasses.has_function(screen, &"open"):
  await screen.call(&"open")
