Events = require './events'
class View extends Events
  set_view_template: (tmpl_id) ->
    @tmpl = Handlebars.compile $(tmpl_id).html()

module.exports = View
