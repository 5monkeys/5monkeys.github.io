<script>
	import Article from '$components/Article.svelte';

	const { default: Block } = require('$components/Block.svelte');
	const { default: Container } = require('$components/Container.svelte');
	const { default: LogoGrid } = require('$components/LogoGrid.svelte');

	const tech_stack = [
		{ img: '/img/brands/Tmux_logo.svg', name: 'tmux' },
		{ img: '/img/brands/React-icon.svg', name: 'React' },
		{ img: '/img/brands/RabbitMQ_logo.svg', name: 'RabbitMQ' },
		{ img: '/img/brands/Kubernetes_logo.svg', name: 'Kubernetes' },
		{ img: '/img/brands/docker.svg', name: 'Docker' },
		{ img: '/img/brands/haskell-logo.svg', name: 'Haskell' },
		{ img: '/img/brands/graphql.svg', name: 'GraphQL' },
		{ img: '/img/brands/Apple_iOS_logo.svg', name: 'Apple IOS' },
		{ img: '/img/brands/Android_logo_2019.svg', name: 'Android' },
		{ img: '/img/brands/gh-actions.svg', name: 'Github Actions' },
		{ img: '/img/brands/1180px-Node.js_logo.svg', name: 'NodeJS' }
	];
</script>

<Container fullHeight center>
	<div>
		<Article>
			<strong>Our preferred stack.</strong> Sed finibus ante ut tortor lacinia, et convallis ante hendrerit.
			Curabitur cursus convallis felis, vel efficitur sem iaculis vel. Maecenas ac purus porta sem vulputate
			hendrerit eu sit amet nisi.
		</Article>
	</div>

	<LogoGrid>
		{#each tech_stack as { img, name }}
			<span class="tech">
				<img src={img} alt={name} />
			</span>
		{/each}
	</LogoGrid>
</Container>

<style lang="scss">
	div {
		margin-bottom: 3rem;
	}
	.tech {
		padding: 1rem;
		display: flex;
		align-items: center;
		justify-content: center;

		img {
			width: 100%;
			height: 100%;
			object-fit: contain;
			filter: contrast(200%) grayscale(100%) brightness(0.7);
			transition: filter 0.5s ease-in-out;
		}
	}
</style>
