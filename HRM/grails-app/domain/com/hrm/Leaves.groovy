package com.hrm

class Leaves {

    static belongsTo = [employee: Employee]

    String fromDate
    String toDate
    Integer days
    String status
    String reason
    String createdBy
    Date createdDate
    String modifiedBy
    Date modifiedDate

    static constraints = {
        fromDate nullable: true, blank: false
        toDate nullable: true, blank: false
        days nullable: true, blank: false
        status nullable: true, blank: false
        reason nullable: true, blank: false
        createdBy nullable: true, blank: false
        createdDate nullable: true, blank: false
        modifiedBy nullable: true, blank: false
        modifiedDate nullable: true, blank: false
    }
}
