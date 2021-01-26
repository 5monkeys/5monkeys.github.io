<script>
  import Link from '../../components/Link';
  import { fade } from 'svelte/transition';

  let focusedOffice = undefined;

  const handleMouseEnter = (v) => {
    focusedOffice = v;
  };
</script>

<div class="root">
  <div class="square offices">
    <div class="inner">
      <p class="office" on:mouseenter={() => handleMouseEnter('stockholm')}>
        <strong>Stockholm office. </strong><br />
        <Link href="https://goo.gl/maps/rK183Qy6hftXA29B6" target="_blank">
          Repslagargatan 17 A (4th floor)<br />
          118 46 Stockholm
        </Link>
        <br />

        <Link href="tel:+468500066">Phone: +46 (0)8 500 066</Link>
      </p>

      <p class="office" on:mouseenter={() => handleMouseEnter('gothenburg')}>
        <strong>Gothenburg office.</strong><br />
        <Link href="https://goo.gl/maps/oNyv3WhEehduf7qz8" target="_blank">
          Viktor Rydbergsgatan 14<br />
          Götaplatsen, Göteborg<br />
        </Link>
        <Link href="tel:+463176740000">Phone: +46-31-76 74 0000</Link>
      </p>

      <p on:mouseenter={() => handleMouseEnter()}>
        <strong>Get in touch.</strong><br />
        <Link href="mailto:info@5monkeys.se">info@5monkeys.se</Link><br />
        <Link href="mailto:jobb@5monkeys.se">jobb@5monkeys.se</Link>
      </p>
    </div>
  </div>
  <div class="square preview">
    {#if focusedOffice === 'stockholm'}
      <img
        class="office-image"
        src={'https://www.travelmag.com/wp-content/uploads/2019/10/Gothenburg.jpg'}
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
    <div class="inner highlight">
      <img
        class="watermark"
        alt="5 monkeys logo with text"
        src="/img/logo.svg"
      />
    </div>
  </div>
</div>

<style>
  .root {
    display: flex;
    font-size: 1.5rem;

    @media (max-width: 900px) {
      flex-direction: column;
    }
  }

  .square {
    position: relative;
    width: 50%;
    @media (max-width: 900px) {
      width: 100%;
    }
  }

  .square:before {
    display: block;
    content: '';
    width: 100%;
    padding-top: 100%;
  }

  .square > .inner {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    @media (max-width: 900px) {
      position: relative;
    }
  }

  .inner {
    & > :global(*) {
      padding: 20px;
    }
  }

  .offices {
    display: flex;
  }

  .office-image {
    position: absolute;
    top: 0;
    left: 0;
    object-fit: cover;
    width: 100%;
    height: 100%;
  }

  .preview {
    background: var(--primary);
  }

  .watermark {
    position: absolute;
    bottom: var(--sideMargin);
    right: var(--sideMargin);
    width: 60%;
  }
</style>
