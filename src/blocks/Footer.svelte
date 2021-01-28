<script>
  import Article from '../components/Article.svelte';
  import Block from '../components/Block.svelte';
  import Container from '../components/Container';
</script>

<footer>
  <Block background="black">
    <Container fullHeight center>
      <div>
        <Article>
          <strong>Get in touch!</strong>
        </Article>
        <a href="mailto:hello@5monkeys.se">hello@5monkeys.se</a><br />
        <span
          >Would you like to know more about our job offers?<br />SSH to
          join.5monkeys.se!</span
        >
      </div>
      <!-- <div>
        <a
          href="https://github.com/5monkeys"
          target="_blank"
          alt="5 monkeys Github page"
          ><SvgIcon icon={GithubSVG} />
        </a>
      </div> -->
    </Container>
  </Block>
</footer>

<style>
  div {
    text-align: center;
  }
  a {
    display: flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    font-size: 4vw;
    line-height: 54px;
    font-weight: var(--bold);
    font-size: border-radius;
    height: 42px;
    margin: 0.5rem;
    color: white;

    @media (max-width: 600px) {
      font-size: 2rem;
    }
  }
  span {
    font-size: 1.25rem;
  }
</style>
