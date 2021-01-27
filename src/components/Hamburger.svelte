<script>
  import { createEventDispatcher } from 'svelte';

  export let open = true;

  const dispatch = createEventDispatcher();

  function toggle() {
    dispatch('click', true);
  }
</script>

<button on:click={toggle} class:open>
  <span />
  <span />
  <span />
</button>

<style>
  button {
    color: white;
    position: relative;
    width: 40px;
    height: 40px;

    @media (min-width: 900px) {
      display: none;
    }
  }

  span {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 80%;
    height: 4px;
    background-color: currentColor;
    border-radius: 4px;
    transition: transform 0.5s cubic-bezier(0.77, 0.2, 0.05, 1);
    box-shadow: 1px 1px 1px 1px rgba(0, 0, 0, 0.05);

    &:first-child {
      transform: translate(-50%, -11px);
      .open & {
        transform: translate(-50%, -50%) rotate(-45deg);
      }
    }

    &:nth-child(2) {
      .open & {
        transform: translate(-50%, -50%) rotate(-45deg);
      }
    }

    &:last-child {
      transform: translate(-50%, 7px);
      .open & {
        transform: translate(-50%, -50%) rotate(45deg);
      }
    }
  }
</style>
