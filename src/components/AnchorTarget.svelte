<script>
	export let id;
</script>

<!--<script>
  export let id;

  import { onMount } from 'svelte';

  let container;
  let intersecting = false;

  onMount(() => {
    if (typeof IntersectionObserver !== 'undefined') {
      const rootMargin = `0px`;

      const observer = new IntersectionObserver(
        (entries) => {
          intersecting = entries[0].isIntersecting;
          if (intersecting) {
            window.location.hash = id;
            // observer.unobserve(container);
          } else {
            intersecting = false;
          }
        },
        {
          rootMargin,
          threshold: 0.75,
        }
      );

      observer.observe(container);
      return () => observer.unobserve(container);
    }
  });
</script>-->

<!-- <div bind:this={container}> -->
<span {id} />
<slot />

<!-- </div> -->
<style lang="scss">
	span {
		visibility: hidden;
		position: absolute;
	}
</style>
