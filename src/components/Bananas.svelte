<script>
	import { onMount } from 'svelte';

	const MAX_BANANAS = 50;
	const PADDING = 100;
	const GRAVITY = 4;
	const WIND = 1;

	const bananas = [];

	let canvas, width, height;

	function randomRange(min, max) {
		return Math.random() * (max - min) + min;
	}

	export let recycleBananas = false;

	export function spawnBananas() {
		for (let i = 0; i < MAX_BANANAS; i++) {
			bananas.push({
				x: randomRange(0 - PADDING, width + PADDING),
				y: 0,
				width: randomRange(50, 100),
				vy: randomRange(0.5, 1.5),
				vx: randomRange(-0.3, 0.3),
				rotation: randomRange(0, 6),
				rotationSpeed: randomRange(-0.004, 0.004),
				scale: randomRange(0.2, 0.7),
				flipped: Math.random() > 0.5 ? 1 : -1
			});
		}
	}

	onMount(() => {
		const sprite = new Image();
		sprite.src = '/img/banan.png';

		const ctx = canvas.getContext('2d');
		let frame;

		function renderBanana(banana) {
			const size = banana.width * (banana.scale * banana.flipped);
			const x = banana.x - size / 2;
			const y = banana.y - size / 2;

			ctx.save();
			ctx.translate(x, y);
			ctx.rotate(banana.rotation);
			ctx.drawImage(sprite, 0, 0, size, size);
			ctx.restore();
		}

		function updateBanana(banana) {
			banana.y += banana.vy + banana.vy * GRAVITY;
			banana.x += banana.vx + banana.vx * WIND;
			banana.rotation += banana.rotationSpeed * banana.flipped;
		}

		function update() {
			frame = requestAnimationFrame(update);
			ctx.clearRect(0, 0, width, height);

			for (let i = 0; i < bananas.length; i++) {
				const banana = bananas[i];
				if (banana == null) continue;

				renderBanana(banana);
				updateBanana(banana);

				if (
					banana.x + banana.width < 0 ||
					banana.x - banana.width > width ||
					banana.y - banana.width > height
				) {
					if (recycleBananas) {
						banana.x = randomRange(0 - PADDING, width + PADDING);
						banana.y = 0;
					} else {
						delete bananas[i];
					}
				}
			}
		}

		update();

		return () => cancelAnimationFrame(frame);
	});
</script>

<svelte:window bind:innerWidth={width} bind:innerHeight={height} />

<canvas aria-hidden="true" bind:this={canvas} {width} {height} />

<style lang="scss">
	canvas {
		position: absolute;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
		width: 100%;
		height: 100%;
		user-select: none;
		pointer-events: none;
	}
</style>
