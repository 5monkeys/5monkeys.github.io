(function() {
	var canvas = document.querySelector("#bananas");
	if (!canvas) return;

	var image_url = "img/banan.png";
	var image = "";
	var settings = {
		particles: 20,
	};
	var particles = [];
	var ctx;
	center = { x: 0, y: 0 };

	function setupCanvas() {
		updateCanvasSize();
		ctx = canvas.getContext("2d");

		for (var i = 0; i < settings.particles; ++i) {
			particles.push({
				x: randomRange(0, canvas.width),
				y: randomRange(0, canvas.height),
				w: randomRange(50, 100),
				vy: randomRange(0, 1),
				vx: randomRange(0, 1),
				rotation: randomRange(0, 6.283185),
				scale: randomRange(0.2, 0.5),
				speed: randomRange(0.1, 1),
				flipped: Math.random() > 0.5 ? 1 : -1,
			});
		}

		createImage();
	}

	function renderBananas() {
		console.log("rendered bananas");
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
		if (p.x < 0 - +p.w || p.x > canvas.width + p.w) {
			p.x = randomRange(0, canvas.width);
		}

		// invisible on Y
		if (p.y < 0 - p.w || p.y > canvas.height + p.w) {
			p.y = 0;
		}
	}

	function recalculateBananas() {
		particles.map(function(p) {
			maybeRecycleBanana(p);
			p.y += p.speed;
			p.rotation += 0.01 * p.flipped;
		});

		renderBananas();
	}

	function startBananas() {
		recalculateBananas();

		window.requestAnimationFrame(function() {
			startBananas();
		});
	}

	function createImage() {
		image = new Image();
		image.onload = startBananas;
		image.src = image_url;
	}

	function updateCanvasSize() {
		canvas.height = window.innerHeight;
		canvas.width = window.innerWidth;
		center.x = canvas.width / 2;
		center.y = canvas.height / 2;
	}

	window.addEventListener("resize", function() {
		particles = [];
		setupCanvas();
	});

	setupCanvas();
})();

function randomRange(min, max) {
	return Math.random() * (max - min) + min;
}
