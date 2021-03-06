Application.services_manifest = ->
  $('body.contacts.index').trigger 'application:services:notification'
  $('body.contacts.index').trigger 'application:services:contacts_search'
  # fill in your manifest here
  # example:
  # if you want to trigger a service on your entire app
  # $('body').trigger 'application:services:service_name'
  # 
  # If you want a more fine grained control for 
  # different pages you can add a class to your body 
  # in your views/layouts/application.html.erb
  # on your body tag you can do something like this
  #
  # <body class="[controller_name] [action_name]">
  #
  # You now have a more fine grained control in 
  # your manifest file
  # $('body.posts.show').trigger 'application:services:service_name'
  #
  # if you need to trigger the same services on multiple pages
  # $('body.posts.show,
  #    body.dashboard.show,
  #    body.photos.index').trigger 'application:services:service_name'
  # 

Application.run_ready = ->
  Application.services_manifest()

# setup progress bar for turbolinks
$(document).on 'page:fetch',   -> NProgress.start()
$(document).on 'page:change',  ->  NProgress.done()
$(document).on 'page:restore', ->  NProgress.remove()
$(document).on 'ajax:beforeSend', -> NProgress.start()
$(document).on 'ajax:complete', ->   NProgress.done()

$(document).ready Application.run_ready
$(document).on 'page:load', Application.run_ready