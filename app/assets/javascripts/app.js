var app = angular.module('APRNStockQuoteApp', [])
                 .factory('stockService', ['$http', function($http){
                   var stockApi = {};

                   stockApi.searchStocks = function(symbol){
                     return $http.get('/search_stocks.json?stock=' + symbol);
                   }

                   return stockApi;
                 }])
                 .controller('stocksController', ['$scope', '$window', 'stockService', function($scope, $window, stockService){
                   $scope.stock = {};

                   $window.onload = function(){

                     $scope.ticker = "APRN";

                     if ($scope.ticker != undefined && $scope.ticker != ''){
                       stockService.searchStocks($scope.ticker)
                        .then(function(response){
                          $scope.stock.error = null;
                          $scope.stock.message = null;
                          $scope.stock.symbol = response.data.ticker;
                          $scope.stock.name = response.data.name;
                          $scope.stock.last_price = response.data.last_price;
                        },
                        function(response){
                          $scope.stock = {};
                          $scope.stock.error = response.data.response;
                        });
                     }
                     else {
                       $scope.stock = {};
                     }
                   }

                   $scope.lookup = function(){
                     if ($scope.ticker != undefined && $scope.ticker != ''){
                       stockService.searchStocks($scope.ticker)
                        .then(function(response){
                          $scope.stock.error = null;
                          $scope.stock.message = null;
                          $scope.stock.symbol = response.data.ticker;
                          $scope.stock.name = response.data.name;
                          $scope.stock.last_price = response.data.last_price;
                        },
                        function(response){
                          $scope.stock = {};
                          $scope.stock.error = response.data.response;
                        });
                     }
                     else {
                       $scope.stock = {};
                     }
                   }
                 }])
