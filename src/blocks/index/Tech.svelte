<script>
  import Article from '../../components/Article.svelte';

  import Container from '../../components/Container.svelte';

  const tech_stack = [
    { img: '/img/brands/Tmux_logo.svg', name: 'tmux' },

    { img: '/img/brands/React-icon.svg', name: 'React' },
    { img: '/img/brands/RabbitMQ_logo.svg', name: 'RabbitMQ' },

    { img: '/img/brands/Kubernetes_logo.svg', name: 'Kubernetes' },
    { img: '/img/brands/docker.svg', name: 'Docker' },
    { img: '/img/brands/haskell-logo.svg', name: 'Haskell' },
    { img: '/img/brands/graphql.svg', name: 'GraphQL' },
    { img: '/img/brands/Apple_iOS_logo.svg', name: 'Apple IOS' },
    { img: '/img/brands/Android_logo_2019.svg', name: 'Android' },
    { img: '/img/brands/gh-actions.svg', name: 'Github Actions' },
    { img: '/img/brands/1180px-Node.js_logo.svg', name: 'NodeJS' },
  ];

  const open_source = [
    { img: '/img/brands/Swift_logo_with_text.svg', name: 'Swift' },
    { img: '/img/brands/Python_logo_and_wordmark.svg', name: 'Python' },
    { img: '/img/brands/Django_logo.svg', name: 'Django' },
  ];
</script>

<Container fullHeight>
  <div class="row">
    <div>
      <Article>
        <strong>We contribute to open source projects.</strong> Sed finibus ante
        ut tortor lacinia, et convallis ante hendrerit. Curabitur cursus convallis
        felis, vel efficitur sem iaculis vel. Maecenas ac purus porta sem vulputate
        hendrerit eu sit amet nisi.
      </Article>
    </div>
    <div class="logo-grid">
      {#each open_source as { img, name }}
        <span class="tech">
          <img src={img} alt={name} />
        </span>
      {/each}
    </div>
  </div>

  <div class="row flipped">
    <div>
      <Article>
        <strong>Our preferred stack.</strong> Sed finibus ante ut tortor lacinia,
        et convallis ante hendrerit. Curabitur cursus convallis felis, vel efficitur
        sem iaculis vel. Maecenas ac purus porta sem vulputate hendrerit eu sit amet
        nisi.
      </Article>
    </div>
    <div class="logo-grid">
      {#each tech_stack as { img, name }}
        <span class="tech">
          <img src={img} alt={name} />
        </span>
      {/each}
    </div>
  </div>
</Container>

<style>
  .logo-grid {
    grid-gap: 1vw;
    display: grid;
    grid-auto-rows: 90px;
    grid-template-columns: repeat(4, minmax(50px, 1fr));

    @media (max-width: 600px) {
      grid-template-columns: repeat(3, minmax(50px, 1fr));
    }
    @media (max-width: 360px) {
      grid-template-columns: repeat(2, minmax(50px, 1fr));
    }
  }

  .tech {
    padding: 1rem;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(241, 241, 241, 50);

    img {
      width: 100%;
      height: 100%;
      object-fit: contain;
    }
  }

  .row {
    display: flex;

    & + & {
      margin-top: 100px;
    }

    & > * {
      width: 50%;
    }

    &.flipped {
      flex-direction: row-reverse;
      > * + * {
        margin-right: 2vw;
      }
      @media (max-width: 900px) {
        flex-direction: column;

        & > * {
          width: 100%;
        }

        & > * + * {
          margin-top: 2rem;
        }
      }

      &:not(.flipped) > * + * {
        margin-left: 2vw;
      }
    }
  }
</style>
