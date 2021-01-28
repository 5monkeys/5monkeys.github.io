<script>
  import Nav from '../components/Nav';
  import Footer from '../blocks/Footer';
  import VhSetter from '../components/VhSetter.svelte';
  export let segment;
</script>

<Nav {segment} />

<main>
  <slot />
</main>
<VhSetter />
<Footer />
