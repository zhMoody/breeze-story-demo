extends PanelContainer
@onready var log_label: Label = %LogLabel
@onready var stone_label: Label = %StoneLabel
@onready var corn_label: Label = %CornLabel
@onready var tomato_label: Label = %TomatoLabel
@onready var egg_label: Label = %EggLabel
@onready var milk_label: Label = %MilkLabel

func _ready() -> void:
	InventoryManager.inventory_changed.connect(on_inventory_changed)

func on_inventory_changed():
	var inventory: Dictionary = InventoryManager.inventory
	var log = "log"
	var stone = "stone"
	var corn = "corn"
	var tomato = "tomato"
	var egg = "egg"
	var milk = "milk"
	
	if inventory.has(log):
		log_label.text = str(inventory[log])
	if inventory.has(stone):
		stone_label.text = str(inventory[stone])
	if inventory.has(corn):
		corn_label.text = str(inventory[corn])
	if inventory.has(tomato):
		tomato_label.text = str(inventory[tomato])
	if inventory.has(egg):
		egg_label.text = str(inventory[egg])
	if inventory.has(milk):
		milk_label.text = str(inventory[milk])
