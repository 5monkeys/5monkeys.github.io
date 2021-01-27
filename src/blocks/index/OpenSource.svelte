<script>
  import Article from '../../components/Article.svelte';
  import Block from '../../components/Block.svelte';
  import Container from '../../components/Container.svelte';
  import Link from '../../components/Link.svelte';
  import LogoGrid from '../../components/LogoGrid.svelte';

  const open_source = [
    { href: '', img: '/img/brands/Django_logo.svg', name: 'Django' },
    { href: 'https://prettier.io/', name: 'Prettier' },
    { href: '', name: 'Celery' },
    { href: '', name: 'HTTPX' },
    { href: '', name: 'HTTPX' },
    { img: '/img/brands/isort.png', name: 'ISORT' },
  ];
  /**
   * django
   * docker
   * ansible
   * httpx
   * celery
   * isort
   * prettier
   *
   */
</script>

<Block background="secondary">
  <Container fullHeight center>
    <div>
      <Article>
        <p>
          <strong>We contribute to open source.</strong> You'll find contributions
          from our engineers in major open source infrastructure projects such as
          Django (used by Instagram, Mozilla, The Washington Times, etc.), Docker
          (used by everyone!) and Ansible.
        </p>
        <p>
          In addition to our external contributions we maintain a few open
          source projects ourselves. Some examples include <Link
            href="https://github.com/5monkeys/djedi-cms">Djedi CMS</Link
          >, <Link href="https://github.com/5monkeys/django-bananas"
            >django-bananas</Link
          >, RESPX <Link href="https://github.com/lundberg/respx"
            >(HTTPX mocking)</Link
          > and <Link href="https://github.com/5monkeys/kapten"
            >Kapten (Docker Swarm auto-deploy)</Link
          >.
        </p></Article
      >
    </div>
    <LogoGrid>
      {#each open_source as { img, name }}
        <span class="tech">
          {#if img}
            <img src={img} alt={name} />
          {:else}
            <span class="name">{name}</span>
          {/if}
        </span>
      {/each}
    </LogoGrid>
  </Container>
</Block>

<style>
  div {
    margin-bottom: 3rem;
  }

  .name {
    font-size: 2rem;
    font-weight: var(--bold);
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
      filter: contrast(200%) brightness(0.2) grayscale() invert(1);
    }
  }
</style>
