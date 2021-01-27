// const cssFuncs = {
//     spacing: (...multipliers) =>
//       multipliers.reduce((aggr, m) => [...aggr, `${m * 8}px`], []).join(' '),
//     negative: val => `calc(${val} * -1)`,
//   };

const postcssImport = require('postcss-import');
const postcssNested = require('postcss-nested');

module.exports = {
  plugins: [postcssImport, postcssNested],
};
