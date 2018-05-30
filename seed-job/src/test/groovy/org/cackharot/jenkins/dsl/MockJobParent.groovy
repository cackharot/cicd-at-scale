package org.cackharot.jenkins.dsl

import javaposse.jobdsl.dsl.JobParent
import javaposse.jobdsl.dsl.MemoryJobManagement

class MockJobParent extends JobParent {

  MockJobParent() {
    setJm new MemoryJobManagement()
  }

  @Override
  Object run() {
    return null
  }
}