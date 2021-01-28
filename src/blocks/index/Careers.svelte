<script>
  import Article from '../../components/Article.svelte';
  import Block from '../../components/Block.svelte';
  import Container from '../../components/Container.svelte';
  import TerminalText from '../../components/TerminalText.svelte';
</script>

<Block background="tertiary">
  <Container fullHeight center>
    <Article>
      <p>
        <strong>Join us!</strong> We're always looking for talented colleagues who
        share our love for open source software and our relentless focus on high-quality
        engineering. Do you wish you had colleagues who cared deeply about open source
        software? Apply now!
      </p>

      <p>
        Apply by connecting to <TerminalText>join.5monkeys.se</TerminalText> via
        SSH and follow the instructions. The application process takes less than
        a minute and is entirely text-based. We know you share our love for the terminal!
      </p>
    </Article>
  </Container>
</Block>
