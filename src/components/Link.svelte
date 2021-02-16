<script>
  export let href;
</script>

<a {href} target="_blank" rel="noopener">
  <slot />
</a>

<style>
  a {
    color: inherit;
    text-decoration: none;
  }
  a:visited {
    color: inherit;
  }
  a:focus,
  a:active,
  a:hover {
    text-decoration: underline;
  }
</style>
