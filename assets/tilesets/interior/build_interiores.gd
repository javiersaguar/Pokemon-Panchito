extends SceneTree
## Importa recortes del tileset público de Akizakura16; nunca dibuja arte.
## El PNG original se conserva fuera del repo. Créditos y coordenadas: interiores.md.
const BASE := "res://assets/tilesets/interior/"
func _initialize() -> void:
 await process_frame
 var input := OS.get_cmdline_user_args()
 if input.size() != 1:
  push_error("Indica la ruta del PNG original de Akizakura16.")
  quit(1)
  return
 var original := Image.load_from_file(input[0])
 var regions := {"suelos": Rect2i(0,0,256,2048), "paredes": Rect2i(0,4448,256,2560), "muebles": Rect2i(0,14336,256,2048), "mostradores": Rect2i(0,12288,256,1152)}
 var tiles := TileSet.new()
 tiles.tile_size = Vector2i(32,32)
 tiles.add_physics_layer()
 tiles.set_physics_layer_collision_layer(0,1)
 tiles.add_custom_data_layer()
 tiles.set_custom_data_layer_name(0,"terrain")
 tiles.set_custom_data_layer_type(0,TYPE_STRING)
 tiles.add_custom_data_layer()
 tiles.set_custom_data_layer_name(1,"walkable")
 tiles.set_custom_data_layer_type(1,TYPE_BOOL)
 var source_id := 0
 for name: String in regions:
  var image := original.get_region(regions[name])
  image.save_png(BASE+name+".png")
  var source := TileSetAtlasSource.new()
  source.texture = ImageTexture.create_from_image(image)
  source.texture.resource_path = BASE+name+".png"
  source.texture_region_size = Vector2i(32,32)
  tiles.add_source(source,source_id)
  var cells := image.get_size()/32
  for y: int in cells.y:
   for x: int in cells.x:
    source.create_tile(Vector2i(x,y))
    var tile := source.get_tile_data(Vector2i(x,y),0)
    var solid := source_id != 0
    tile.set_custom_data("terrain","wall" if solid else "indoor")
    tile.set_custom_data("walkable",not solid)
    if solid:
     tile.set_collision_polygons_count(0,1)
     tile.set_collision_polygon_points(0,0,PackedVector2Array([Vector2(-16,-16),Vector2(16,-16),Vector2(16,16),Vector2(-16,16)]))
  source_id += 1
 # El mostrador permite hablar desde el lado del cliente.
 var counters := tiles.get_source(3) as TileSetAtlasSource
 for y: int in 36:
  for x: int in 8:
   counters.get_tile_data(Vector2i(x,y),0).set_custom_data("terrain","counter")
 ResourceSaver.save(tiles,BASE+"interior.tres")
 quit()
