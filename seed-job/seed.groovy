def project = 'seed-test'
def jobName = 'test-seed'
    job(jobName) {

        deliveryPipelineView("${project}") {
            pipelineInstances(1)
            showAggregatedPipeline()
            columns(1)
            sorting(Sorting.TITLE)
            updateInterval(60)
            enableManualTriggers()
            showAvatars()
            showChangeLog()
            pipelines {
                regex(/${project}-(.*)/)
            }
        }

        steps { 
            sh "Echo test seed"
        }
        
    }

