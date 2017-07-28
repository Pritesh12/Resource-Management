package com.hrm

class Holiday {

    static belongsTo = [company : Company]

    String title
    String holidayDate
    Integer year
    String createdBy
    Date createdDate
    String modifiedBy
    Date modifiedDate

    static constraints = {
        title nullable: true, blank: false
        holidayDate nullable: true, blank: false
        year nullable: true, blank: false
        createdBy nullable: true, blank: false
        createdDate nullable: true, blank: false
        modifiedBy nullable: true, blank: false
        modifiedDate nullable: true, blank: false
    }
}
