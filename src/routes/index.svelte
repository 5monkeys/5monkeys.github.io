<script>
  import { TITLE } from '../../consts';
  import Block from '../components/Block.svelte';
  import Container from '../components/Container.svelte';
  import SvgIcon from '../components/SvgIcon.svelte';
  import AnchorTarget from '../components/AnchorTarget.svelte';

  import Clients from '../blocks/index/Clients.svelte';
  import OpenSource from '../blocks/index/OpenSource.svelte';
  import Offices from '../blocks/index/Offices';
  import Tech from '../blocks/index/Tech.svelte';
  import About from '../blocks/index/About.svelte';

  import ArrowDownSVG from '../icons/arrow_down.svg';
</script>

<svelte:head>
  <title>{TITLE}</title>
  <meta
    name="description"
    content="5 Monkeys Agency: A Digital Agency in Stockholm &amp; Göteborg. We love Django &amp; React! ✌️"
  />
</svelte:head>
<AnchorTarget id="">
  <Block background="primary">
    <Container fullHeight>
      <div class="blowout" />
      <a href="#about" class="scrollButton">
        <SvgIcon icon={ArrowDownSVG} />
      </a>
    </Container>
  </Block>
</AnchorTarget>

<AnchorTarget id="about">
  <About />
</AnchorTarget>

<AnchorTarget id="clients">
  <Clients />
</AnchorTarget>

<AnchorTarget id="open-source">
  <OpenSource />
</AnchorTarget>

<AnchorTarget id="tech">
  <Tech />
</AnchorTarget>

<AnchorTarget id="contact" />
<Offices />

<style>
  .scrollButton {
    position: absolute;
    bottom: var(--sideMargin);
    left: 50%;
    transform: translateX(-50%);
    color: white;
    width: 54px;
    height: 54px;
  }
  .blowout {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    object-fit: contain;
    background-image: url('/img/monkey.svg');
    background-position: center;
    background-size: 60%;
  }
</style>
