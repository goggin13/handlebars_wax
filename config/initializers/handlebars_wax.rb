
require 'handlebars'

class HandlebarsConfig
  HANDLEBARS = Handlebars::Context.new

  def self.register_partial(partial_name, file_name)
    compiled = HANDLEBARS.compile(File.open(file_name).read)
    HANDLEBARS.handlebars.registerPartial(partial_name, compiled)
  end

  def self.register_partials
    ActionController::Base.view_paths.each do |d|
      Dir[File.join(d, "**/*.jst.hbs")].each do |t|
        register_partial(t.split(/[\/\.]/)[-3].gsub(/\A_/, ''), t)
      end
    end
  end

end

module HBSTemplateHandler
  def self.call(template)
    <<-TEMPLATE
    template = HandlebarsConfig::HANDLEBARS.compile('#{template.source}');
    vars = {}
    partial_renderer = @view_renderer.send(:_partial_renderer)
    vars.merge!(@_assigns)
    vars.merge!(partial_renderer.instance_variable_get('@locals'))
    vars.merge!(partial_renderer.instance_variable_get('@options')[:context] || {})
    template.call(vars.as_json).html_safe
    TEMPLATE
  end
end

# Register HBS template handler to render Handlebars templates
ActionView::Template.register_template_handler(:hbs, HBSTemplateHandler)
ActionView::Template.register_template_handler('jst.hbs', HBSTemplateHandler)