<script>
import { KeepAwake } from '@capacitor-community/keep-awake';

const screen_height = screen.height;
const screen_width = screen.width;
let max_length = screen.height;
if (max_length > screen_width){
	max_length = screen_width;
}
let current_length = 0;

const button_on_click = () => {

	let canvas_context = canvas_pointer.getContext('2d');

	let size = Math.floor(Math.random() * 6) + 2;

	current_length = current_length + size;
	if (current_length > max_length){
		current_length = 0;
		canvas_context.clearRect(0, 0, screen_width, screen_height);
	}

	let x = Math.floor(Math.random() * screen_width) - size - 2;
	let y = Math.floor(Math.random() * screen_height) - size - 2;


	let date_object = new Date();
	
	let red = (255 / 2) / 31;
	red = Math.floor(red * date_object.getHours());

	let green = 255/86400;
	green = Math.floor(green * (date_object.getHours() * date_object.getMinutes() * date_object.getSeconds()));

	let blue = 255 / 3600;
	blue = Math.floor(blue * (date_object.getMinutes() * date_object.getMinutes()));

	canvas_context.fillStyle = `rgb(${red}, ${green}, ${blue})`;
	canvas_context.fillRect(x, y, size, size);
}
setInterval(button_on_click, 500);
let canvas_pointer;
</script>

<canvas id="canvas" width={screen_width} height={screen_height} bind:this={canvas_pointer}></canvas>

<style>
#canvas {
	overflow:hidden;
	background-color:#000;
}
</style>