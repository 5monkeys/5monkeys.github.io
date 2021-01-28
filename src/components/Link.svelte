<script>
  export let href;
</script>

<a {href} target="_blank">
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
