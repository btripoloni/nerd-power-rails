controllers.feedCtrl = ['$scope','$http', '$cookies', function($scope, $http, $cookies) {

  $scope.user_id = $cookies.id_user;

  $http.get('/api/post').
    success(function(data) {
      $scope.posts = data;
  });

  $scope.createPost = function() {
    var post = {"post":{"content": $scope.content}};
    $http.post("/api/post", post).success(function(data){
      $scope.posts.unshift(data);
      $scope.content = null;
      console.log("hello");
    });
  };

  $scope.removePost = function(id, index){
    $http.delete("/api/post/"+id).success(function(){
        $scope.posts.splice(index, 1);
    });
  };
}]
