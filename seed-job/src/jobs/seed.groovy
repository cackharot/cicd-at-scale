job('seed') {
    scm {
        github 'cackharot/cicd-jenkins-jobs'
    }
    triggers {
        scm 'H/5 * * * *'
    }
    steps {
        gradle 'clean test'
        dsl {
            external 'jobs/**/*Job.groovy'
            additionalClasspath 'src/main/groovy'
            removeAction('DELETE')
        }
    }
    publishers {
        archiveJunit 'build/test-results/**/*.xml'
    }
}
