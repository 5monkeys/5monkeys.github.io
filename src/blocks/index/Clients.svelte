<script>
  import Article from '../../components/Article.svelte';
  import Container from '../../components/Container.svelte';
  import SvgIcon from '../../components/SvgIcon.svelte';
  import Brand from './Brand.svelte';
  import ArrowForwardSVG from '../../icons/arrow_forward.svg';

  const brands = [
    {
      href: 'https://ginatricot.com',
      logo: '/img/brands/ginatricot.svg',
      name: 'Gina Tricot',
      color: '#e0c4b6',
    },
    {
      href: 'https://dn.se',
      logo: '/img/brands/dn.svg',
      name: 'DN',
      color: '#f00',
    },
    {
      href: 'https://eqtventures.com',
      logo: '/img/brands/eqt.svg',
      name: 'EQT',
      color: '#240447',
    },
    {
      href: 'https://bolist.se',
      logo: '/img/brands/bolist.svg',
      name: 'Bolist',
      color: '#F50',
    },
    {
      href: 'https://mojang.com',
      logo: '/img/brands/mojang.svg',
      name: 'Mojang',
      color: '#000',
    },
    {
      href: 'https://pressbyran.se',
      logo: '/img/brands/pressbyran.svg',
      name: 'Pressbyrån',
      color: '#EDC607',
    },
    {
      href: 'https://reasonstudios.com/',
      logo: '/img/brands/reasonstudios.svg',
      name: 'Reason studios',
      color: '#F0E8DA',
    },
    {
      href: 'https://sportamore.se/',
      logo: '/img/brands/sportamore.svg',
      name: 'Sportamore',
      color: '#c4c4c4',
    },
  ].sort(() => (Math.random() > 0.5 ? 1 : -1));
</script>

<Container padding="none" variant="full" center fullHeight>
  <div class="wrapper">
    <Article><strong>Some of our clients.</strong></Article>
    <div class="root">
      {#each brands as brand}
        <Brand background={brand.color} href={brand.href}>
          <img alt={brand.name} src={brand.logo} />
        </Brand>
      {/each}
      <div class="plug">
        <div>
          <span class="heavy">Want to join the club?</span>
          <a class="cta" href="#contact">
            <span>Get in touch!</span><SvgIcon icon={ArrowForwardSVG} />
          </a>
        </div>
      </div>
    </div>
  </div>
</Container>

<style>
  .heavy {
    display: block;
    font-weight: var(--bold);
    font-size: 1.25rem;
    margin-bottom: 1.25em;
    display: block;
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

  .root :global(:first-child) {
    @media (min-width: 900px) {
      grid-column-start: 1;
      grid-column-end: 3;
      grid-row-start: 1;
      grid-row-end: 3;
    }
  }

  .plug {
    padding: 1rem;
    border: 0.5rem dashed var(--primary);
    display: flex;
    align-items: center;
    justify-content: center;

    @media (max-width: 600px) {
      grid-column: 1/-1;
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
