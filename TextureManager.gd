extends TextureRect

@onready var grid_size = get_node("../LifeCompute").grid_size

@export_file("*.png") var initial_texture

func _ready():
	if "" == initial_texture:
		var image = Image.new()
		image.create(grid_size.x + 2, grid_size.y + 2, false, Image.FORMAT_RF)
		image.save_png("test.png")
		var image_texture = ImageTexture.create_from_image(image)
		texture = image_texture
	else:
		var image = Image.new()
		image.load(initial_texture)
		image.convert(Image.FORMAT_RF)
		image.save_png("test.png")
		var image_texture = ImageTexture.create_from_image(image)
		texture = image_texture
		get_node("../LifeCompute").load_data(image)


func set_data(data : PackedByteArray):
	var image = texture.get_image()
	print(texture)
	image.create_from_data(grid_size.x + 2, grid_size.y + 2, false, Image.FORMAT_RF, data)
	texture.update(image)
