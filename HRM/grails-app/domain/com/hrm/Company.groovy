package com.hrm

class Company {

    static hasMany = [employees: Employee, modules: Module, assets: Asset, holidays:Holiday]

    String companyName
    String taxId
    String companyStatus
    String registrationNo
    String email
    String phone
    String address
    String city
    String state
    String country
    Double leaveRate
    Double maxLeave
    String createdBy
    Date createdDate
    String modifiedBy
    Date modifiedDate

    static constraints = {

        companyName nullable: true, blank: false
        taxId nullable: true, blank: false
        companyStatus nullable: true, blank: false
        registrationNo nullable: true, blank: false
        email nullable: true, blank: false
        phone nullable: true, blank: false
        address nullable: true, blank: false
        city nullable: true, blank: false
        state nullable: true, blank: false
        country nullable: true, blank: false
        leaveRate nullable: true, blank: false
        maxLeave nullable: true, blank: false
        createdBy nullable: true, blank: false
        createdDate nullable: true, blank: false
        modifiedBy nullable: true, blank: false
        modifiedDate nullable: true, blank: false
    }
}
