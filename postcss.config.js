// const cssFuncs = {
//     spacing: (...multipliers) =>
//       multipliers.reduce((aggr, m) => [...aggr, `${m * 8}px`], []).join(' '),
//     negative: val => `calc(${val} * -1)`,
//   };

const cssnano = require('cssnano');
const postcssImport = require('postcss-import');
const postcssNested = require('postcss-nested');
// const presetEnv = require('postcss-preset-env');

module.exports = {
  plugins: [postcssImport, postcssNested, cssnano],
};
