megatron = angular.module 'megatron', [
  'duScroll'
]

megatron.controller 'megatron', [

  '$scope', '$window', '$document'
  ($scope,   $window,   $document) ->

    $scope.changeVideoSize = (size) ->
      if size != 'fs' then $scope.setVideoSize size
      else
        mega = angular.element document.getElementById 'megatron'
        $document.scrollToElementAnimated mega, 0, 500
          .then $scope.setVideoSize size

    $scope.setVideoSize = (size) ->

      $window.localStorage.setItem 'megatron-size', size
      $scope.videoSize = size;
      console.log size

    $scope.setWindowSizes = ->
      $scope.windowWidth = $window.innerWidth
      $scope.windowHeight = $window.innerHeight

      console.log "#{$scope.windowWidth} x #{$scope.windowHeight}"

    $scope.downsizeIfNecessary = ->
      if $scope.windowWidth < 940 then console.error 'STOP'


    $scope.videoSize = ->
      maxheight: $window.innerHeight - 24 - 44

    $scope.setWindowSizes()

    $scope.videoSize = $window.localStorage.getItem 'megatron-size'
    $scope.videoSize ?= 'hd'

    angular.element($window).bind 'resize', ->
      $scope.setWindowSizes()
      $scope.downsizeIfNecessary()
      $scope.$digest()
]
