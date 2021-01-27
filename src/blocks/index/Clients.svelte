<script>
  import Center from '../../components/Center.svelte';
  import Container from '../../components/Container.svelte';
  import Brand from './Brand.svelte';

  const brands = [
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
    {
      href: 'https://ginatricot.com',
      logo: '/img/brands/ginatricot.svg',
      name: 'Gina Tricot',
      color: '#efefef',
    },
  ];
</script>

<Container variant="full" center fullHeight>
  <div class="wrapper">
    <h2>Some of our clients</h2>
    <div class="root">
      {#each brands as brand}
        <Brand background={brand.color} href={brand.href}>
          <img alt={brand.name} src={brand.logo} />
        </Brand>
      {/each}
      <div class="plug">
        <div>
          <span id="WANT">Want to be part of the selection?</span>
          <a class="cta" href="#contact"><strong>get in touch!</strong></a>
        </div>
      </div>
    </div>
  </div>
</Container>

<style>
  .wrapper {
    width: 100%;
  }
  .root {
    display: grid;
    grid-gap: 2vw;
    padding: 2vw 0;
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
    display: block;
    color: black;
  }
</style>
