<script>
  export let background = undefined;
  export let padding = 'none';
</script>

<div class={background && background} class:padding={padding == 'normal'}>
  <slot />
</div>

<style>
  .padding {
    padding: 1rem 0;
  }

  .black {
    background-color: var(--background-dark);
    color: var(--text-dark);
  }
  .primary {
    background-color: var(--primary);
    color: var(--text-light);
  }
  .secondary {
    background-color: var(--secondary);
    color: var(--text-dark);
  }

  .tertiary {
    background-color: var(--tertiary);
    color: var(--text-dark);
  }

  .monkey {
    background-color: white;
    background-image: url('/img/monkey-yellow.svg');
    background-position: -1% 20%;
    background-size: 240%;
    background-repeat: no-repeat;
    background-attachment: fixed;

    @media (prefers-color-scheme: dark) {
      background-color: black;
      background-image: unset;
      color: var(--primary);
      filter: grayscale(100%);
    }
  }
</style>
