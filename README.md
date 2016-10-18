# habitat-jenkins-slave

This is a plan to build a jenkins-slave in habitat.

## Build instructions

```
$ hab studio enter # enter the studio
[1][default:/src:0]# cd habitat-jenkins-slave/
[2][default:/src/habitat-jenkins-slave:0]# build
[3][default:/src/habitat-jenkins-slave:0]# hab start YOURORIGIN/jenkins-slave # verify everything comes up
[4][default:/src/habitat-jenkins-slave:0]# hab pkg export docker YOURORIGIN/jenkins-slave # export to a container
[5][default:/src/habitat-jenkins-slave:0]# logout # leave the studio
$ docker run -p 8080:8080 -it YOURORIGIN/jenkins-slave:latest # run container
```
## License & Authors

- Author:: JJ Asghar (<jj@chef.io>)

```text
Copyright (c) 2016, JJ Asghar

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
