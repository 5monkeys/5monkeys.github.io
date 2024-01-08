/*eslint-env node */
const sveltePreprocess = require('svelte-preprocess');
const adapter_static = require('@sveltejs/adapter-static');
const { resolve } = require('path');
const pkg = require('./package.json');

/** @type {import('@sveltejs/kit').Config} */
module.exports = {
	// Consult https://github.com/sveltejs/svelte-preprocess
	// for more information about preprocessors
	preprocess: sveltePreprocess(),
	kit: {
		// By default, `npm run build` will create a standard Node app.
		// You can create optimized builds for different platforms by
		// specifying a different adapter
		adapter: adapter_static(),

		// hydrate the <div id="svelte"> element in src/app.html
		target: 'body',
		vite: {
			ssr: {
				noExternal: Object.keys(pkg.dependencies || {})
			},
			resolve: {
				alias: {
					$components: resolve(__dirname, './src/components'),
					$blocks: resolve(__dirname, './src/blocks'),
					$icons: resolve(__dirname, './src/icons'),
					$brands: resolve(__dirname, './src/brands')
				}
			}
		}
	}
};
