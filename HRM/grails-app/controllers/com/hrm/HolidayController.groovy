package com.hrm

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.transaction.annotation.Propagation

@Secured('permitAll')
class HolidayController {

    def springSecurityService

    def newHoliday() {
        def name = springSecurityService.currentUser.getUsername()
        def companyName= Employee.findByUsername(name).company.companyName
        render(view: 'newHoliday', model: [username: name, companyName: companyName, limit:60])
    }
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def saveHoliday(){
        def name = springSecurityService.currentUser.getUsername()
        def nowDate = new Date()
        def company = Employee.findByUsername(name).company
        def limit = params.int('index')
        for(int i=0; i<limit; i++){
            Holiday holiday = new Holiday()
            String []date = params["holidayDate${i}"].split('-')
            holiday.setHolidayDate(params["holidayDate${i}"])
            holiday.setTitle(params["title${i}"])
            holiday.setYear(Integer.parseInt(date[0]))
            holiday.setCreatedBy(name)
            holiday.setCreatedDate(nowDate)
            company.addToHolidays(holiday)
            holiday.save()
        }
        redirect(controller: 'holiday', action: 'holiday')
    }

    def holiday(){
        def name = springSecurityService.currentUser.getUsername()
        def employee = Employee.findByUsername(name)
        def company = employee.company
        def year = Calendar.getInstance().get(Calendar.YEAR)
        if(employee.roleEmployee.accessibility.equals('high')){
            def years = (List<Integer>)Holiday.withCriteria{ projections { distinct("year") } }
            Integer index
            if(years.contains(year)){
                index = years.indexOf(year)
            }else {
                index = 0
            }
            render(view: 'holiday', model: [username: name, company: company, years: years, index: index])
        }else{
            def holidays = company.holidays.findAll{it.year == year}
            render(view: 'holidayPage', model: [username: name, companyName: company.companyName, holidays: holidays])
        }
    }

    def editHoliday(){
        def name = springSecurityService.currentUser.getUsername()
        def company = Employee.findByUsername(name).company
        def holiday = company.holidays.findAll{it.year == Integer.parseInt(params.year)}
        render(view: 'editHoliday', model: [username: name, holidayList: holiday, companyName: company.companyName])
    }
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def updateHoliday(){
        def name = springSecurityService.currentUser.getUsername()
        def company = Employee.findByUsername(name).company
        def holidays = company.holidays.findAll{it.year == params.int('year')}
        Iterator iter = holidays.iterator()
        while (iter.hasNext()){
            def holiday = iter.next()
            company.removeFromHolidays(holiday)
            holiday.delete()
        }

        def nowDate = new Date()
        def index = params.int('index')
        for(int i=0; i<index; i++){
            if(params["holidayDate${i}"] != "" && params["title${i}"] != ""){

                Holiday holiday = new Holiday()
                String []date = params["holidayDate${i}"].split('-')
                holiday.setHolidayDate(params["holidayDate${i}"])
                holiday.setTitle(params["title${i}"])
                holiday.setYear(Integer.parseInt(date[0]))
                holiday.setCreatedBy(name)
                holiday.setCreatedDate(nowDate)
                company.addToHolidays(holiday)
                holiday.save()
            }
        }
        redirect(controller: 'holiday', action: 'holiday')
    }

    def hi(){
        return 'Hello'
    }
}
