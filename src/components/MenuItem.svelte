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
    color: var(--text-white);

    border-radius: 300px; /** An insane value */
    text-decoration: none;
    border: 3px solid transparent;

    &:hover {
      border-color: white;
    }
  }

  span {
    display: inline-block;
    border-radius: 300px;
    padding: 0.5rem 1rem;
    background: white;
  }
</style>
