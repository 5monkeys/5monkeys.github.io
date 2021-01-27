<article>
  <slot />
</article>

<style>
  article {
    font-size: 4vmin;
    max-width: 80vw;

    @media (max-width: 900px) {
      max-width: 100%;
      font-size: 4vmin;
    }

    @media (max-width: 600px) {
      font-size: 3vmax;
    }
  }
</style>
