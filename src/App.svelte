<script>
import { derived, writable } from 'svelte/store';


/**
 * init store so we can loop through it
 * and store element pointer
 */
let store=writable({});

const screen_height = Math.floor(screen.height / 3);
const screen_width = Math.floor(screen.width / 3);
const max_length = Math.floor((screen_width + screen_height) / .375);

const button_on_click = () => {
	if (
		(typeof $store == 'object')
		&&
		(Object.keys($store).length > max_length)
	){
		store.update((n) => {
			return {};
		});
	}

	let x = Math.floor(Math.random() * screen_height);
	let y = Math.floor(Math.random() * screen_width);

	let date_object = new Date();
	
	let red = (255 / 2) / 31;
	red = Math.floor(red * date_object.getHours());

	let green = 255/86400;
	green = Math.floor(green * (date_object.getHours() * date_object.getMinutes() * date_object.getSeconds()));

	let blue = 255 / 3600;
	blue = Math.floor(blue * (date_object.getSeconds() * date_object.getMinutes()));

	$store[ x + '-' + y] = `rgb(${red}, ${green}, ${blue});`;
}
setInterval(button_on_click, 500);
</script>

<div id='canvas'>
{#each {length: (screen_height)} as _, row}
	<div>
	{#each {length: (screen_width)} as _, col}
		{#if $store[ row + '-' + col ] || ''}
			<span class='pixel' style={'background-color: ' + $store[ row + '-' + col ]}></span>
		{:else}
			<span class='pixel'></span>
		{/if}
	{/each}
	</div>
{/each}
</div>

<style>
#canvas {
	overflow:hidden;
	background-color:#000;
}
.pixel {
  display: table-cell;
  width: 3px;
  height: 3px;
}
</style>