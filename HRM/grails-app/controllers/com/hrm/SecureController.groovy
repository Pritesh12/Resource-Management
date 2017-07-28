package com.hrm

import grails.plugin.springsecurity.annotation.Secured
import org.quartz.Scheduler
import org.quartz.impl.StdSchedulerFactory

@Secured('permitAll')
class SecureController {

    def springSecurityService
    def index() {
        Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler()
        scheduler.start()
        //Scheduler--------------------------------------------------------------------------------

        def name = springSecurityService.currentUser.getUsername()
        def user = User.findByUsername(name)
        if(user.class == User){
            redirect(controller: 'secure', action:'superAdmin')
        }else if(user.class == Employee){
            redirect(controller: 'secure', action:'user')
        }
    }

    def superAdmin(Integer max){
        def name = springSecurityService.currentUser.getUsername()
        params.max = Math.min(max ?: 3,3)
        def companyList= Company.list(params)
        Integer from = 0;
        Integer to = 0;
        if(!params.offset){
            params.offset = "0"
        }
        to = Integer.parseInt(params.offset)+params.max
        for(int i = from; i<=Company.count();i++){
            if(from != Company.count())
            {
                from = Integer.parseInt(params.offset)+1
            }
        }
        if(to>Company.count()){
            to=Company.count()
        }

        render (view: 'superAdmin', model: [username: name, companyData: companyList, from: from, to: to, companyCount: Company.count()])
    }
    def list(){
        redirect action: "superAdmin", params:params
    }

    def user(){
        def name = springSecurityService.currentUser.getUsername()
        def employee = Employee.findByUsername(name)
        if(employee.roleEmployee.accessibility.equals('high')){
            render(view: 'admin', model: [username: name, company: employee.company])
        }else if(employee.roleEmployee.accessibility.equals('normal')){
            Integer leaveCount = 0
            for(def emp: employee.employees){
                for(def leave : emp.leaves){
                    if(leave.status.equals('Pending')){
                        leaveCount++
                    }}}
            render(view: 'manager', model: [username: name, manager: employee, company: employee.company, leaveCount: leaveCount])
        }else if(employee.roleEmployee.accessibility.equals('low')){
            render(view: 'employee', model: [username: name, employee: employee, company: employee.company])
        }

    }
}
