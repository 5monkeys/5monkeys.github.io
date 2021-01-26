// const cssFuncs = {
//     spacing: (...multipliers) =>
//       multipliers.reduce((aggr, m) => [...aggr, `${m * 8}px`], []).join(' '),
//     negative: val => `calc(${val} * -1)`,
//   };

module.exports = {
  plugins: {
    'postcss-preset-env': {
      stage: 3,
      features: {
        // 'custom-properties': {
        //   importFrom: './src/css/global.css',
        // }, // absolutely needed
        'custom-media-queries': true, // needed
        'custom-media': true, // needed
        'media-query-ranges': true, // nice to have
      },
      // preserve: true,
    },
    //   'postcss-functions': { functions: cssFuncs },
    //   'postcss-calc': { preserve: false, warnWhenCannotResolve: false },
    'postcss-import': {},
    'postcss-nested': {},
    cssnano: {},
  },
};
