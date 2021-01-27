<div>
  <slot />
</div>

<style>
  div {
    grid-gap: 1vw;
    display: grid;
    grid-auto-rows: 80px;
    grid-template-columns: repeat(4, minmax(50px, 1fr));

    @media (max-width: 600px) {
      grid-template-columns: repeat(3, minmax(50px, 1fr));
    }
    @media (max-width: 360px) {
      grid-template-columns: repeat(2, minmax(50px, 1fr));
    }
  }
</style>
