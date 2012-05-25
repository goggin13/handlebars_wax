## Handlebars_Wax

A gem to simplify use of Handlebars templates both server side and client side.

Features:
* Sprockets compilation of handlebars templates  
* Register templates as partials for use in Javascript  
* Server side rendering  

### Setup

Add handlebars_wax to your gemfile
`gem 'handlebars_wax', :git => git@github.com:goggin13/handlebars_wax.git` 

Create a directory for your handlebars templates.
`mkdir app/assets/templates`  

List the directory in application.rb
`paths["app/views"] << "app/assets/templates"`  

Download [handlebars.js](https://github.com/wycats/handlebars.js/downloads) and include it with
the rest of your javascript. 
(e.g., in application.js) 
```
...

//= require jquery
//= require jquery_ujs
//= require handlebars.runtime

...
```  

### Use

Create your handlebars templates and partials in your templates directory.
You may wish to nest them by controller in the same way Rails manages the `views`
directory. For the Home controller, ours looks like:
```
/app  
  /assets  
    /templates
      /home
        template.jst.hbs
        _partial.jst.hbs
```
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

For more examples, check out the [dummy app](https://github.com/goggin13/handlebars_wax/tree/master/spec/dummy).  

### Todo
* Server side rendering of a template, not a partial (see `spec/dummy/app/controllers/home_controller.rb`).  
* Don't make users manually include handlebars.runtime  

### Acknowledgments
Built off of [handlebars_assets](https://github.com/leshill/handlebars_assets) 
and [handlebars.rb](https://github.com/cowboyd/handlebars.rb) 
by [Becky](github.com/becarella) and [Matt](github.com/goggin13).

