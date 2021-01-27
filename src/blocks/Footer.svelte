<script>
  import Block from '../components/Block.svelte';
  import Container from '../components/Container';

  const contact_points = [
    {
      name: 'github',
      url: 'https://github.com/5monkeys',
    },
  ];
</script>

<footer>
  <Block background="black" padding="none">
    <Container fullHeight>
      <div>
        {#each contact_points as contact}
          <span>{contact.name.substring(0, 1)}</span>
        {/each}
      </div>
    </Container>
  </Block>
</footer>

<style>
  span {
    display: flex;
    align-itens: center;
    justify-content: center;
    border: 1px solid white;
    line-height: 54px;
    border-radius: 100%;
    width: 54px;
    height: 54px;
  }
</style>
