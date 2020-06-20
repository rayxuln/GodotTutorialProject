extends Node2D

var mesh

func _ready():
	gen_mesh()

func gen_mesh():
#	mesh = $dazui.mesh
	var ar = []
	ar.resize(ArrayMesh.ARRAY_MAX)
	var arry = $dazui.mesh.surface_get_arrays(0)
	
	var vvs:PoolVector2Array = []
	vvs.push_back(Vector2(0, 0))
	vvs.push_back(Vector2($dazui.texture.get_width(), 0))
	vvs.push_back(Vector2($dazui.texture.get_width(), $dazui.texture.get_height()))
	
	var uvvs:PoolVector2Array = []
	uvvs.push_back(Vector2(0, 0))
	uvvs.push_back(Vector2(1, 0))
	uvvs.push_back(Vector2(1, 1))
	
	var ids:PoolIntArray = [2, 1, 0]
	ar[ArrayMesh.ARRAY_VERTEX] = vvs #arry[ArrayMesh.ARRAY_VERTEX]
	ar[ArrayMesh.ARRAY_TEX_UV] = uvvs #arry[ArrayMesh.ARRAY_TEX_UV]
	ar[ArrayMesh.ARRAY_INDEX] = ids #arry[ArrayMesh.ARRAY_INDEX]
	
	var am = ArrayMesh.new()
	am.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, ar)
	mesh = am

func _process(delta):
	global_position = get_global_mouse_position()
	gen_mesh()
	update();

func _draw():
	draw_mesh(mesh, $dazui.texture, null);
