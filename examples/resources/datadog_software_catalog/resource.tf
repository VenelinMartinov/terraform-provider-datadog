// v3 service entity 
resource "datadog_software_catalog" "service_v3" {
  entity = <<EOF
apiVersion: v3
kind: service
metadata:
  name: shopping-cart
  displayName: Shopping Cart
  inheritFrom: service:otherService
  tags:
    - tag:value
  links:
    - name: shopping-cart runbook
      type: runbook
      url: https://runbook/shopping-cart
    - name: shopping-cart architecture
      provider: gdoc
      url: https://google.drive/shopping-cart-architecture
      type: doc
    - name: shopping-cart Wiki
      provider: wiki
      url: https://wiki/shopping-cart
      type: doc
    - name: shopping-cart source code
      provider: github
      url: http://github/shopping-cart
      type: repo
  contacts:
    - name: Support Email
      type: email
      contact: team@shopping.com
    - name: Support Slack
      type: slack
      contact: https://www.slack.com/archives/shopping-cart
  owner: myteam
  additionalOwners:
    - name: opsTeam
      type: operator
integrations:
  pagerduty:
    serviceURL: https://www.pagerduty.com/service-directory/Pshopping-cart
  opsgenie:
    serviceURL: https://www.opsgenie.com/service/shopping-cart
    region: US
extensions:
  datadoghq.com/shopping-cart:
    customField: customValue
spec:
  lifecycle: production
  tier: "1"
  type: web
  languages:
    - go
    - python
  dependsOn:
    - service:serviceA
    - service:serviceB
datadog:
  performanceData:
    tags:
      - 'service:shopping-cart'
      - 'hostname:shopping-cart'
  events:
    - name: "deployment events"
      query: "app:myapp AND type:github"
    - name: "event type B"
      query: "app:myapp AND type:github"
  logs:
    - name: "critical logs"
      query: "app:myapp AND type:github"
    - name: "ops logs"
      query: "app:myapp AND type:github"
  pipelines:
    fingerprints:
      - fp1
      - fp2
  codeLocations:
    - repositoryURL: http://github/shopping-cart.git
      paths:
        - baz/*.c
        - bat/**/*
        - ../plop/*.java
    - repositoryURL: http://github/shopping-cart-2.git
      paths:
        - baz/*.c
        - bat/**/*
        - ../plop/*.java
EOF
}

// v3 datastore entity 
resource "datadog_software_catalog" "datastore_v3" {
  entity = <<EOF
apiVersion: v3
kind: datastore
metadata:
  name: shopping-cart-db
  tags:
    - tag:value
  links:
    - name: shopping-cart-db runbook
      type: runbook
      url: https://runbook/shopping-cart
  contacts:
    - name: Support Email
      type: email
      contact: team@shopping.com
    - name: Support Slack
      type: slack
      contact: https://www.slack.com/archives/shopping-cart
  owner: myteam
  additionalOwners:
    - name: opsTeam
      type: operator
integrations:
  pagerduty:
    serviceURL: https://www.pagerduty.com/service-directory/Pshopping-cart
  opsgenie:
    serviceURL: https://www.opsgenie.com/service/shopping-cart
    region: US
extensions:
  datadoghq.com/shopping-cart-db:
    customField: customValue
spec:
  lifecycle: production
  tier: "1"
  type: "postgres"
datadog:
  performanceData:
    tags: ['tag:random']
EOF
}

// v3 queue entity 
resource "datadog_software_catalog" "queue_v3" {
  entity = <<EOF
apiVersion: v3
kind: queue
metadata:
  name: order-queue
  tags:
    - tag:value
  links:
    - name: order-queue runbook
      type: runbook
      url: https://runbook/order-queue
  contacts:
    - name: Support Email
      type: email
      contact: team@shopping.com
    - name: Support Slack
      type: slack
      contact: https://www.slack.com/archives/shopping-cart
  owner: myteam
  additionalOwners:
    - name: opsTeam
      type: operator
integrations:
  pagerduty:
    serviceURL: https://www.pagerduty.com/service-directory/Pshopping-cart
  opsgenie:
    serviceURL: https://www.opsgenie.com/service/shopping-cart
    region: US
extensions:
  datadoghq.com/order-queue:
    customField: customValue
spec:
  lifecycle: production
  tier: "1"
  type: kafka
datadog:
  performanceData:
    tags: ['tag:random']
EOF
}

// v3 system entity 
resource "datadog_software_catalog" "system_v3" {
  entity = <<EOF
apiVersion: v3
kind: system
metadata:
  name: shopping-system
  displayName: Shopping System
  tags:
    - tag:value
  links:
    - name: shopping-system runbook
      type: runbook
      url: https://runbook/shopping-system
  contacts:
    - name: Support Email
      type: email
      contact: team@shopping.com
    - name: Support Slack
      type: slack
      contact: https://www.slack.com/archives/shopping-cart
  owner: myteam
  additionalOwners:
    - name: opsTeam
      type: operator
integrations:
  pagerduty:
    serviceURL: https://www.pagerduty.com/service-directory/Pshopping-cart
  opsgenie:
    serviceURL: https://www.opsgenie.com/service/shopping-cart
    region: US
spec:
  components:
    - service:shopping-cart
    - queue:order-queue
    - database:shopping-cart-db
extensions:
  datadoghq.com/shopping-system:
    customField: customValue
datadog:
  events:
    - name: "deployment events"
      query: "app:myapp AND type:github"
    - name: "event type B"
      query: "app:myapp AND type:github"
  logs:
    - name: "critical logs"
      query: "app:myapp AND type:github"
    - name: "ops logs"
      query: "app:myapp AND type:github"
EOF
}
