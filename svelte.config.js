const sveltePreprocess = require('svelte-preprocess');
const postcss = require('./postcss.config');

const createPreprocessors = ({ sourceMap }) => [
  sveltePreprocess({
    sourceMap,
    minimize: true,
    defaults: {
      style: 'postcss',
    },
    postcss,
  }),
  // ...processors
];

module.exports = {
  createPreprocessors,
  // Options for `svelte-check` and the VS Code extension
  preprocess: createPreprocessors({ sourceMap: true }),
};
