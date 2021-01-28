<script>
  import { TITLE } from '../../consts';
  import Block from '../components/Block.svelte';
  import Container from '../components/Container.svelte';
  import SvgIcon from '../components/SvgIcon.svelte';
  import AnchorTarget from '../components/AnchorTarget.svelte';

  import Clients from '../blocks/index/Clients.svelte';
  import OpenSource from '../blocks/index/OpenSource.svelte';
  import Offices from '../blocks/index/Offices';
  import Careers from '../blocks/index/Careers';
  import Tech from '../blocks/index/Tech.svelte';
  import About from '../blocks/index/About.svelte';

  import ArrowDownSVG from '../icons/arrow_down.svg';
  import ScreenReaderOnly from '../components/ScreenReaderOnly.svelte';
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
        <ScreenReaderOnly>Go to about us</ScreenReaderOnly>
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

<!-- 
<AnchorTarget id="tech">
  <Tech />
</AnchorTarget> -->

<AnchorTarget id="careers">
  <Careers />
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
    width: 90%;
    height: 60%;
    left: 5%;
    top: 20%;
    background-image: url('/img/monkey.svg');
    background-position: center;
    background-size: contain;
  }
</style>
