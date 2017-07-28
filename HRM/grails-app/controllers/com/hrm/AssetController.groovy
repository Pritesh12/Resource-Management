package com.hrm

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.transaction.annotation.Propagation

@Secured('permitAll')
class AssetController {

    def springSecurityService
    def newAsset() {
        def name = springSecurityService.currentUser.getUsername()
        def companyName = Employee.findByUsername(name).company.companyName
        render(view: 'newAsset', model: [username: name, companyName: companyName])
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def saveAsset(){
        def name = springSecurityService.currentUser.getUsername()
        def company = Employee.findByUsername(name).company
        def date = new Date()
        def limit = params.int('index')
        for(int i=0; i<limit; i++){
            Asset asset = new Asset()
            asset.setName(params["name${i}"])
            asset.setSerialNo(params["serialNo${i}"])
            asset.setProductID(params["productID${i}"])
            asset.setType(params["type${i}"])
            asset.setCreatedBy(name)
            asset.setCreatedDate(date)
            company.addToAssets(asset)
            asset.save()
        }
        redirect(controller: 'asset', action: 'assets')
    }

    def assets(){
        def name = springSecurityService.currentUser.getUsername()
        def company = Employee.findByUsername(name).company
        render(view: 'asset', model: [username: name, company: company])
    }

    def assignAsset(){
        def name = springSecurityService.currentUser.getUsername()
        def company = Employee.findByUsername(name).company
        render(view: 'selectEmployee', model: [username: name, company: company])
    }

    def assetToEmployee(Employee employee){
        def name = springSecurityService.currentUser.getUsername()
        render(view: 'assetToEmployee', model: [username: name, employee: employee])
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def saveAssetToEmploye(Employee employee){
        def arr = params.assetId
        if(params.act.equals('Add')){
            for(String id : arr){
                def asset = Asset.get(Integer.parseInt(id))
                employee.addToAssets(asset)
                asset.setIssueDate((String)new Date())
                asset.save()
            }
            redirect(controller: 'asset', action: 'assignAsset')
        }else if(params.act.equals('Remove')){
            for(String id : arr){
                def asset = Asset.get(Integer.parseInt(id))
                employee.removeFromAssets(asset)
                asset.setIssueDate(null)
                asset.save()
            }
            redirect(controller: 'asset', action: 'assignAsset')
        }
    }

    //@Transactional(propagation = Propagation.REQUIRES_NEW)
    def modifyAsset(Asset asset){
        if(params.modify.equals('Edit')){
            def name = springSecurityService.currentUser.getUsername()
            def companyName = Employee.findByUsername(name).company.companyName
            render(view: 'editAsset', model: [username: name, companyName: companyName, asset: asset])
        }else if(params.modify.equals('Delete')){
            if(asset.employee != null){
                def employee = asset.employee
                employee.removeFromAssets(asset)
                asset.delete(flush: true)
            }else {
                asset.delete(flush: true)
            }
            redirect(controller: 'asset', action: 'assets')
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def updateAsset(Asset asset){
        def name = springSecurityService.currentUser.getUsername()
        asset.setModifiedBy(name)
        asset.setModifiedDate(new Date())
        asset.validate()
        redirect(controller: 'asset', action: 'assets')
    }
}
