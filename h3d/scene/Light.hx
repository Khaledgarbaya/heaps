package h3d.scene;

class Light extends Object {

	var shader : hxsl.Shader;
	var nextLight : Light;
	
	public var color(get, set) : h3d.Vector;
	public var priority : Int;

	function new(shader,?parent) {
		super(parent);
		this.shader = shader;
	}
	
	// dummy implementation
	function get_color() {
		return new h3d.Vector();
	}
	
	function set_color(v) {
		return v;
	}
	
	override function emit(ctx:RenderContext) {
		ctx.emitLight(this);
	}

}