<script>
  import Article from '../../components/Article.svelte';
  import Block from '../../components/Block.svelte';
  import Container from '../../components/Container.svelte';
  import Link from '../../components/Link.svelte';
  import LogoGrid from '../../components/LogoGrid.svelte';

  const open_source = [
    {
      name: 'Django',
      href: 'https://www.djangoproject.com/',
      img: '/img/brands/Django_logo.svg',
    },
    {
      name: 'Docker',
      img: '/img/brands/docker.svg',
      href: 'https://www.docker.com/',
    },
    {
      name: 'Ansible',
      img: '/img/brands/ansible.svg',
      href: 'https://ansible.com',
    },
    {
      name: 'Prettier',
      img: '/img/brands/prettier.svg',
      href: 'https://prettier.io',
    },
    {
      name: 'Celery',
      img: '/img/brands/celery.svg',
      href: 'https://docs.celeryproject.org',
    },
    {
      name: 'ISORT',
      img: '/img/brands/isort.svg',
      href: 'https://pycqa.github.io/isort',
    },
    {
      name: 'HTTPX',
      img: '/img/brands/HTTPX.svg',
      href: 'https://www.python-httpx.org',
    },
    {
      name: 'Kapten',
      img: '/img/brands/kapten.svg',
      href: 'https://github.com/5monkeys/kapten',
    },
    {
      name: 'Django Bananas',
      img: '/img/brands/bananas.svg',
      href: 'https://github.com/5monkeys/django-bananas',
    },
    {
      name: 'Djedi CMS',
      img: '/img/brands/djedi-portrait.svg',
      href: 'https://github.com/5monkeys/djedi-cms',
    },
    {
      name: 'RESPX',
      img: '/img/brands/RESPX.svg',
      href: 'https://lundberg.github.io/respx',
    },
  ];
</script>

<Block background="secondary">
  <Container fullHeight center>
    <div>
      <Article>
        <p>
          <strong>We contribute to open source.</strong> You'll find
          contributions from our engineers in major open source projects such as
          <Link href="https://djangoproject.com/">Django</Link> (used by Instagram,
          Mozilla, etc.),
          <Link href="https://ansible.com/">Ansible</Link> and
          <Link href="https://docker.com/">Docker</Link> (used by everyone!).
        </p>

        <p>
          In addition we maintain a few open source projects ourselves. Some
          examples include <Link href="https://github.com/5monkeys/djedi-cms"
            >Djedi CMS</Link
          >, <Link href="https://github.com/5monkeys/django-bananas"
            >django-bananas</Link
          >, <Link href="https://github.com/lundberg/respx">RESPX</Link> and <Link
            href="https://github.com/5monkeys/kapten">Kapten</Link
          >.
        </p></Article
      >
    </div>
    <LogoGrid>
      {#each open_source as { img, href, name }}
        <a {href} class="tech">
          {#if img}
            <img src={img} alt={name} />
          {:else}
            {name}
          {/if}
        </a>
      {/each}
    </LogoGrid>
  </Container>
</Block>

<style>
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

    img {
      width: 100%;
      height: 100%;
      object-fit: contain;
    }
  }
</style>
