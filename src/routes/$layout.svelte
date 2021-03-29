<script>
	import '../global.scss';
	import Nav from '$lib/Nav.svelte';
	import Footer from '$lib/Footer.svelte';
	import { onMount } from 'svelte';

	onMount(async () => {
		const smoothscroll = await import('smoothscroll-polyfill');
		smoothscroll.polyfill();
	});
</script>

<Nav />

<main>
	<slot />
</main>
<Footer />
