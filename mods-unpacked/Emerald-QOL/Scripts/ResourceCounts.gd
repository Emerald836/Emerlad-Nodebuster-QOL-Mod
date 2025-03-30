extends VBoxContainer
class_name ResourceCounts


@onready var bits = %Bits
@onready var nodes = %Nodes
@onready var cores = %Cores
@onready var sp = %SP
@onready var netcoin = %Netcoin
@onready var processors = %Processors




func _ready():
	bits.set_resource_type(ResourceType.BITS)
	nodes.set_resource_type(ResourceType.NODES)
	cores.set_resource_type(ResourceType.CORES)
	sp.set_resource_type(ResourceType.SP)
	netcoin.set_resource_type(ResourceType.NETCOIN)
	processors.set_resource_type(ResourceType.PROCESSORS)
	
	var resource_panels: Array[ResourcePanel] = [
		bits, nodes, cores, sp, netcoin, processors
	]


func _process(delta):
	bits.visible = true
	nodes.visible = State.nodes_unlocked
	cores.visible = State.cores_unlocked
	sp.visible = State.sp_unlocked
	netcoin.visible = State.netcoin_unlocked
