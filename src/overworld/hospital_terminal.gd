@tool
class_name HospitalTerminal
extends MapSign
## Terminal: el gráfico está en el tileset y la interacción abre el PC real.
func interact(_player: Player) -> void:
 await Cutscene.play(preload("res://src/events/common/open_pc_event.gd"),self)
