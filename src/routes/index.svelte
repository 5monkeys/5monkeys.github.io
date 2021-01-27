<script>
  import { TITLE } from '../../consts';
  import Block from '../components/Block.svelte';
  import Container from '../components/Container.svelte';
  import SvgIcon from '../components/SvgIcon.svelte';
  import AnchorTarget from '../components/AnchorTarget.svelte';

  import Tech from '../blocks/index/Tech.svelte';
  import LogoGarden from '../blocks/index/LogoGarden.svelte';
  import OpenSource from '../blocks/index/OpenSource.svelte';
  import Offices from '../blocks/index/Offices';
  import TechV2 from '../blocks/index/Tech_v2.svelte';

  import ArrowDownSVG from '../icons/arrow_down.svg';
</script>

<svelte:head>
  <title>{TITLE}</title>
  <meta
    name="description"
    content="5 Monkeys Agency: A Digital Agency in Stockholm &amp; Göteborg. We love Django &amp; React! ✌️"
  />
</svelte:head>

<Block background="primary" id="start">
  <Container fullHeight>
    <div class="blowout" />
    <a href="#about" class="scrollButton">
      <SvgIcon icon={ArrowDownSVG} />
    </a>
  </Container>
</Block>

<AnchorTarget id="about" />
<Block background="monkey">
  <Container relative={true}>
    <Container variant="article" fullHeight padding="none" center>
      <article>
        <p>
          <strong>This is how we do it.</strong> For more than a decade, we have
          helped startups and incumbents grow like crazy by using our carefully balanced
          blend of digital strategy, software engineering and open source software.
        </p>
      </article>
    </Container>
    <img class="gasell" alt="DI Gasell" src={'/img/brands/di-gasell.svg'} />
  </Container>
</Block>
<AnchorTarget id="clients" />
<Container center fullHeight><LogoGarden /></Container>

<AnchorTarget id="tech" />
<Tech />

<AnchorTarget id="open-source" />
<OpenSource />

<AnchorTarget id="open-source" />
<TechV2 />

<Block>
  <AnchorTarget id="contact" />
  <Container fullHeight>
    <Offices />
  </Container>
</Block>

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

  .gasell {
    position: absolute;
    height: 80px;
    left: var(--sideMargin);
    bottom: var(--sideMargin);
  }

  article {
    text-align: justify;
  }
</style>
