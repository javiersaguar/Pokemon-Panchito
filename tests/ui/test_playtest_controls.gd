extends GutTest
## Entradas físicas del mando y búsquedas reales del catálogo, sin tocar partidas.
var main: Node
var menu: PlaytestMenu

func before_each() -> void:
	GameState.reset()
	SaveManager.test_session_active = false
	main = load("res://src/main/main.tscn").instantiate()
	main.set_script(null)
	add_child(main)
	SceneManager.register_main(main)
	menu = Debug._preferred_panel as PlaytestMenu

func after_each() -> void:
	Debug.close()
	SaveManager.test_session_active = false
	SceneManager._leave_game()
	main.queue_free()
	await wait_physics_frames(2)
	SceneManager.world = null
	SceneManager.ui_layer = null
	SceneManager.battle_layer = null
	SceneManager.transition_layer = null
	SceneManager._fade = null

func _press(button: JoyButton) -> void:
	for down: bool in [true, false]:
		var event := InputEventJoypadButton.new()
		event.button_index = button
		event.pressed = down
		Input.parse_input_event(event)

func _picker(kind: String) -> PlaytestPicker:
	var picker := PlaytestPicker.new()
	picker.entries = menu._catalogue(kind)
	SceneManager.push_menu(picker)
	return picker

func test_a_del_mando_activa_entrar_sin_raton() -> void:
	Debug.open()
	await wait_process_frames(3)
	menu.start_button.grab_focus()
	_press(JOY_BUTTON_A)
	await wait_process_frames(3)
	assert_true(menu.session.active, "A debe activar el botón que tiene el foco")
	if menu.session.active:
		await wait_until(func() -> bool: return not menu.session.working, 4.0)
		assert_eq(await menu.session.finish(), OK)

func test_busqueda_espanola_sin_tildes_y_con_palabras_separadas() -> void:
	var picker := _picker("moves")
	picker._filter(" ATAQUE rapido ")
	assert_true(picker.shown.any(func(entry: Dictionary) -> bool: return entry.id == "quickattack"))
	picker._filter("puno fuego")
	assert_true(picker.shown.any(func(entry: Dictionary) -> bool: return entry.id == "firepunch"))
	SceneManager.pop_menu(picker)
	await wait_process_frames(2)
	picker = _picker("species")
	picker._filter("CHARIZARD mega X")
	assert_eq(picker.shown.map(func(entry: Dictionary) -> String: return entry.id), ["charizardmegax"])

func test_mando_b_cancela_busqueda_y_a_elige_una_sola_vez() -> void:
	var picker := _picker("moves")
	var answers: Array[String] = []
	picker.completed.connect(func(id: String) -> void: answers.append(id))
	await wait_process_frames(3)
	assert_true(picker.search.has_focus())
	_press(JOY_BUTTON_B)
	await wait_process_frames(2)
	assert_eq(answers, [""], "B cierra también al escribir en el buscador")
	SceneManager.pop_menu(picker)
	await wait_process_frames(2)
	picker = _picker("moves")
	answers.clear()
	picker.completed.connect(func(id: String) -> void: answers.append(id))
	picker._filter("ataque rápido")
	picker.list.grab_focus()
	await wait_process_frames(2)
	_press(JOY_BUTTON_A)
	await wait_process_frames(2)
	assert_eq(answers, ["quickattack"])
