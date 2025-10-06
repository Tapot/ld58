extends Node


const MAX_DAYS: int = 7


var current_day: int = 0
var current_boss_index: int = 0

var is_tutor_passed: bool = false
var bosses_hp = [
	50, 50, 100
]
var ants_dies: int = 0
var fights = []
var death_reasons = {
	"poison": "poisoned by you!",
	"antie": "antie happened",
	"lost": "unknown",
	"jar": "Jar impact",
	"mama_roach": "MAMA ROACH",
	"spider": "killed by the spider",
	"fly": "flattened by a fly",
}


var days = [
	"SUNDAY",
	"MONDAY",
	"TUESDAY",
	"WEDNESDAY",
	"THURSDAY",
	"FRIDAY",
	"SATURDAY"
]

var collections_log: Array[Dictionary] = [
	{
		"name": "antie sdf",
		"death_reason": death_reasons["poison"],
		"day": days[0]
	},
	{
		"name": "antie sdf",
		"death_reason": death_reasons["antie"],
		"day": days[1]
	},
	{
		"name": "antie sdf",
		"death_reason": death_reasons["lost"],
		"day": days[2]
	},
	{
		"name": "antie sdf",
		"death_reason": death_reasons["jar"],
		"day": days[3]
	},
	{
		"name": "antie sdf",
		"death_reason": death_reasons["mama_roach"],
		"day": days[4]
	},
	{
		"name": "antie sdf",
		"death_reason": death_reasons["spider"],
		"day": days[5]
	},
	{
		"name": "antie sdf",
		"death_reason": death_reasons["fly"],
		"day": days[6]
	},
]


func _ready() -> void:
	Signals.connect_next_day(
		on_next_day
	)
	Signals.connect_ant_died(
		on_ant_died
	)


func on_ant_died(
	ant_name: String,
	death_reason: String,
	_pos: Vector2
) -> void:
	var inxed_day = current_day
	if current_day > 6:
		inxed_day = 6
	collections_log.append(
		{
			"name": ant_name,
			"death_reason": death_reasons[death_reason],
			"day": days[inxed_day]
		}
	)
	ants_dies += 1


func on_next_day():
	current_day += 1


func add_fight_results(success: bool):
	fights.append(success)


func is_over() -> bool:
	if current_day >= MAX_DAYS:
		return true
	elif current_boss_index > 2:
		return true
	else:
		return false
