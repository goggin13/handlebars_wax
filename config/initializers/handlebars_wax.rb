
require 'handlebars'

class HandlebarsConfig
  HANDLEBARS = Handlebars::Context.new.tap do |context|
    context['rails'] = {}
    context.partial_missing do |name|
      name = name.gsub('.', '/')
      lookup_context = context['rails']['view'].lookup_context
      prefixes = lookup_context.prefixes.dup
      prefixes.push ''
      partial = lookup_context.find(name, prefixes, true)
      lambda do |this, context|
        if partial.handler == self
          handlebars.compile(partial.source).call(context)
        else
          context['rails']['view'].render :partial => name, :locals => context
        end
      end
    end
  end

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
    HBSTemplateHandler.with_view(self) do
      template.call(vars).force_encoding(Encoding.default_external).html_safe
    end
    TEMPLATE
  end

  def self.with_view(view)
    original_view = data['view']
    data['view'] = view
    yield
  ensure
    data['view'] = original_view
  end

  def self.data
    HandlebarsConfig::HANDLEBARS['rails']
  end
end

# Register HBS template handler to render Handlebars templates
ActionView::Template.register_template_handler(:hbs, HBSTemplateHandler)
ActionView::Template.register_template_handler('jst.hbs', HBSTemplateHandler)