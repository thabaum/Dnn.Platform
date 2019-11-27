'use strict';
define(['jquery',
    'main/config'
],
    $('#siteTitle').keyup(updateTitleCount);
    $('#siteTitle').keydown(updateTitleCount);
    $('#siteDescription').keyup(updateDescriptionCount);
    $('#siteDescription').keydown(updateDescriptionCount);
    $('#siteKeyWords').keyup(updateKeyWordsCount);
    $('#siteKeyWords').keydown(updateKeyWordsCount);

    function updateTitleCount() {
        var chars = $(this).val().length;
        if (chars < 78) {
            document.getElementById("siteTitleCount").style.color = 'green';
            document.getElementById("siteTitleCount").style.fontWeight = 'bold';
            $('#siteTitleCount').text(chars);
        }
        else {
            document.getElementById("siteTitleCount").style.color = 'red';
            document.getElementById("siteTitleCount").style.fontWeight = 'bolder';
            $('#siteTitleCount').text(chars);
        }
    }
    function updateDescriptionCount() {
        var chars = $(this).val().length;
        if (chars < 120) {
            document.getElementById("siteDescriptionCount").style.color = 'blue';
            document.getElementById("siteDescriptionCount").style.fontWeight = 'bold';
            $('#siteDescriptionCount').text(chars);
        }
        else if (chars < 320) {
            document.getElementById("siteDescriptionCount").style.color = 'green';
            document.getElementById("siteDescriptionCount").style.fontWeight = 'bold';
            $('#siteDescriptionCount').text(chars);
        }
        else {
            document.getElementById("siteDescriptionCount").style.color = 'red';
            document.getElementById("siteDescriptionCount).style.fontWeight = 'bolder';
            $('#siteDescriptionCount').text(chars);
        }
    }
    function updateKeyWordsCount() {
        var chars = $(this).val().length;
        if (chars < 68) {
            document.getElementById("siteKeyWordsCount").style.color = 'green';
            document.getElementById("siteKeyWordsCount").style.fontWeight = 'bold';
            $('#sitekeyWordsCount').text(chars);
        }
        else {
            document.getElementById("siteKeyWordsCount").style.color = 'red';
            document.getElementById("siteKeyWordsCount").style.fontWeight = 'bolder';
            $('#siteKeyWordsCount').text(chars);
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


