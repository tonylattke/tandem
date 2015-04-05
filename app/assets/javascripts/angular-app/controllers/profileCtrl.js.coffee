angular.module('app.profileApp').controller("profileCtrl", [
  '$scope', 'Language', '$http'
  ($scope, Language,$http)->

    # Functions
    
    #$scope.languages = Language.query()

    $scope.languages = []
    $http.get('/languages.json').success((data) ->
        $scope.languages = data
    )

    # Main

    console.log 'ProfileCtrl running'
    console.log $scope.languages
    
])