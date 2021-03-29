<script>
	import Article from '$components/Article.svelte';
	import Block from '$components/Block.svelte';
	import Container from '$components/Container.svelte';
	import Link from '$components/Link.svelte';
	import LogoGrid from '$components/LogoGrid.svelte';

	import DjangoLogo from '$brands/Django_logo.svg';
	import DockerLogo from '$brands/docker.svg';
	import AnsibleLogo from '$brands/ansible.svg';
	import PrettierLogo from '$brands/prettier.svg';
	import CeleryLogo from '$brands/celery.svg';
	import IsortLogo from '$brands/isort.svg';
	import HttpxLogo from '$brands/HTTPX.svg';
	import KaptenLogo from '$brands/kapten.svg';
	import BananasLogo from '$brands/bananas.svg';
	import DjediLogo from '$brands/djedi-portrait.svg';
	import RespxLogo from '$brands/RESPX.svg';
	import SvgIcon from '$components/SvgIcon.svelte';
	import ScreenReaderOnly from '$components/ScreenReaderOnly.svelte';

	const open_source = [
		{
			name: 'Django',
			img: DjangoLogo,
			href: 'https://djangoproject.com/'
		},
		{
			name: 'Docker',
			img: DockerLogo,
			href: 'https://docker.com/'
		},
		{
			name: 'Ansible',
			img: AnsibleLogo,
			href: 'https://ansible.com'
		},
		{
			name: 'Prettier',
			img: PrettierLogo,
			href: 'https://prettier.io'
		},
		{
			name: 'Celery',
			img: CeleryLogo,
			href: 'https://docs.celeryproject.org'
		},
		{
			name: 'ISORT',
			img: IsortLogo,
			href: 'https://pycqa.github.io/isort'
		},
		{
			name: 'HTTPX',
			img: HttpxLogo,
			href: 'https://www.python-httpx.org'
		},
		{
			name: 'Kapten',
			img: KaptenLogo,
			href: 'https://github.com/5monkeys/kapten'
		},
		{
			name: 'Django Bananas',
			img: BananasLogo,
			href: 'https://github.com/5monkeys/django-bananas'
		},
		{
			name: 'Djedi CMS',
			img: DjediLogo,
			href: 'https://github.com/5monkeys/djedi-cms'
		},
		{
			name: 'RESPX',
			img: RespxLogo,
			href: 'https://lundberg.github.io/respx'
		}
	];
</script>

<Block background="secondary">
	<Container fullHeight center>
		<div>
			<Article>
				<p>
					<strong>We contribute to open source.</strong> You'll find contributions from our
					engineers in major open source projects such as
					<Link href="https://djangoproject.com/">Django</Link> (used by Instagram, Mozilla, etc.),
					<Link href="https://ansible.com/">Ansible</Link> and
					<Link href="https://docker.com/">Docker</Link> (used by everyone!).
				</p>

				<p>
					In addition we maintain a few open source projects ourselves. Some examples include <Link
						href="https://github.com/5monkeys/djedi-cms">Djedi CMS</Link
					>, <Link href="https://github.com/5monkeys/django-bananas">django-bananas</Link>, <Link
						href="https://github.com/lundberg/respx">RESPX</Link
					> and <Link href="https://github.com/5monkeys/kapten">Kapten</Link>.
				</p></Article
			>
		</div>
		<LogoGrid>
			{#each open_source as { img, href, name }}
				<a {href} class="tech" rel="noopener">
					{#if img}
						<ScreenReaderOnly>{name}</ScreenReaderOnly>
						<img src={img} alt={name} />
					{:else}
						{name}
					{/if}
				</a>
			{/each}
		</LogoGrid>
	</Container>
</Block>

<style lang="scss">
	div {
		margin-bottom: 3rem;
	}

	.tech {
		text-decoration: none;
		color: white;
		padding: 1rem;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 2rem;
		font-weight: var(--bold);
		white-space: nowrap;

		@media (max-width: 600px) {
			padding: 0.25rem;
		}

		:global(img) {
			width: 100%;
			height: 100%;
			object-fit: contain;
		}
	}
</style>
