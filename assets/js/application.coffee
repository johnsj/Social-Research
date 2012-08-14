window.app = window.app || {}
_.templateSettings =
  interpolate : /\{\{(.+?)\}\}/g
#= require_tree risk_management
jQuery ->
  