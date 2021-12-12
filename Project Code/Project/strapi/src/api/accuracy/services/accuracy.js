'use strict';

/**
 * accuracy service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::accuracy.accuracy');
