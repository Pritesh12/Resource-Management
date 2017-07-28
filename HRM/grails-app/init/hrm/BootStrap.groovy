package hrm

import com.hrm.Role
import com.hrm.User
import com.hrm.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()

        def testUser = new User(username: 'me', password: 'password', accessKey: 'super').save()

        UserRole.create testUser, adminRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }
    }
}
