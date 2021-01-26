<script>
  export let href;
</script>

<a {href}><slot /></a>

<style>
  a {
    color: black;
    text-decoration: none;
  }
  a:visited {
    color: black;
  }
  a:focus,
  a:active,
  a:hover {
    text-decoration: underline;
  }
</style>
