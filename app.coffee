megatron = angular.module 'megatron', []

megatron.controller 'megatron-size', [

  '$scope', '$window', ($scope, $window) ->

    $scope.setVideoSize = (size) =>
      $window.localStorage.setItem 'megatron-size', size
      $scope.videoSize = size;
      console.log size

    $scope.setWindowSizes = ->
      $scope.windowWidth = $window.innerWidth
      $scope.windowHeight = $window.innerHeight

      console.log "#{$scope.windowWidth} x #{$scope.windowHeight}"

    $scope.downsizeIfNecessary = ->
      if $scope.windowWidth < 940 then console.error 'STOP'

    $scope.setWindowSizes()

    $scope.videoSize = $window.localStorage.getItem 'megatron-size'
    $scope.videoSize ?= 'hd'

    angular.element($window).bind 'resize', ->
      $scope.setWindowSizes()
      $scope.downsizeIfNecessary()
      $scope.$digest()
]
