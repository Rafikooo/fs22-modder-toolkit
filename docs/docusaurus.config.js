module.exports = {
  title: 'FS22 Runtime API',
  tagline: 'Interactive API documentation for Farming Simulator 22 modding',
  url: 'https://rafikooo.github.io',
  baseUrl: '/fs22-modder-toolkit/',
  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',

  organizationName: 'rafikooo',
  projectName: 'fs22-modder-toolkit',

  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          path: 'content',
          routeBasePath: '/',
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl: undefined,
        },
        blog: false,
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],

  themes: [
    [
      require.resolve('@easyops-cn/docusaurus-search-local'),
      {
        hashed: true,
        language: ['en'],
        highlightSearchTermsOnTargetPage: true,
        explicitSearchResultPath: true,
        indexBlog: false,
        docsRouteBasePath: '/',
      },
    ],
  ],

  themeConfig: {
    navbar: {
      title: 'FS22 Runtime API',
      items: [
        {
          type: 'doc',
          docId: 'index',
          position: 'left',
          label: 'Docs',
        },
      ],
    },
    footer: {
      style: 'dark',
      copyright: `Generated from FS22 runtime introspection. Farming Simulator is a trademark of GIANTS Software GmbH.`,
    },
    prism: {
      theme: require('prism-react-renderer/themes/github'),
      darkTheme: require('prism-react-renderer/themes/dracula'),
      additionalLanguages: ['lua'],
    },
  },
};
