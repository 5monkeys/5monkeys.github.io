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

    :global(p + p) {
      margin-top: 2rem;
    }

    :global(a) {
      text-decoration: underline;
      text-underline-offset: 0.06em;
      text-decoration-thickness: 0.06em;

      &:hover {
        text-decoration-thickness: 0.06em;
      }
    }
  }
</style>
