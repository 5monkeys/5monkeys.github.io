<script>
  export let href;

  const scrollToId = (e) => {
    if (href.startsWith('#')) {
      e.preventDefault();
      const el = document.querySelector(href);
      window.scrollTo({
        top: el.offsetTop,
        left: 0,
        behavior: 'smooth',
      });
    }
  };
</script>

<a {href} {...$$props} on:click={scrollToId}><span><slot /></span></a>

<style>
  a {
    position: relative;
    font-size: 1rem;
    padding: 4px;
    color: inherit;

    border-radius: 300px; /** An insane value */
    text-decoration: none;
    border: 3px solid transparent;

    &:hover {
      border-color: white;
    }
    &:visited,
    &:active {
      color: black;
    }
  }

  span {
    display: inline-block;
    border-radius: 300px;
    padding: 0.5rem 1rem;
    background: white;

    /* @media (prefers-color-scheme: dark) {
      background: transparent;
      color: black;
    } */
  }
</style>
