(function () {
    'use strict';
    var app = angular.module('attendanceAdmin', [
        // Angular modules
        //'ngRoute',
        'ngSanitize',

        // 3rd Party Modules
        'ui.bootstrap',
        'ui.router',
        'ui.calendar',
        'ui.select'
    ]);

    //app.config(['$routeProvider', configRoutes]);
    app.config(['$stateProvider', '$urlRouterProvider', configRoutes]);

    function configRoutes($stateProvider, $urlRouterProvider) {

        $stateProvider
            .state('home', {
                url: '/',
                templateUrl: 'app/home/home.html',
                controller: 'HomeCtrl',
                controllerAs: 'vm',
                data: {
                    property1: 'foo',
                    property2: 'bar'
                }
            })
            .state('areas', {
                url: '/areas',
                templateUrl: 'app/areas/areas.html',
                controller: 'AreasCtrl',
                controllerAs: 'vm',
                resolve: {
                    initialData: ['attendanceApi', function (attendanceApi) {
                        return attendanceApi.getAreas();
                    }]
                }
            })
            .state('area', {
                url: '/areas/:areaId/:areaName',
                abstract: true,
                controller: 'AreaShellCtrl',
                controllerAs: 'vm',
                templateUrl: 'app/layout/area-shell.html'
            })
            .state('area.employees', {
                url: '/employees',
                views: {
                    'tabContent': {
                        templateUrl: 'app/employees/employees.html',
                        controller: 'EmployeesCtrl',
                        controllerAs: 'vm',
                        resolve: {
                            initialData: ['$stateParams', 'attendanceApi', function ($stateParams, attendanceApi) {
                                return attendanceApi.getHoursAbsentByArea($stateParams.areaId);
                            }]
                        }
                    }
                }
            })
            .state('area.absences', {
                url: '/absences',
                views: {
                    'tabContent': {
                        templateUrl: 'app/absences/absences.html',
                        controller: 'AbsencesCtrl',
                        controllerAs: 'vm',
                        resolve: {
                            initialData: ['$stateParams', 'absencesInitialDataService', function ($stateParams, absencesInitialDataService) {
                                return absencesInitialDataService.getData($stateParams.areaId);
                            }]
                        }
                    }
                }
            })
            .state('area.absences-calendar', {
                url: '/absences-calendar',
                views: {
                    'tabContent': {
                        templateUrl: 'app/absences/absences-calendar.html',
                        controller: 'AbsencesCtrl',
                        controllerAs: 'vm',
                        resolve: {
                            initialData: ['$stateParams', 'absencesInitialDataService', function ($stateParams, absencesInitialDataService) {
                                return absencesInitialDataService.getData($stateParams.areaId);
                            }]
                        }
                    }
                }
            })
            .state('area.home', {
                url: '/area-home',
                views: {
                    'tabContent': {
                        templateUrl: 'app/area-home/area-home.html',
                        controller: 'AreaHomeCtrl',
                        controllerAs: 'vm',
                        resolve: {
                            initialData: ['$stateParams', 'attendanceApi', function ($stateParams, attendanceApi) {
                                return attendanceApi.getDepartment($stateParams.areaId);
                            }]
                        }
                    }
                }
            });


        $urlRouterProvider.otherwise('/');
    }

    app.run(['$state', 'stateWatcherService', function ($state, stateWatcherService) {
        // Include $route to kick start the router.
    }]);
})();
