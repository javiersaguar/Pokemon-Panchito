# Auditoría de locales · 2026-10-10

| Ciudad con gimnasio | Exteriores existentes | Interior de servicios |
|---|---|---|
| Madrid | Moncloa: Centro en (38,29), Mercadona (50,29), estanco (50,39); tiendas adicionales en otros barrios | Tres servicios jugables |
| Barcelona | Eixample: Centro (6,51), Mercadona (3,31), tienda morada (22,19); otras tiendas por barrios | Tres servicios jugables |
| Valencia | Ciutat Vella: Centro (48,24), Mercadona (48,38), estanco (56,24); otro conjunto en Malvarrosa | Tres servicios jugables |
| Sevilla | Centro: Centro grande (5,27), Mercadona (19,20), estanco (52,42) | Tres servicios jugables |
| Las Palmas | Vegueta: Centro (2,20), estanco (9,20); Canteras: Mercadona (30,20) | Tres servicios jugables |
| Bilbao | Sin mapa todavía | No se conecta a destinos inexistentes |
| Valladolid | Centro (18,26), Mercadona (55,26), estanco (61,26) | Tres servicios jugables |
| Málaga | Hospital (27,21), Mercadona (46,21), estanco (52,21) | Tres servicios jugables |

Coordenadas de anclaje del edificio, no de puerta. Fuente: constructores `maps/_pintura/pintar_<ciudad>*.gd` y escenas correspondientes. Fachadas genéricas, provisionales; una tienda morada no siempre es estanco (la de Les Corts representa la Botiga del Barça).

Personajes: `data/trainers/famosos.json` contiene 46 entradas, todas con sprites de combate/mapa según su clase; `assets/sprites/trainers/recetas.json` contiene 123 recetas. Se pueden revisar combatiendo desde F9. No faltan por empezar los personajes de esa lista; falta colocar los que Javier decida en el mundo, con su guion.

Hay un conjunto de tres servicios por ciudad pintada (21 interiores). Los locales adicionales de otros barrios conservan su exterior y siguen pendientes de interiores; no se confunden con el conjunto abierto. Las Palmas: hospital/estanco en `las_palmas/vegueta_triana`, Mercadona en `las_palmas/canteras`. Bilbao continúa pendiente de su exterior.

## Validación final de la entrega

479/479 tests, 19.978 aserciones, 467,06 s; sin errores de script ni fugas al cerrar la suite. Arte: 10.926 PNG, 0 errores/avisos. Datos: 0 errores, 3 avisos anteriores. Cinco pruebas reales de servicios, 190 aserciones: 21 entradas/salidas al barrio correspondiente, curación, derrota, PC y transacciones.

Todos los interiores tienen alcance 0 problemas; siete de los ocho exteriores usados tienen alcance 0. Moncloa conserva una puerta inaccesible de la casa azul del Palacio tras su verja, reproducida en la escena publicada anterior; los tres servicios nuevos son accesibles. No se ha abierto ese palacio ni inventado un evento.

Comparativas: [Madrid](../arte/comparativas/madrid_locales.md), [Barcelona](../arte/comparativas/barcelona_locales.md), [Valencia](../arte/comparativas/valencia_locales.md), [Sevilla](../arte/comparativas/sevilla_locales.md), [Las Palmas](../arte/comparativas/las_palmas_locales.md), [Valladolid](../arte/comparativas/valladolid_locales.md), [Málaga](../arte/comparativas/malaga_locales.md). Arte provisional, pendiente Javier.
