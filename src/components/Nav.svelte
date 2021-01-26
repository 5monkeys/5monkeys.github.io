<script>
  import MenuItem from './MenuItem.svelte';
</script>

<nav>
  <MenuItem href="#about">About us</MenuItem>
  <MenuItem href="#contact">Contact us</MenuItem>
  <MenuItem href="#about">Careers</MenuItem>
</nav>

<style>
  nav {
    top: 0;
    left: 0;
    position: absolute;
    justify-content: flex-end;
    width: 100%;
    padding: 1rem 2rem;
    display: flex;
    z-index: 300;
  }
</style>
