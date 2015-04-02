angular.module('app.profileApp').controller("profileCtrl", [
  '$scope',
  ($scope)->

    # Functions
      
    $.ajax '/languages.json',
        success  : (data, status, xhr) ->
            $scope.languages = data
            console.log("Works "+data)
        error    : (xhr, status, err) ->
            $scope.languages = []
        complete : (xhr, status) ->
            console.log("Complete")

    # Main

    console.log 'ProfileCtrl running'
    console.log $scope.languages
    
])