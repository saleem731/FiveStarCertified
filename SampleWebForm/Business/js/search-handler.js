/*-- START-ADDED 2024-12-19 BY:Auto IE;Shared search functionality handler for business search pages. STEP-1;Build search URL from category, city, and map parameters STEP-2;Update search button href when dropdowns change STEP-3;Handle search button click and redirect to results page CALLS; jQuery selectors, window.location.href CALLED-BY; Business search HTML pages VARIABLES; vcategory, vcity, vmap, vcategoryFileName, vurl --*/

(function($) {
    'use strict';

    /**
     * Builds the search URL from category, city, and map parameters
     * STEP-1;Validate required parameters STEP-2;Convert category to filename format STEP-3;Build URL with query parameters
     * VARIABLES; vcategory, vcity, vmap, vcategoryFileName, vurl
     */
    function buildSearchUrl(vcategory, vcity, vmap) {
        // Validation: ensure all required parameters are present
        if (!vcategory || !vcity || !vmap) {
            return null;
        }

        // Convert category to filename format (spaces to hyphens)
        var vcategoryFileName = vcategory.split(' ').join('-');
        
        // Build URL with query parameters
        var vurl = "./" + vcategoryFileName + '.html?city=' + encodeURIComponent(vcity) + '&map=' + encodeURIComponent(vmap);
        
        return vurl;
    }

    /**
     * Updates the search button href when dropdowns change
     * STEP-1;Get selected category value STEP-2;Get selected city value STEP-3;Get map data attribute STEP-4;Build URL and update button href
     * VARIABLES; vcategory, vcity, vmap, vurl
     */
    function updateSearchButton() {
        var vcategory = $('#Category').val() || $('#Category ').val(); // Handle both with/without space
        var vcity = $('#City').val();
        var vmap = $('#City option:selected').attr('data-map');

        var vurl = buildSearchUrl(vcategory, vcity, vmap);
        
        if (vurl) {
            $('.hpsearch-list li > a').attr('href', vurl);
        }
    }

    /**
     * Handles search button click - opens search results in new tab
     * STEP-1;Prevent default action STEP-2;Get selected values STEP-3;Validate selections STEP-4;Build URL and open in new tab
     * VARIABLES; vcategory, vcity, vmap, vurl
     */
    function handleSearchClick(e) {
        e.preventDefault();
        
        var vcategory = $('#Category').val() || $('#Category ').val(); // Handle both with/without space
        var vcity = $('#City').val();
        var vmap = $('#City option:selected').attr('data-map');

        // Validation: check if both fields are selected
        if (!vcategory || !vcity) {
            alert('Please select both a city and a business category.');
            return false;
        }

        if (!vmap) {
            alert('Invalid city selection. Please try again.');
            return false;
        }

        var vurl = buildSearchUrl(vcategory, vcity, vmap);
        
        if (vurl) {
            window.open(vurl, '_blank');
        } else {
            alert('Unable to build search URL. Please check your selections.');
        }
        
        return false;
    }

    /**
     * Parses URL query parameters and returns an object
     * STEP-1;Get query string from URL STEP-2;Split by & STEP-3;Parse key-value pairs
     * VARIABLES; vqueryString, vparts, vtemp, vparams
     */
    function parseUrlParams() {
        var vqueryString = window.location.search.substr(1);
        var vparams = {};
        
        if (vqueryString) {
            var vparts = vqueryString.split("&");
            for (var i = 0; i < vparts.length; i++) {
                var vtemp = vparts[i].split("=");
                vparams[decodeURIComponent(vtemp[0])] = decodeURIComponent(vtemp[1] || '');
            }
        }
        
        return vparams;
    }

    /**
     * Gets category name from current page filename
     * STEP-1;Get current page filename STEP-2;Remove .html extension STEP-3;Convert hyphens to spaces
     * VARIABLES; vfilename, vcategoryName
     */
    function getCategoryFromFilename() {
        var vfilename = window.location.pathname.split('/').pop().replace('.html', '');
        var vcategoryName = vfilename.split('-').join(' ');
        return vcategoryName;
    }

    /**
     * Initializes dropdowns based on URL parameters
     * STEP-1;Parse URL parameters STEP-2;Set City dropdown STEP-3;Set Category dropdown from filename STEP-4;Trigger change events to update button
     * VARIABLES; vparams, vcity, vcategory, vcategorySet, vcitySet
     */
    function initializeDropdowns() {
        var vparams = parseUrlParams();
        var vcitySet = false;
        var vcategorySet = false;
        
        // Set City dropdown if city parameter exists
        if (vparams.city) {
            var vcity = vparams.city;
            $('#City option').each(function() {
                if ($(this).val() === vcity) {
                    $(this).prop('selected', true);
                    vcitySet = true;
                    return false; // Break the loop
                }
            });
        }
        
        // Set Category dropdown based on current page filename
        var vcategory = getCategoryFromFilename();
        if (vcategory) {
            // Try both Category selectors (with and without space)
            var vcategorySelect = $('#Category');
            if (vcategorySelect.length === 0) {
                vcategorySelect = $('#Category ');
            }
            
            vcategorySelect.find('option').each(function() {
                if ($(this).val() === vcategory) {
                    $(this).prop('selected', true);
                    vcategorySet = true;
                    return false; // Break the loop
                }
            });
        }
        
        // Trigger change events to update search button href
        if (vcitySet) {
            $('#City').trigger('change');
        }
        if (vcategorySet) {
            $('#Category, #Category ').trigger('change');
        }
        
        // Update search button href after setting dropdowns
        updateSearchButton();
    }

    // Initialize when DOM is ready
    $(document).ready(function() {
        // Initialize dropdowns from URL parameters
        initializeDropdowns();
        
        // Update search button href when dropdowns change
        $('#Category, #City, #Category ').change(function() {
            updateSearchButton();
        });

        // Handle search button click
        $('.js-submit').on('click', handleSearchClick);
    });

})(jQuery);

/*-- END-ADDED 2024-12-19 BY:Auto --*/

