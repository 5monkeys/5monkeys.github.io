<script>
	import Article from '$components/Article.svelte';
	import Container from '$components/Container.svelte';
	import Brand from './Brand.svelte';
	import ArrowForward from '$icons/arrow_forward.svelte';
	import ScreenReaderOnly from '$components/ScreenReaderOnly.svelte';

	/** logos */
	import DNLogo from '$brands/dn.svg';
	import GinaTricotLogo from '$brands/ginatricot.svg';
	import EqtLogo from '$brands/eqt.svg';
	import BolistLogo from '$brands/bolist.svg';
	import MojangLogo from '$brands/mojang.svg';
	import PressbyranLogo from '$brands/pressbyran.svg';
	import ReasonLogo from '$brands/reasonstudios.svg';
	import WallismLogo from '$brands/wallism.svg';
	import ObayatyLogo from '$brands/obayaty.svg';
	import XlByggLogo from '$brands/xl-bygg.svg';
	import ArkivetLogo from '$brands/arkivet.svg';

	const brands = [
		{
			href: 'https://obayaty.com',
			logo: ObayatyLogo,
			name: 'Obayaty',
			color: '#f0f0f0'
		},
		{
			href: 'https://xlbygg.se',
			logo: XlByggLogo,
			name: 'XL-BYGG',
			color: '#000000'
		},
		{
			href: 'https://arkivet.com',
			logo: ArkivetLogo,
			name: 'Arkivet',
			color: '#d1dbcb'
		},

		{
			href: 'https://ginatricot.com',
			logo: GinaTricotLogo,
			name: 'Gina Tricot',
			color: '#e0c4b6'
		},
		{
			href: 'https://dn.se',
			logo: DNLogo,
			name: 'DN',
			color: '#f00'
		},
		{
			href: 'https://eqtventures.com',
			logo: EqtLogo,
			name: 'EQT',
			color: '#240447'
		},
		{
			href: 'https://bolist.se',
			logo: BolistLogo,
			name: 'Bolist',
			color: '#EF7D0B'
		},
		{
			href: 'https://mojang.com',
			logo: MojangLogo,
			name: 'Mojang',
			color: '#000'
		},
		{
			href: 'https://pressbyran.se',
			logo: PressbyranLogo,
			name: 'Pressbyrån',
			color: '#EDC607'
		},
		{
			href: 'https://reasonstudios.com/',
			logo: ReasonLogo,
			name: 'Reason studios',
			color: '#F0E8DA'
		},
		{
			href: 'https://wallism.com/',
			logo: WallismLogo,
			name: 'Wallism',
			color: '#C6C3FF'
		}
	].sort(() => (Math.random() > 0.5 ? 1 : -1));
</script>

<Container padding="none" fullWidth center fullHeight>
	<div class="wrapper">
		<Article><h2>Some of our clients.</h2></Article>
		<div class="root">
			{#each brands as brand}
				<Brand background={brand.color} href={brand.href}>
					<ScreenReaderOnly>{brand.name}</ScreenReaderOnly>
					<img src={brand.logo} alt={brand.name} />
				</Brand>
			{/each}
			<div class="plug">
				<div>
					<span class="heavy">Want to join the club?</span>
					<a class="cta" href="#contact" rel="noopener">
						<span>Get in touch!</span><ArrowForward />
					</a>
				</div>
			</div>
		</div>
	</div>
</Container>

<style lang="scss">
	.heavy {
		display: block;
		font-weight: var(--bold);
		font-size: 2rem;
		margin-bottom: 0.5em;
		display: block;

		@media (max-width: 600px) {
			font-size: 1.5rem;
		}
	}
	.wrapper {
		width: 100%;
		padding: 2vw;
	}
	.root {
		display: grid;
		grid-gap: 2vw;
		grid-template-columns: repeat(4, 1fr);
		grid-template-rows: auto;

		@media (max-width: 900px) {
			grid-template-columns: repeat(3, 1fr);
		}

		@media (max-width: 400px) {
			grid-template-columns: repeat(2, 1fr);
		}
	}

	.plug {
		padding: 2rem;
		border: 0.5rem dashed var(--primary);
		display: flex;
		align-items: center;
		justify-content: center;

		@media (max-width: 600px) {
			grid-column: 1/-1;
			border-width: 4px;
		}
	}

	.cta {
		position: relative;
		display: inline-flex;
		color: black;
		text-decoration: none;
		padding-right: 1.5em;
		background: white;
		border-radius: 100px;
		font-weight: var(--bold);
		font-size: 1rem;

		span {
			flex-shrink: 0;
		}

		& > :global(svg) {
			height: 1em;
			width: 1em;
			position: absolute;
			top: 50%;
			right: 0;
			transform: translateY(-50%);
		}
	}
</style>
