// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require bootstrap-jasny
//= require bootbox
//= require underscore
//= require Chart.bundle
//= require chartkick
//= require select2
//= require gmaps/google
//= require daterangepicker
//= require bootstrap-datepicker
//= require jquery.slimscroll
//= require app



$.rails.allowAction = function(element) {
  var message = element.attr('data-confirm');
  if (!message) { return true; }

  var opts = {
    title: "Confirmação",
    message: message,
    buttons: {
        confirm: {
            label: 'Sim',
            className: 'btn-success'
        },
        cancel: {
            label: 'Não',
            className: 'btn-danger'
        }
    },
    callback: function(result) {
      if (result) {
        element.removeAttr('data-confirm');
        element.trigger('click.rails')
      }
    }
  };

  bootbox.confirm(opts);

  return false;
}

$(document).ready(function() { $("#by_name_finances").select2({
  placeholder: "Pesquisar pelo nome de usuário...",
  allowClear: true,
  theme: "bootstrap"
  });
});


/* SPIN */
$(document).ready(function() {
  // Global ajax cursor change
  $(document)
    .ajaxStart(function () {
        $('#global-spin').fadeIn('slow');
    })
    .ajaxStop(function () {
        $('#global-spin').fadeOut('slow');
    });
});
