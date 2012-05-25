## Handlebars_Wax

### Setup

Add handlebars_wax to your gemfile
`gem 'handlebars_wax', :git => git@github.com:goggin13/handlebars_wax.git` 

Create a directory for your handlebars templates.
`mkdir app/assets/templates`  

List the directory in application.rb
`paths["app/views"] << "app/assets/templates"`  

### Use

Create your handlebars templates and partials in your templates directory.
You may wish to nest them by controller in the same way Rails manages the `views`
directory. For the Home controller, ours looks like:
* app  
  * assets  
    * templates
      * home
        * template.jst.hbs
        * _partial.jst.hbs

From your erb templates, you can render partials as 
```
<div>
  <%= render :partial => 'partial', :locals => {:data => "hello"}  %>
</div>
```

For client side rendering, a global JST variable is created
and populated with your templates and partials.  Render client side
with 
```
<div id='partial'>
</div>
<script type="text/javascript">
  $('#template').html(JST['home/_partial']({data: "hello"}));
</script>
```
or 
```
<div id='template'>
</div>
<script type="text/javascript">
  $('#template').html(JST['home/template']({data: "hello"}));
</script>
```
