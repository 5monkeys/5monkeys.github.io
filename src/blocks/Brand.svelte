<script>
	export let background;
	export let href;
</script>

<a {href} target="_blank" class="root" style={`background:${background}`} rel="noopener">
	<div class="inner">
		<slot />
	</div>
</a>

<style lang="scss">
	.root {
		position: relative;

		& > * {
			position: absolute;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
		}

		&:before {
			display: block;
			content: '';
			width: 100%;
			padding-top: 62.5%;
		}
	}

	.inner {
		padding: 2rem;
		display: flex;
		align-items: center;
		justify-content: center;

		@media (max-width: 900px) {
			padding: 1.5rem;
		}

		& :global(img) {
			object-fit: contain;
			height: 100%;
			width: 100%;
			max-width: 250px;
		}
	}
</style>
