profileApp.factory 'Language', ['$resource', ($resource) ->
  $resource ('/languages/:id.json'), id: '@id', query: {method:'GET',isArray:true} 
]
