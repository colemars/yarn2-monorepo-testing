const path = require('path')

module.exports = {
    webpack: {
        alias: {
            react: path.resolve(__dirname, '../../node_modules/react'),
            'react-dom': path.resolve(__dirname, '../../node_modules/react-dom'),
            'react-router': path.resolve(__dirname, '../../node_modules/react-router'),
            'react-router-dom': path.resolve(__dirname, '../../node_modules/react-router-dom'),
        },
    },
}
