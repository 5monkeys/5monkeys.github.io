<script>
  import Hamburger from './Hamburger.svelte';
  import MenuItem from './MenuItem.svelte';
  import { fly } from 'svelte/transition';
  let open = false;

  const handle = () => {
    open = !open;
  };
</script>

<nav>
  <div class="desktop" class:open>
    <MenuItem href="#about">About</MenuItem>
    <MenuItem href="#clients">Clients</MenuItem>
    <MenuItem href="#careers">Careers</MenuItem>
    <MenuItem href="#contact">Contact</MenuItem>
  </div>

  {#if open}
    <div class="mobile" transition:fly={{ x: 300, duration: 600 }} on:click={handle}>
      <MenuItem href="#about">About</MenuItem>
      <MenuItem href="#clients">Clients</MenuItem>
      <MenuItem href="#careers">Careers</MenuItem>
      <MenuItem href="#contact">Contact</MenuItem>
    </div>
  {/if}

  <Hamburger on:click={handle} {open} />
</nav>

<style>
  .desktop {
    display: flex;
    @media (max-width: 900px) {
      display: none;
    }
  }
  nav {
    position: fixed;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    top: 0;
    left: 0;
    width: 100%;
    padding: 1rem;
    z-index: 300;
  }
  .mobile {
    display: none;
    @media (max-width: 900px) {
      position: absolute;
      display: flex;
      flex-direction: column;
      align-items: flex-end;
      padding-top: 80px;
      padding-right: 1rem;
      top: 0;
      right: 0;
    }
  }
</style>
