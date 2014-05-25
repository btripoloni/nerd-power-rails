controllers.feedCtrl = ['$scope','$http', function($scope, $http) {

  $http({method: 'GET', url: '/posts'}).
    success(function(data, status, headers, config) {
      $scope.posts = data;
    });

  $scope.createPost = function() {
    var newPost = { content: $scope.content }
    $scope.posts.unshift(newPost)
    $scope.content = null
  }

}]
