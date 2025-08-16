extends Control


@onready var timer_label = $Time
var time_elapsed: float = 0.0
var running := false

func _process(delta: float):
	if running:
		time_elapsed += delta
		timer_label.text = format_time(time_elapsed)

func _ready() -> void:
	start_timer()

func start_timer():
	time_elapsed = 0.0
	running = true

func stop_timer():
	running = false

func format_time(seconds: float) -> String:
	var minutes = int(seconds) / 60
	var secs = int(seconds) % 60
	return "%02d:%02d" % [minutes, secs]
