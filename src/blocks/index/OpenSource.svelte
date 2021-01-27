<script>
  import Article from '../../components/Article.svelte';
  import Block from '../../components/Block.svelte';
  import Container from '../../components/Container.svelte';
  import LogoGrid from '../../components/LogoGrid.svelte';

  const open_source = [
    { img: '/img/brands/Swift_logo_with_text.svg', name: 'Swift' },
    { img: '/img/brands/Python_logo_and_wordmark.svg', name: 'Python' },
    { img: '/img/brands/Django_logo.svg', name: 'Django' },
  ];
</script>

<Block background="secondary">
  <Container fullHeight center>
    <div>
      <Article>
        <strong>We contribute to open source projects.</strong> Sed finibus ante
        ut tortor lacinia, et convallis ante hendrerit. Curabitur cursus convallis
        felis, vel efficitur sem iaculis vel. Maecenas ac purus porta sem vulputate
        hendrerit eu sit amet nisi.
      </Article>
    </div>
    <LogoGrid>
      {#each open_source as { img, name }}
        <span class="tech">
          <img src={img} alt={name} />
        </span>
      {/each}
    </LogoGrid>
  </Container>
</Block>

<style>
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
      filter: contrast(200%) brightness(0.2) grayscale() invert(1);
    }
  }
</style>
