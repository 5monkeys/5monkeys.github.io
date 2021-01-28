<script>
  /*
    Sets the "real vh", 1/100th of the current viewport height.
    including various bars on phones.

    The value is set using a custom property `--vh` on <html>.
    It makes sense to use the regular 100vh as a fallback, since
    there's no way to transpile this --vh value in a good way.
*/
  import { onMount } from 'svelte';

  const getWindowHeight = () => {
    const vh = window.innerHeight;
    return `${vh}px`;
  };

  const setWindowHeight = (val) => {
    document.documentElement.style.setProperty('--full-vh', val);
  };

  let timer;

  const debounce = (f, wait = 300) => {
    clearTimeout(timer);
    timer = setTimeout(() => {
      f();
    }, wait);
  };

  const handler = () => {
    debounce(() => setWindowHeight(getWindowHeight()));
  };

  onMount(handler);
</script>

<svelte:window on:resize={handler} />
