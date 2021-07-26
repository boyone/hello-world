# GitLab CI

Root file system: Because the `docker:19.03.12-dind` container and the runner container `don’t share their root file system`, you can use the job’s working directory as a mount point for child containers. For example, if you have files you want to share with a child container, you might create a subdirectory under `/builds/$CI_PROJECT_PATH` and use it as your mount point. For a more detailed explanation, view issue [#41227](https://gitlab.com/gitlab-org/gitlab-foss/-/issues/41227).

```yml
script:
  - ls /builds/$CI_PROJECT_PATH
```

ref: [https://docs.gitlab.com/ee/ci/docker/using_docker_build.html](https://docs.gitlab.com/ee/ci/docker/using_docker_build.html)

 