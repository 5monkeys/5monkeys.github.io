(function() {
	var canvas = document.querySelector("#bananas");
	if (!canvas) return;

	var image = "";
	var settings = {
		canvasSize: {
			x: 0,
			y: 0,
		},
		areaPadding: 100, // threshold for killing and spawning bananas
		image_url: "img/banan.png",
		particles: 20,
		center: { x: 0, y: 0 },
		render: false,
		cancelRender: false,
		gravity: 1.5,
		turbulence: 0,
		wind: 0,
	};

	var particles = [];
	var ctx;

	function setupCanvas() {
		window.addEventListener("resize", function() {
			updateCanvasSize();
		});

		updateCanvasSize();
		ctx = canvas.getContext("2d");

		for (var i = 0; i < settings.particles; ++i) {
			particles.push({
				x: randomRange(0, canvas.width),
				y: randomRange(0, canvas.height),
				w: randomRange(50, 100),
				vy: randomRange(0.5, 1),
				vx: randomRange(0, 1),
				rotation: randomRange(0, 6.283185),
				scale: randomRange(0.2, 0.5),
				flipped: Math.random() > 0.5 ? 1 : -1,
			});
		}

		createImage();
	}

	function renderBananas() {
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		for (var i = 0; i < particles.length; ++i) {
			var p = particles[i];

			var size = p.w * (p.scale * p.flipped);
			var adjustedX = p.x - size / 2;
			var adjustedY = p.y - size / 2;
			ctx.save();
			ctx.translate(adjustedX, adjustedY);
			ctx.rotate(p.rotation);
			ctx.drawImage(image, 0, 0, size, size);
			ctx.restore();
		}
	}

	function maybeRecycleBanana(p) {
		// invisible on X
		if (
			p.x < 0 - p.w - settings.areaPadding ||
			p.x > canvas.width + p.w + settings.areaPadding
		) {
			p.x = randomRange(0, canvas.width);
		}

		// invisible on Y
		if (
			p.y < 0 - p.w - settings.areaPadding ||
			p.y > canvas.height + p.w + settings.areaPadding
		) {
			p.y = 0 - settings.areaPadding;
		}
	}

	function recalculateBananas() {
		particles.map(function(p) {
			maybeRecycleBanana(p);

			// recalculate speed along axis based on turbulence, if 1 this is useless.
			if (settings.turbulence == !1) {
				p.vy =
					p.vy *
					randomRange(
						1 - settings.turbulence,
						1 + settings.turbulence,
					);

				p.vx =
					p.vx *
					randomRange(
						1 - settings.turbulence,
						1 + settings.turbulence,
					);
			}

			p.y += p.vy * settings.gravity;
			p.x += p.vx * settings.wind;
			p.rotation += 0.01 * p.flipped;
		});

		renderBananas();
	}

	function startBananas() {
		recalculateBananas();

		if (!settings.render) return;

		window.requestAnimationFrame(function() {
			startBananas();
		});
	}

	function createImage() {
		image = new Image();
		image.onload = startBananas;
		image.src = settings.image_url;
	}

	function cancelRender() {
		settings.render = false;
	}

	function resumeRender() {
		settings.render = true;
	}

	function updateCanvasSize(initialSetup) {
		if (settings.render) cancelRender();

		var oldCanvasSize = settings.canvasSize;

		canvas.height = window.innerHeight;
		canvas.width = window.innerWidth;
		settings.center.x = canvas.width / 2;
		settings.center.y = canvas.height / 2;
		settings.canvasSize = {
			y: canvas.height,
			x: canvas.width,
		};

		if (!initialSetup) {
			particles.map(function(p) {
				p.x = mapRange(0, oldCanvasSize.x, 0, settings.canvasSize.x);
				p.y = mapRange(0, oldCanvasSize.y, 0, settings.canvasSize.y);
			});
		}

		resumeRender();
	}

	setupCanvas();
})();

function randomRange(min, max) {
	return Math.random() * (max - min) + min;
}

function mapRange(value, low1, high1, low2, high2) {
	return low2 + ((high2 - low2) * (value - low1)) / (high1 - low1);
}
