<script>
  import Nav from '../components/Nav';
  import Footer from '../blocks/Footer';
  export let segment;
</script>

<Nav {segment} />

<main>
  <slot />
</main>
<Footer />

<style>
</style>
