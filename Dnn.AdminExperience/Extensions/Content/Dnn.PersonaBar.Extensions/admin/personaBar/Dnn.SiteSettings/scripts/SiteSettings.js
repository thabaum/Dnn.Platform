'use strict';
define(['jquery',
    'main/config'
],
    $('#siteTitle').keyup(updateTitleCount);
    $('#siteTitle').keydown(updateTitleCount);
    $('#siteDescription').keyup(updateDescriptionCount);
    $('#siteDescription').keydown(updateDescriptionCount);
    $('#siteKeywords').keyup(updateKeywordsCount);
    $('#siteKeywords').keydown(updateKeywordsCount);

    function updateTitleCount() {
        var chars = $(this).val().length;
        if (chars < 78) {
            document.getElementById("titleCount").style.color = 'green';
            document.getElementById("titleCount").style.fontWeight = 'bold';

            $('#titleCount').text(chars);
        }
        else {
            document.getElementById("titleCount").style.color = 'red';
            document.getElementById("titleCount").style.fontWeight = 'bolder';
            $('#titleCount').text(chars);
        }
    }
    function updateDescriptionCount() {
        var chars = $(this).val().length;
        if (chars < 120) {
            document.getElementById("descriptionCount").style.color = 'blue';
            document.getElementById("descriptionCount").style.fontWeight = 'bold';
            $('#descriptionCount').text(chars);
        }
        else if (chars < 320) {
            document.getElementById("descriptionCount").style.color = 'green';
            document.getElementById("descriptionCount").style.fontWeight = 'bold';
            $('#descriptionCount').text(chars);
        }
        else {
            document.getElementById("descriptionCount").style.color = 'red';
            document.getElementById("descriptionCount").style.fontWeight = 'bolder';
            $('#descriptionCount').text(chars);
        }
    }
    function updateKeywordsCount() {
        var chars = $(this).val().length;
        if (chars < 68) {
            document.getElementById("keywordsCount").style.color = 'green';
            document.getElementById("keywordsCount").style.fontWeight = 'bold';
            $('#keywordsCount').text(chars);
        }
        else {
            document.getElementById("keywordsCount").style.color = 'red';
            document.getElementById("keywordsCount").style.fontWeight = 'bolder';
            $('#keywordsCount').text(chars);
        }
    }
    function ($, cf) {
        var utility;
        var config = cf.init();

        return {
            init: function (wrapper, util, params, callback) {
                utility = util;

                window.dnn.initSiteSettings = function initializeSiteSettings() {
                    return {
                        utility: utility,
                        siteRoot: config.siteRoot,
                        settings: params.settings,
                        moduleName: 'SiteSettings',
                        identifier: params.identifier
                    };
                };
                utility.loadBundleScript('modules/dnn.sitesettings/scripts/bundles/site-settings-bundle.js');
                
                if (typeof callback === "function") {
                    callback();
                }
            },

            load: function (params, callback) {
                if (typeof callback === 'function') {
                    callback();
                }
            }
        };
    });


