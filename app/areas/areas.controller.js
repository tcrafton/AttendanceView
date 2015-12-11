(function () {
    'use strict';

    angular.module('attendanceAdmin').controller('AreasCtrl', AreasCtrl);

    AreasCtrl.$inject = ['initialData', 'attendanceApi'];

    /* @ngInject */
    function AreasCtrl(initialData, attendanceApi) {
        /* jshint validthis: true */
        var vm = this;

        vm.activate = activate;
        vm.areas = initialData;

        activate();

        ////////////////

        function activate() {
        }

    }
})();