extends Node2D


var items = ["Coal", "Gem", "Gold", "Sword", "Arrowhead"]
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_item_body_entered(body: Node2D) -> void:
	print("hi")
	var my_random_number = rng.randi_range(0, 4)
	print(items[my_random_number])
