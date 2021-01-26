<script>
  export let id;
</script>

<span {id}>
  <slot />
</span>

<style>
  span {
    visibility: hidden;
    position: absolute;
  }
</style>
