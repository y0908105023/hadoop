# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load hadoop-functions_test_helper

@test "hadoop_detect_priv_subcmd (no classname) " {
  run hadoop_detect_priv_subcmd test app
  [ "${status}" = "1" ]
}

@test "hadoop_detect_priv_subcmd (classname; no user) " {
  export HADOOP_SECURE_CLASSNAME=fake
  run hadoop_detect_priv_subcmd test app
  [ "${status}" = "1" ]
}

@test "hadoop_detect_priv_subcmd (classname; user) " {
  export HADOOP_SECURE_CLASSNAME=fake
  export TEST_APP_SECURE_USER=test
  run hadoop_detect_priv_subcmd test app
  [ "${status}" = "0" ]
}
