package com.hrm.schedule

import com.hrm.Company
import com.hrm.Employee
import grails.transaction.Transactional
import org.springframework.transaction.annotation.Propagation

class SchedulerJob {
    static triggers = {
        cron name: 'myTrigger', cronExpression: "0 0 1am 1 * ?" //Scheduled to run at 1am on the 1st day of every month
      //simple repeatInterval: 30000l // execute job once in 30 seconds
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def execute() {
        for(Company company : Company.list()){
            for(Employee employee : company.employees){
                if(employee.employeeLeave.earnLeave+company.leaveRate < company.maxLeave){
                    employee.employeeLeave.earnLeave += company.leaveRate
                }else {
                    employee.employeeLeave.earnLeave = company.maxLeave
                }
                println(employee.firstName+"******"+employee.employeeLeave.earnLeave)
            }
        }
        println("Time : "+java.time.LocalDateTime.now())
        // execute job
    }
}
