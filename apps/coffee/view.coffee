Events = require './events'
class View extends Events
  set_view_template: (name) ->
    if name.indexOf('#') == 0
      @tmpl = Handlebars.compile $(name).html()
    else
      $.ajax({
        async: false
        url: "#{name}.html"
        method: 'get'
      }).done (r) =>
        @tmpl = Handlebars.compile r
      .fail ->
        alert '読み込みに失敗しました。画面を再読み込みしてください。'

module.exports = View
