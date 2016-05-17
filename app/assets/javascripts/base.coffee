#= require_self
#
#= require base/app
#= require_tree ./base

window.domain = (location.host.match(/([^.]+)\.\w{2,3}(?:\.\w{2})?$/) || [])[0]
window.ApiBasePath = "//api.#{domain}"

$(document).on 'show.bs.collapse', '.navbar-collapse', ->
  $('.navbar-collapse.in').not(this).collapse('hide')

$ ->
  FastClick.attach(document.body)

  $('.btn.btn-loading').click ->
    $(this).button('loading')

  if ("standalone" in window.navigator) && window.navigator.standalone
    noddy = remotes = false

    document.addEventListener 'click', (event) ->
      noddy = event.target

      while noddy.nodeName isnt "A" && noddy.nodeName isnt "HTML"
        noddy = noddy.parentNode

      if 'href' in noddy && noddy.href.indexOf('http') isnt -1 && (noddy.href.indexOf(document.location.host) isnt -1 || remotes)
        event.preventDefault()
        document.location.href = noddy.href
    , false
