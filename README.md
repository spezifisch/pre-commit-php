# daverona/pre-commit-php

[![pipeline status](https://gitlab.com/daverona//pre-commit-php/badges/master/pipeline.svg)](https://gitlab.com/daverona/pre-commit-php/-/commits/master)

This is a set of PHP hooks for [pre-commit framework](https://pre-commit.com/).

* GitLab repository: [https://gitlab.com/daverona/pre-commit-php](https://gitlab.com/daverona/pre-commit-php)
* Docker registry: [https://hub.docker.com/r/daverona/pre-commit-php](https://hub.docker.com/r/daverona/pre-commit-php)
* Available releases: [https://gitlab.com/daverona/pre-commit-php/-/releases](https://gitlab.com/daverona/pre-commit-php/-/releases)

## Overview

PHP hooks provided are:

* [phpmd](https://phpmd.org/): static code analyzer 
* docker-phpmd: docker-version static code analyzer 

## Hook Prerequisites

> If you use Docker, don't need to install anything and skip this section.

* phpmd hook requires `phpmd` executable. To install it, please read
[https://packagist.org/packages/phpmd/phpmd](https://packagist.org/packages/phpmd/phpmd).

## Hook Installation

To use PHP hooks, add the following YAML code block to your
`.pre-commit-config.yaml`:

```yaml
- repo: https://gitlab.com/daverona/pre-commit-php
  rev: 0.5.0          # use the most recent version
  hooks:
  # Hooks using native executables
  - id: phpmd         # static code analyzer
  # Hooks using Docker
  - id: docker-phpmd  # static code analyzer in Docker container
```

> You don't need to use non-docker version hook and its corresponding docker version at the same time.
> For instance, if you use `docker-phpmd` hook, `phpmd` hook is not required (and `phpmd` executable is not required to be installed).

<!-- 
## Hook Configuration
-->

## References

* pre-commit framework: [https://pre-commit.com/](https://pre-commit.com/)
* pre-commit supported hooks: [https://pre-commit.com/hooks.html](https://pre-commit.com/hooks.html)
* PHP Mess Detector: [https://phpmd.org/](https://phpmd.org/)
