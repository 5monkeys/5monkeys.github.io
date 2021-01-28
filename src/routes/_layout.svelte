<script>
  import smoothscroll from 'smoothscroll-polyfill';

  import Nav from '../components/Nav';
  import Footer from '../blocks/Footer';

  export let segment;

  const setup = () => {
    smoothscroll.polyfill();
  };
</script>

<Nav {segment} />

<main>
  <slot />
</main>
<Footer />

<svelte:window on:load={setup} />
