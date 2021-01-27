<script>
  import Block from './Block.svelte';

  export let href;
</script>

<a {href} {...$$props}><span><slot /></span></a>

<style>
  a {
    font-size: 1rem;
    position: relative;
    padding: 4px;
    color: inherit;

    border-radius: 300px; /** An insane value */
    text-decoration: none;
    border: 3px solid transparent;

    &:hover {
      border-color: white;
    }
    &:visited,
    &:active {
      color: black;
    }
  }

  span {
    display: inline-block;
    border-radius: 300px;
    padding: 0.5rem 1rem;
    background: white;

    @media (prefers-color-scheme: dark) {
      background: transparent;
      color: black;
    }
  }
</style>
