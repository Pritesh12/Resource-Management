package com.hrm

class Module {


    boolean equals(o) {
        if (this.is(o)) return true
        if (getClass() != o.class) return false

        Module module = (Module) o

        if (org_grails_datastore_gorm_GormValidateable__skipValidate != module.org_grails_datastore_gorm_GormValidateable__skipValidate) return false
        if (createdBy != module.createdBy) return false
        if (createdDate != module.createdDate) return false
        if (id != module.id) return false
        if (modifiedBy != module.modifiedBy) return false
        if (modifiedDate != module.modifiedDate) return false
        if (moduleName != module.moduleName) return false
        if (moduleType != module.moduleType) return false
        if (org_grails_datastore_gorm_GormValidateable__errors != module.org_grails_datastore_gorm_GormValidateable__errors) return false
        if (org_grails_datastore_mapping_dirty_checking_DirtyCheckable__$changedProperties != module.org_grails_datastore_mapping_dirty_checking_DirtyCheckable__$changedProperties) return false
        if (version != module.version) return false

        return true
    }

    int hashCode() {
        int result
        result = (moduleName != null ? moduleName.hashCode() : 0)
        result = 31 * result + (moduleType != null ? moduleType.hashCode() : 0)
        result = 31 * result + (createdBy != null ? createdBy.hashCode() : 0)
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0)
        result = 31 * result + (modifiedBy != null ? modifiedBy.hashCode() : 0)
        result = 31 * result + (modifiedDate != null ? modifiedDate.hashCode() : 0)
        result = 31 * result + (id != null ? id.hashCode() : 0)
        result = 31 * result + (version != null ? version.hashCode() : 0)
        result = 31 * result + (org_grails_datastore_mapping_dirty_checking_DirtyCheckable__$changedProperties != null ? org_grails_datastore_mapping_dirty_checking_DirtyCheckable__$changedProperties.hashCode() : 0)
        result = 31 * result + (org_grails_datastore_gorm_GormValidateable__skipValidate ? 1 : 0)
        result = 31 * result + (org_grails_datastore_gorm_GormValidateable__errors != null ? org_grails_datastore_gorm_GormValidateable__errors.hashCode() : 0)
        return result
    }
    String moduleName
    String moduleType
    String createdBy
    Date createdDate
    String modifiedBy
    Date modifiedDate

    static constraints = {
        moduleName nullable: true, blank: false
        moduleType  nullable: true, blank: false
        createdBy nullable: true, blank: false
        createdDate nullable: true, blank: false
        modifiedBy nullable: true, blank: false
        modifiedDate nullable: true, blank: false
    }
}
