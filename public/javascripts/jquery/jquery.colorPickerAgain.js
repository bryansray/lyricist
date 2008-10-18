/**
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/**
* jQuery colorSelect plugin 0.9
* http://blog.otakurzo.com/jquery/colorPickerAgain/
* Copyright (c) 2008 Otaku RzO (Renzo Galo Castro Jurado).
*/
;(function($) {
	$.fn.colorPickerAgain = function($$options) {
		// valores por defecto
		var $defaults = {
			color:new Array(
				"#CC3333","#DD4477","#994499","#6633CC","#336699",
				"#329262","#109618","#66AA00","#D6AE00","#EE8800"
			),
			defaultColor: 0,
			columns: 0,
			click: function($color){}
		};
		
		var $settings = $.extend({}, $defaults, $$options);
		
		// iterate and reformat each matched element
		return this.each(function() {
			$this = $(this);
			
			// build element specific options
			var o = $.meta ? $.extend({}, $settings, $this.data()) : $settings;
			var $$oldIndex = typeof(o.defaultColor)=='number' ? o.defaultColor : -1;
			
			var _html = "";
			for(i=0;i<o.color.length;i++){
				_html += '<div style="background-color:'+o.color[i]+';"></div>\n';
				//si o.defaultColor es de tipo texto, comparo con todos los colores hasta dar con el indice.
				if($$oldIndex==-1 && o.defaultColor==o.color[i]) $$oldIndex = i;
			}
			
			// CSS: Buenas practicas >> Cuidado con el Width!
			// http://www.lawebera.es/comunidad/articulos/diseno-web/css/css-buenas-practicas.php
			$this.html('<div class="jColorSelect">'+_html+'</div>');
			//obtenemos los contenedores de los colores
			$color = $this.children('.jColorSelect').children('div'); //no me funciono un solo children ( $this.children('.jColorSelect div') )
			
			// se obtiene el tamaño del DIV que contiene un color ( al usar la funcion "width" toma de referencia el width del primero ).
			// $color.width()+2+2 //se le suma el padding y margin de cada lado horizontal.
			var w = ($color.width()+2+2) * (o.columns>0 ? o.columns : o.color.length );
			$this.children('.jColorSelect').css('width',w);
			
			// Se usarán los indices de los DIV indicar el color dentro del array "o.color".
			// Nota: Use "each" para lograr obtener el index de los DIV, si existe otra manera por favor avisenme.
			$color.each(function(i){
				$(this).click(function(){
					// Evitar que vuelva a dar click a uno seleccionado
					if( $$oldIndex == i ) return;
					
					if( $$oldIndex > -1 ){
						// Si existe un color YA seleccionado se removera la clase check.
						if( $color.eq($$oldIndex).hasClass('check') ) $color.eq($$oldIndex).removeClass('check');
					}
					// Se guarda el Index del color seleccionado
					$$oldIndex = i;
					
					// se le agrega el "Check"
					$(this).addClass('check');
					// Se invoca a la funcion click definida por el usuario
					o.click(o.color[i]);
				});
			});
			
			// Simula un click al color por defecto (defaultColor).
			_tmp = $$oldIndex;
			$$oldIndex = -1;
			$color.eq(_tmp).trigger('click');
		});
		
		return this;
  };
  
  
})(jQuery);
