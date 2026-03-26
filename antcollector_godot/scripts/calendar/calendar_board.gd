class_name CalendarBoard extends Node2D

@onready var calendar_mark_1: CalendarMark = $Marks/CalendarMark
@onready var calendar_mark_2: CalendarMark = $Marks/CalendarMark2
@onready var calendar_mark_3: CalendarMark = $Marks/CalendarMark3
@onready var calendar_mark_4: CalendarMark = $Marks/CalendarMark4
@onready var calendar_mark_5: CalendarMark = $Marks/CalendarMark5
@onready var calendar_mark_6: CalendarMark = $Marks/CalendarMark6
@onready var calendar_mark_7: CalendarMark = $Marks/CalendarMark7

var _marks: Array[CalendarMark]


func _ready() -> void:
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
		var mark: Node2D = _marks[mark_index]
		mark.show()
		mark.set_success()


func set_fail(mark_index: int) -> void:
	_marks[mark_index].show()
	_marks[mark_index].set_fail()
