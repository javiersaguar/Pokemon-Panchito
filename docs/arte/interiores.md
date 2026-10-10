# Interiores de servicios · 2026-10-10

Javier autoriza interiores de Mercadona y estancos, y hospitales en las ocho ciudades con gimnasio, en sustitución del Centro Pokémon. Primer conjunto: Málaga. Hospital: curación, PC y punto de regreso tras derrota; Mercadona: catálogo progresivo existente; estanco: objetos X con precios de DataDB. Lotería, sellos y entrenamiento de Basic-Fit siguen pendientes; no se añaden reglas propias.

## Recurso y reproducción

[Akizakura16, 4th gen Indoor Tileset](https://www.deviantart.com/akizakura16/art/4th-gen-Indoor-Tileset-624832808), [publicado por la autora](https://eeveeexpo.com/resources/15/). La autora pide crédito y explica que las imágenes se guardan directamente. PNG original 256×17056; recortes en `assets/tilesets/interior/origen.json`, con SHA-256. Tamaño nativo 32 px, sin reescalado ni dibujo procedural. Solo se copian los cuatro fragmentos usados.

```sh
godot --headless --path . -s assets/tilesets/interior/build_interiores.gd -- /ruta/akizakura16.png
godot --headless --editor --path . --import
godot --headless --path . -s maps/_pintura/pintar_locales.gd
```

Mapas 16×12, cámara fija a 512×384, sin bicicleta, carrera, seguidores ni encuentros. Paredes/muebles sólidos; mostradores marcados `counter` para interactuar con el dependiente desde dos casillas. Salida en (8,11), llegada (8,10); recuperación (8,5). Las llegadas exteriores quedan delante de la puerta, evitando reentrada inmediata. F9 los descubre automáticamente.

Hospital: fachada urbana genérica del pack HGSS, rótulo Hospital; pendiente edificio sanitario propio y aprobación gráfica. No se presenta como réplica de un hospital real elegido por Javier. Los personajes famosos ya tienen datos/sprites; ubicaciones y guion no se inventan.
