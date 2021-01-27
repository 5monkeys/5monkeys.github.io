<script>
  import MenuItem from './MenuItem.svelte';
</script>

<nav>
  <MenuItem href="#about">About</MenuItem>
  <MenuItem href="#clients">Clients</MenuItem>
  <MenuItem href="#careers">Careers</MenuItem>
  <MenuItem href="#contact">Contact</MenuItem>
</nav>

<style>
  nav {
    top: 0;
    left: 0;
    position: fixed;
    justify-content: flex-end;
    width: 100%;
    padding: 1rem 2rem;
    display: flex;
    z-index: 300;
  }
</style>
