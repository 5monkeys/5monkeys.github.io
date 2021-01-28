<script>
  import Block from '../../components/Block.svelte';
  import Container from '../../components/Container.svelte';
  import SvgIcon from '../../components/SvgIcon.svelte';
  import ArrowDownSVG from '../../icons/arrow_down.svg';
  import ScreenReaderOnly from '../../components/ScreenReaderOnly.svelte';
</script>

<Block background="primary">
  <Container fullHeight>
    <div class="blowout" />
    <a href="#about" class="scrollButton">
      <SvgIcon icon={ArrowDownSVG} />
      <ScreenReaderOnly>Go to about us</ScreenReaderOnly>
    </a>
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
    width: 90%;
    height: 60%;
    left: 5%;
    top: 20%;
    background-image: url('/img/monkey.svg');
    background-position: center;
    background-size: contain;
  }
</style>
