class_name DirectoryLoadComponent extends Component
## Loads a packedscene to its parent for every
## scene in a directory. Good for level select buttons.

func _init():
	component_id = "DirectoryLoad"

## Whether to just load the scenes *from* the directory
@export var load_from_directory:bool = false
## Whether to add the children in reverse.
@export var load_from_back:bool = false
## Scene to load for each scene in a directory. Only loads if load_from_directory is false.
@export var loading_scene:PackedScene
## The path to the directory to use.
@export_dir var directory_path:String

## Any modifiers to apply to the created scene
@export var modifiers:Array[ModArgumentComponent]

@onready var parent = get_parent()
var to_be_parented:Array[Node]

func _ready() -> void:
	for child in get_children():
		if child is ModArgumentComponent:
			modifiers.append(child)
	
	
	if load_from_directory: ## Load the contents
		## Access the directory and iterate through its files
		var dir:DirAccess = DirAccess.open(directory_path)
		if dir:
			dir.list_dir_begin()
			var file_name = dir.get_next()
			while file_name != "": # While there are files left
				# As long as it isn't a directory
				if !dir.current_is_dir(): 
					
					## Load the file onto the parent
					var new = load(directory_path + "/" + file_name)
					
					for mod in modifiers:
						mod.modify(new, 0, load(file_name))
					
					to_be_parented.append(new)
					
				file_name = dir.get_next() # Move on
		else: # IF something messed up.
			print("An error occurred when trying to access the path.")
	else: ## Load the given scene.
		var dir:DirAccess = DirAccess.open(directory_path)
		if dir:
			dir.list_dir_begin()
			var file_name = dir.get_next()
			while file_name != "": # While there are files left
				# As long as it isn't a directory
				if !dir.current_is_dir(): 
					
					## Load the file onto the parent
					var new = loading_scene.instantiate()
					
					for mod in modifiers:
						mod.modify(new, 0, load(directory_path + "/" + file_name))
					
					to_be_parented.append(new)
			
				file_name = dir.get_next() # Move on
		else: # IF something messed up.
			print("An error occurred when trying to access the path.")

func _process(_delta: float) -> void:
	while len(to_be_parented) > 0:
		var node = to_be_parented[0 if load_from_back else len(to_be_parented)-1]
		
		if node.get_parent() == null:
			parent.add_child(node)
		else:
			to_be_parented.erase(node)
