<script>
  import Link from '../../components/Link.svelte';
  import { fade } from 'svelte/transition';
  import Container from '../../components/Container.svelte';
  import SvgIcon from '../../components/SvgIcon.svelte';

  import MonkeyLogo from '../../brands/5m.svg';

  let focusedOffice = undefined;

  const handleMouseEnter = (v) => {
    focusedOffice = v;
  };
</script>

<div class="root">
  <div class="offices">
    <Container fullHeight center>
      <div class="inner">
        <p class="office" on:mouseenter={() => handleMouseEnter('stockholm')}>
          <strong>Stockholm office. </strong><br />
          <Link href="https://goo.gl/maps/rK183Qy6hftXA29B6">
            Götgatan 36, 4:th floor<br />
            Slussen, Stockholm
          </Link>
          <br />

          <Link href="tel:+46850006653">+46-8-5000 66 53</Link>
        </p>

        <p class="office" on:mouseenter={() => handleMouseEnter('gothenburg')}>
          <strong>Gothenburg office.</strong><br />
          <Link href="https://goo.gl/maps/oNyv3WhEehduf7qz8">
            Viktor Rydbergsgatan 14<br />
            Götaplatsen, Göteborg<br />
          </Link>
          <Link href="tel:+46317674000">+46-31-76 74 000</Link>
        </p>

        <p on:mouseenter={() => handleMouseEnter()}>
          <strong>Get in touch.</strong><br />
          <Link href="mailto:hello@5monkeys.se">hello@5monkeys.se</Link><br />
        </p>
      </div>
    </Container>
  </div>
  <div class="preview">
    {#if focusedOffice === 'stockholm'}
      <img
        class="office-image"
        src={'/img/5m-stockholm-office.jpg'}
        in:fade
        out:fade
        alt="Stockholm office"
      />
    {:else if focusedOffice === 'gothenburg'}
      <img
        class="office-image"
        src={'/img/5m-gothenburg-office.jpg'}
        in:fade
        out:fade
        alt="Gothenburg office"
      />
    {/if}

    <SvgIcon icon={MonkeyLogo} />
  </div>
</div>

<style>
  .root {
    display: flex;
    font-size: 2rem;
    align-items: center;

    @media (max-width: 900px) {
      flex-direction: column;
      font-size: 1.5rem;
    }
  }

  .preview {
    background: var(--primary);
    position: relative;
    height: 100vh;
    width: 100vh;

    @media (max-width: 900px) {
      display: none;
    }

    & > :global(svg) {
      position: absolute;
      bottom: var(--sideMargin);
      right: var(--sideMargin);
      width: 50%;
      height: auto;
    }
  }

  .inner {
    & > :global(*) {
      padding: 30px 20px 0 20px;
    }
  }

  .offices {
    display: flex;
    align-items: center;
    width: 33%;
    min-width: 480px;
    flex-grow: 1;

    @media (max-width: 900px) {
      min-width: unset;
      width: 100%;
    }
  }

  .office-image {
    position: absolute;
    top: 0;
    left: 0;
    object-fit: cover;
    width: 100%;
    height: 100%;
  }
</style>
