(function () {
    'use strict';

    angular.module('attendanceAdmin').controller('AbsencesCtrl', AbsencesCtrl);

    AbsencesCtrl.$inject = ['$scope', '$modal', '$location', '$stateParams', 'initialData', 'attendanceApi', 'absencesInitialDataService'];

    /* @ngInject */
    function AbsencesCtrl($scope, $modal, $location, $stateParams, initialData, attendanceApi, absencesInitialDataService) {
        /* jshint validthis: true */
        var vm = this;

        vm.activate = activate;
        //vm.deleteItem = deleteItem;
        //vm.editItem = editItem;
        vm.absences = initialData.absences;
        vm.absenceFilter = absenceFilter;
        vm.absenceReasons = initialData.absenceReasons;
        vm.absenceReasonsLookup = {};
        vm.employees = initialData.employees;
        vm.employeesLookup = {};
        vm.numHours = [4, 8, 12];
        vm.year = new Date().getFullYear();
        vm.years = generateYears();
        vm.update = update;

        vm.calendarConfig = {
            height: 550,
            header: {
                left: 'month agendaWeek agendaDay',
                center: 'title',
                right: 'today prev,next'
            },
            defaultView: 'month',
            firstHour: 8,
            dayClick: dayClick,
           // eventLimit: true,
            editable: false
           // eventClick: eventClick,
          //  eventDrop: eventDrop
        };

        activate();

        function generateYears(startYear) {
            var years = [];
            var currentYear = new Date().getFullYear();
            startYear = startYear || 2014;

            while (startYear <= currentYear) {
                years.push(startYear++);
            }

            return years;
        };

        function update() {
            //doubt this is the best way to handle this but if I don't add 'then' it just returns 
            //a $$state object
            var data = absencesInitialDataService.getData($stateParams.areaId, vm.year).then(function (absences) {
                vm.absences = absences.absences;
            });
        }

        ////////////////

        function eventClick(calEvent) {
          //  console.log(calEvent);
          //  var absence = _.find(vm.absences, { 'id': calEvent.ClockNum });
           // editItem(absence);
        }

        function dayClick(date) {
            //$scope.absencesCalendar.fullCalendar('changeView', 'agendaDay');
            //$scope.absencesCalendar.fullCalendar('gotoDate', date);

            angular.element('#scheduleCalendar').fullCalendar('changeView', 'agendaDay');
            angular.element('#scheduleCalendar').fullCalendar('gotoDate', date);
        }

        function activate() {
            _.forEach(vm.employees, function(employee){
                vm.employeesLookup[employee.id] = employee.FullName;
            });

            _.forEach(vm.absenceReasons, function (absenceReason) {
                vm.absenceReasonsLookup[absenceReason.id] = absenceReason.Reason;
            });
            var absenceEvents = _.map(vm.absences, mapToAbsenceEvent);
            vm.eventSources = [absenceEvents];
        }

        function mapToAbsenceEvent(absence) {
           // console.log(absence);
            return {
                id: absence.id,
                start: absence.AbsenceDate,
                title: absence.FullName + ' - ' + absence.NumHours,
                clock: absence.ClockNum,
                allDay: true,
                durationEditable: false,
                end: absence.AbsenceDate,
                color: setLabelColor(absence.AbsenceReasonId)
            };
        }

        function setLabelColor(reasonAbsent) {
            if (reasonAbsent === 1) { // vacation
                return '#0080FF'; // blue
            } else if (reasonAbsent === 2) { // personal sickness
                return '#FF0000'; // red
            } else if (reasonAbsent === 3) { // company business
                return '#088A29';  // green
            } else {
                return '#000000'; // need to define a color for another absence reason?
            }
        }
        function absenceFilter(absence) {
            if (vm.employeeFilter && vm.employeeFilter.length > 0) {
                return _.some(vm.employeeFilter, function (filter) {
                    return absence.ClockNum === filter.ClockNum;
                });
            } else {                
                return true;
            }
        }
    }
})();