<script>
	import AnchorTarget from '$components/AnchorTarget.svelte';

	import Clients from '$blocks/Clients.svelte';
	import OpenSource from '$blocks/OpenSource.svelte';
	import Offices from '$blocks/Offices.svelte';
	import Careers from '$blocks/Careers.svelte';
	import About from '$blocks/About.svelte';
	import Header from '$blocks/Header.svelte';
</script>

<Header />

<AnchorTarget id="about">
	<About />
</AnchorTarget>

<AnchorTarget id="clients">
	<Clients />
</AnchorTarget>

<AnchorTarget id="open-source">
	<OpenSource />
</AnchorTarget>

<AnchorTarget id="careers">
	<Careers />
</AnchorTarget>

<AnchorTarget id="contact" />
<Offices />
