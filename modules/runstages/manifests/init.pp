class runstages {

  stage { "prep": before => Stage["main"]}
  stage { "post": require => Stage["main"]}


}