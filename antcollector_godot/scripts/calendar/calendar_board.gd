class_name CalendarBoard extends Node2D

@onready var calendar_mark_1: Node2D = $Marks/CalendarMark
@onready var calendar_mark_2: Node2D = $Marks/CalendarMark2
@onready var calendar_mark_3: Node2D = $Marks/CalendarMark3
@onready var calendar_mark_4: Node2D = $Marks/CalendarMark4
@onready var calendar_mark_5: Node2D = $Marks/CalendarMark5
@onready var calendar_mark_6: Node2D = $Marks/CalendarMark6
@onready var calendar_mark_7: Node2D = $Marks/CalendarMark7



var _marks

func _ready():
	_marks = [
		calendar_mark_1,
		calendar_mark_2,
		calendar_mark_3,
		calendar_mark_4,
		calendar_mark_5,
		calendar_mark_6,
		calendar_mark_7,
	]


func set_success(mark_index: int) -> void:
	if _marks:
		var mark = _marks[mark_index]
		mark.show()
		mark.set_success()


func set_fail(mark_index: int) -> void:
	_marks[mark_index].show()
	_marks[mark_index].set_fail()
