extends MeshInstance2D

var mm

var wmm = 100

func _ready():
	gen_mesh()

func gen_mesh():
	var arr = []
	arr.resize(Mesh.ARRAY_MAX)
	
	# PoolVectorXXArrays for mesh construction.
	var verts = PoolVector2Array()
	var uvs = PoolVector2Array()
#	var normals = PoolVector3Array()
#	var indices = PoolIntArray()
	
	#######################################
	## Insert code here to generate mesh ##
	#######################################
	verts.push_back(Vector2(0, 0))
	verts.push_back(Vector2(wmm, 0))
	verts.push_back(Vector2(0, 100))
	
	uvs.push_back(Vector2(0, 0))
	uvs.push_back(Vector2(1, 0))
	uvs.push_back(Vector2(0, 1))
	
	# Assign arrays to mesh array.
	arr[Mesh.ARRAY_VERTEX] = verts
	arr[Mesh.ARRAY_TEX_UV] = uvs
	#    arr[Mesh.ARRAY_NORMAL] = normals
	#    arr[Mesh.ARRAY_INDEX] = indices
	
	var am:ArrayMesh = ArrayMesh.new()
	
	
	# Create mesh surface from mesh array.
	am.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr) # No blendshapes or compression used.
	
	mm = am

func _process(delta):
	global_position = get_global_mouse_position()
	if(Input.is_action_just_pressed("ui_accept")):
		wmm *= 10
	gen_mesh()
	update()
	
func _draw():
	draw_mesh(mm, texture)
