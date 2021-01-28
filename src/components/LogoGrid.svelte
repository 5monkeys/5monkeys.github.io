<div>
  <slot />
</div>

<style>
  div {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: center;
    width: 80%;
    margin: 0 auto;

    & > :global(*) {
      height: 90px;
      width: 140px;
    }

    @media (max-width: 600px) {
      display: none;
    }
  }
  /* div {
    grid-gap: 1vw;
    display: grid;
    grid-auto-rows: 80px;
    grid-template-columns: repeat(3, minmax(50px, 1fr));

    @media (max-width: 600px) {
      grid-template-columns: repeat(3, minmax(50px, 1fr));
    }

    @media (max-width: 360px) {
      grid-template-columns: repeat(2, minmax(50px, 1fr));
    }
  } */
</style>
