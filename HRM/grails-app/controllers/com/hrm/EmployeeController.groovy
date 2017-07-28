package com.hrm

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.transaction.annotation.Propagation

import java.text.SimpleDateFormat
import java.time.Year

@Secured('permitAll')
class EmployeeController {

    def springSecurityService
    def leave() {
        def name = springSecurityService.currentUser.getUsername()
        def companyName= Employee.findByUsername(name).company.companyName
        render(view: 'leaveRequest', model: [username: name, companyName: companyName])
    }

    def leaveRecord(){
        def name = springSecurityService.currentUser.getUsername()
        def employee = Employee.findByUsername(name)
        def x = employee.employeeLeave.earnLeave
        render(view: 'leaveRecord', model: [username: name, employee: employee])
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def saveLeave(Leaves leave){
        def name = springSecurityService.currentUser.getUsername()
        def employee = Employee.findByUsername(name)
        def holidays = employee.company.holidays

        def fromDateArr = params.fromDate.split('-')
        def toDateArr = params.toDate.split('-')
        Integer fromYear = Integer.parseInt(fromDateArr[0])
        Integer toYear = Integer.parseInt(toDateArr[0])

        //leave.setFromDate(params.date('fromDate'))
        def status = "Pending"
        def fromDate = new SimpleDateFormat("yyyy-M-dd").parse(params.fromDate)
        def toDate = new SimpleDateFormat("yyyy-M-dd").parse(params.toDate)
        leave.setStatus(status)
        def days = toDate-fromDate+1

        if(fromYear == toYear){
            def holidayListObj = holidays.findAll{it.year == fromYear}.holidayDate
            List<Date> holidayList = new ArrayList<Date>();
            for(String day : holidayListObj){
                holidayList.add(new SimpleDateFormat("yyyy-M-dd").parse(day))
            }

            for(def from = fromDate; from <= toDate; from++){
                if(from.getDay() == 6 || from.getDay() == 0){
                    days-=1
                }else if(holidayList.contains(from)){
                    days-=1
                }
            }

        }else{
            def holidayListFromObj = holidays.findAll{it.year == fromYear}.holidayDate
            def holidayListToObj = holidays.findAll{it.year == toYear}.holidayDate
            List<Date> holidayListFrom = new ArrayList<Date>()
            List<Date> holidayListTo = new ArrayList<Date>()

            for(String day0 : holidayListFromObj){
                holidayListFrom.add(new SimpleDateFormat("yyyy-M-dd").parse(day0))
            }
            for(String day1 : holidayListToObj){
                holidayListTo.add(new SimpleDateFormat("yyyy-M-dd").parse(day1))
            }

            def fromEnd = new SimpleDateFormat("yyyy-M-dd").parse(fromYear+"-12-31")
            for(def from = fromDate; from <= fromEnd; from++){
                println("Date : "+from)
                if(from.getDay() == 6 || from.getDay() == 0){
                    days-=1
                }else if(holidayListFrom.contains(from)){
                    days-=1
                }
            }

            def beginTo = new SimpleDateFormat("yyyy-M-dd").parse(toYear+"-01-01")
            for(beginTo; beginTo <= toDate; beginTo++){
                if(toDate.getDay() == 6 || toDate.getDay() == 0){
                    days-=1
                }else if(holidayListTo.contains(beginTo)){
                    days-=1
                }
            }

        }
        leave.setDays(days)
        leave.setCreatedBy(name)
        leave.setCreatedDate(new Date())
        employee.addToLeaves(leave)
        leave.save()
        redirect(controller: 'secure')
    }
}
