<script>
	import Block from '$components/Block.svelte';
	import Container from '$components/Container.svelte';
	import SvgIcon from '$components/SvgIcon.svelte';
	import ArrowDown from '$icons/arrow_down.svelte';
	import ScreenReaderOnly from '$components/ScreenReaderOnly.svelte';
</script>

<Block background="primary">
	<Container fullHeight>
		<div class="blowout" />
		<a href="#about" class="scrollButton">
			<SvgIcon><ArrowDown /></SvgIcon>
			<ScreenReaderOnly>Go to about us</ScreenReaderOnly>
		</a>
	</Container>
</Block>

<style lang="scss">
	.scrollButton {
		position: absolute;
		bottom: var(--sideMargin);
		left: 50%;
		transform: translateX(-50%);
		color: white;
		width: 54px;
		height: 54px;

		& :global(svg) {
			width: 100%;
		}
	}

	.blowout {
		position: absolute;
		width: 90%;
		height: 60%;
		left: 5%;
		top: 20%;
		background-image: url('/img/monkey.svg');
		background-position: center;
		background-size: contain;
	}
</style>
