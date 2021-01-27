<script>
  import Article from '../components/Article.svelte';
  import Block from '../components/Block.svelte';
  import Container from '../components/Container';
  import SvgIcon from '../components/SvgIcon.svelte';
  import GithubSVG from '../icons/github.svg';
</script>

<footer>
  <Block background="black" padding="none">
    <Container fullHeight center>
      <Article><strong>Get in touch!</strong></Article>
      <div>
        <a
          href="https://github.com/5monkeys"
          target="_blank"
          alt="5 monkeys Github page"><SvgIcon icon={GithubSVG} /></a
        >
      </div>
    </Container>
  </Block>
</footer>

<style>
  div {
    display: flex;
    align-items: center;
    justify-content: center;
  }
  a {
    display: flex;
    align-items: center;
    justify-content: center;
    line-height: 54px;
    border-radius: 100%;
    height: 42px;
    margin: 0.5rem;
  }
</style>
