<script>
  import AnchorTarget from '../components/AnchorTarget.svelte';

  import Clients from '../blocks/index/Clients.svelte';
  import OpenSource from '../blocks/index/OpenSource.svelte';
  import Offices from '../blocks/index/Offices';
  import Careers from '../blocks/index/Careers';
  import Tech from '../blocks/index/Tech.svelte';
  import About from '../blocks/index/About.svelte';
  import Header from '../blocks/index/Header.svelte';
</script>

<AnchorTarget id="">
  <Header />
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
