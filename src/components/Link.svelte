<script>
  export let href;
  export let target;
</script>

<a {href} {target}>
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
