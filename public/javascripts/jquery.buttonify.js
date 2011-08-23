/*! http://code.google.com/p/buttonify */
/**
 * Copyright 2009 Digital Creations AS.
 * 
 * Licensed under the MIT license.
 * 
 * http://code.google.com/p/buttonify
 * 
 * Option			Description
 * linkClass		The added anchors will have this class
 * forwardClasses	The <input>'s classes will be applied to the <a> if this is set
 * iconFolder		The base URL of where any icons can be found (can be null)
 * transferEvents	List of events that are transfered from the <input> to the <a>
 * transferAttributes 	Array of attributes that should be transferred from the <input> to the <a>
 * 
 * 2009-04-27 Initial version * Vegard Andreas Larsen <vegard [at] prove.no>
 * 2009-05-05 Adds support for transferring attributes * Vegard Andreas Larsen <vegard [at] prove.no>
 */
(function($)
{
	/**
	 * Run Buttonify on the selected elements.
	 * 
	 * Useful if you want to run it only on selected elements (e.g. input[type=submit]).
	 * 
	 * @param object providedOptions The options
	 */
	jQuery.fn.buttonify = function(providedOptions)
	{
	    var opts = jQuery.extend({}, jQuery.buttonify.defaults, providedOptions);
	    
		return jQuery(this).each(function() 
		{
			changeElement(jQuery(this), opts);	
		});		
	};

	/**
	 * Run Buttonify over all button input elements (with some exceptions).
	 * 
	 * @param object providedOptions Options
	 */
	jQuery.buttonify = function(providedOptions)
	{
	    var opts = jQuery.extend({}, jQuery.buttonify.defaults, providedOptions);
	    var selectorClass = '';
	    if (opts.searchClass)
	    {
	        selectorClass += '.' + opts.searchClass;
	    }
	    var selector = 'input[type=submit]' + selectorClass + ',input[type=button]' + selectorClass;
	    
	    jQuery(selector).each(function()
		{
		    if (opts.excludeClass && $button.hasClass(opts.excludeClass))
		    {
		        return;
		    }

			changeElement(jQuery(this), opts);
		});
	};
	
	/**
	 * This function does the actual transformation from an <input> to an <a>
	 * 
	 * @param object $button jQuery object <input>
	 * @param object opts The options
	 */
	function changeElement($button, opts)
	{
	    var type = $button.attr('type');
		var $form = $button.parents('form:first');
	    
	    var $link = jQuery.buttonify.createLink($button.val(), opts, $button);
	    $link.addClass(opts.linkClass);
	    if (opts.forwardClasses) 
		{
			$link.addClass($button.attr('class'));
		}

	    transferEvents($button, $link, opts.transferEvents);
		transferAttributes($button, $link, opts.transferAttributes);
		findIcon($link, $button, opts.iconFolder);
	
	    $button.replaceWith($link);
        if (type == 'submit')
        {
            $link.closest('form').find(':input').keypress(function(e)
            {
                if (e.which == 13)
                {
                    $(this).closest('form').submit();
                }
            });
        }
	    $link.click(function()
	    {
	        this.blur(); // ie thing
	        if (type == 'submit') 
	        {
				// Make sure the submit button's data is posted
				$form.append('<input type="hidden" name="' + $button.attr('name') + '" value="' + $button.val() + '" />');
	            $form.submit();
	        }
	        return false;
	    });
	};
	
	/**
	 * Checks if the button has a class that wants us to look for an icon.
	 */
    function findIcon($link, $button, iconFolder)
	{
	    // try to find an icon in the input's class
	    var regex = /(^|\s)(-icon-)([\-_\w]*)/i;
	    var match = regex.exec($button.attr('class'));
	    if (match != null) 
	    {
	        icon = match[3];
	        $link.children('span').prepend('<img src="' + iconFolder + icon + '.png" alt="icon" />');
	    }
	}
	
	/**
	 * Adds all event handlers in the element specified by 'from'
	 * to the element specified by 'to'.
	 * 
	 * This function will not remove or change the event handlers
	 * in the from element.
	 * 
	 * @param object from Element to copy event handlers from
	 * @param object to Element to add event handlers to
	 * @param object events The events to transfer
	 */
	function transferEvents(from, to, events)
	{
		var $from = jQuery(from);
		var $to = jQuery(to);
		// process any events specified in the HTML
		for (jqEvent in events) 
		{
			htmlEvent = events[jqEvent];
			sCode = $from.attr(htmlEvent);
			if (sCode != undefined) 
			{
				$to.bind(jqEvent, eval(sCode));
			}
		}
		
		// then move on to events from jQuery
		// adapted from http://james.padolsey.com/javascript/debug-jquery-events-with-listhandlers/
		var dEvents = $from.data('events');
		if (dEvents) 
		{
			jQuery.each(dEvents, function(name, handler)
			{
				jQuery.each(handler, function(i, handler)
				{
					if (name in events) 
					{
						$to.bind(name, handler);
					}
				});
			});
		}	
	};
	
	/**
	 * Transfers attributes that have been chosen from the
	 * <input> element to the <a> element.
	 * 
	 * @param object from	The button element
	 * @param object to		The link element
	 * @param object attributes Array of attributes to transfer
	 */
	function transferAttributes(from, to, attributes)
	{
		var $from = jQuery(from);
		var $to = jQuery(to);
		for (var i in attributes)
		{
			sValue = $from.attr(attributes[i]);
			if (sValue != undefined)
			{
				$to.attr(attributes[i], sValue);
			}
		}
	}

	/**
	 * Create the jQuery element that will be used for the styled button.
	 * 
	 * @param string text The button's text
	 */
	jQuery.buttonify.createLink = function(text)
	{
		return jQuery('<a href="#" class="button"><span>' + text + '</span></a>');
	}
	
	/**
	 * Defaults.
	 */
	jQuery.buttonify.defaults = 
	{
	    linkClass: 'normal',
	    forwardClasses: true,
	    iconFolder: '',
	    transferEvents: 
	    {
	        click: 'onclick', 
	        blur: 'onblur', 
	        dblclick: 'ondblclick', 
	        focus: 'onfocus', 
	        mousedown: 'onmousedown', 
	        mousemove: 'onmousemove', 
	        mouseover: 'onmouseover',
	        mouseout: 'onmouseout', 
	        mouseup: 'onmouseup', 
	        keypress: 'onkeypress' 
	//      change: 'onchange',  // doesn't really make sense for buttons, now does it?
	//      keydown: 'onkeydown', 
	//      keyup: 'onkeyup', 
	//      select: 'onselect'
	    },
		transferAttributes:
		[
			"id",	// don't remove this unless you know what you are doing
			"align",
			"alt",
			"disabled",
			"name",
			"value",
			"dir",
			"lang",
			"style",
			"tabindex",
			"title",
			"accesskey",
			"xml:lang"
		]
	};
})(jQuery);