<script>
  export let fullHeight = false;
  export let variant = 'normal';
  export let padding = 'normal';
  export let relative = false;
  export let center = false;
</script>

<section
  class="root"
  class:paddingNormal={padding === 'normal'}
  class:fullHeight
  class:article={variant === 'article'}
  class:relative
  class:center
>
  <slot />
</section>

<style>
  .root {
    max-width: var(--max-width);
    width: 100%;
    margin: 0 auto;
  }

  .center {
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .relative {
    position: relative;
  }

  .fullHeight {
    min-height: 100vh;
  }
  .article {
    max-width: var(--max-width--article);
    @media (max-width: 900px) {
      max-width: unset;
    }
  }

  .paddingNormal {
    padding: 0 var(--sideMargin);
  }
</style>
