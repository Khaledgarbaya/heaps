package h2d;

class Layers extends Sprite {
	
	var layers : Array<Int>;
	var layerCount : Int;
	
	public function new(?parent) {
		super(parent);
		layers = [];
		layerCount = 0;
	}
	
	public function add( s : Sprite, layer : Int ) {
		// new layer
		while( layer > layerCount )
			layers[layerCount++] = childs.length;
		s.remove();
		if( layer == layerCount )
			childs.push(s);
		else {
			childs.insert(layers[layer], s);
			for( i in layer...layerCount )
				layers[i]++;
		}
		s.parent = this;
	}
	
	override function removeChild( s : Sprite ) {
		for( i in 0...childs.length ) {
			if( childs[i] == s ) {
				childs.splice(i, 1);
				var k = layerCount - 1;
				while( k >= 0 && layers[k] >= i ) {
					layers[k]--;
					k--;
				}
			}
		}
	}
	
	public function ysort( layer : Int ) {
		// TODO
	}

	
}