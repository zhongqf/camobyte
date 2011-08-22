/* jQuery */
jQuery.ready(function() {
  jQuery('button').bind({
    mousedown: function() {
      jQuery(this).addClass('mousedown');
    },
    blur: function() {
      jQuery(this).removeClass('mousedown');
    },
    mouseup: function() {
      jQuery(this).removeClass('mousedown');
    }
  });
});