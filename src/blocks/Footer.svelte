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
          >Would you like to know more about our job offers?
          <code> > ssh join.5monkeys.se<span class="cursor">█</span></code>
        </span>
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
  .cursor {
    @keyframes blink {
      0% {
        opacity: 0.7;
      }
      49% {
        opacity: 0.7;
      }
      50% {
        opacity: 0;
      }
      100% {
        opacity: 0;
      }
    }
    animation: blink 0.6s alternate-reverse infinite;
  }
  code {
    display: block;
    font-family: var(--font-mono);
  }

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
