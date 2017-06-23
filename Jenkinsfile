#!/usr/bin/env groovy
// Only keep the last 10 builds
properties([[$class: 'BuildDiscarderProperty',
              strategy: [$class: 'LogRotator',
                          artifactDaysToKeepStr: '',
                          artifactNumToKeepStr: '',
                          daysToKeepStr: '',
                          numToKeepStr: '10']]]);

// Perform build on special docker container set up for documentation, running fedora25
node('gmt-jenkins-doc') {

  stage('Checkout') {
    // This is primarily done to access the version.json file
    // The source files will be checked out again into a subfolder for
    // the build process to work.
    echo "Checking out source code"
    checkout scm
  }

  // Read build parameters from job
  def buildnr = VersionNumber versionNumberString:'${BUILDS_ALL_TIME}', skipFailedBuilds:true//, overrideBuildsAllTime:'1'

  // Read build parameters from file
  def props = readJSON file: 'version.json'
  def pkgversion = props["version"]["major"] + '.' + props["version"]["minor"]
  def git_commit = props["git_commit"]
  def yum_release = props["yum_release"]

  stage('Prepare') {
      withEnv(["YUM=$yum_release"]) {
        sh '''
            sudo dnf install -y http://${GMTYUMHOST}/${GMTYUMDIR}/gmt-release-${YUM}.noarch.rpm
            sudo dnf install -y gmt-build-fwk gmt-base
        '''
      }
  }

  stage('Build Model') {
    dir('workspace') {
        dir('gmt_model') {
          echo "Checking out gmt_model"
          git credentialsId: 'bc9ee133-98fd-43e3-a094-30ce521a3fca', url: 'https://github.com/GMTO/gmt_model.git'

          echo "Building Model..."
          sh '''
            sudo dnf builddep --nogpgcheck -y gmt-base.spec
            NISAMPLE=1 NHDK=1 NHDKTC3OPCUA=1 NPIPELINE=1 make -j`nproc` all
            NISAMPLE=1 NHDK=1 NHDKTC3OPCUA=1 NPIPELINE=1 make -j`nproc` install
          '''
        }
      }
  }

  stage('Build Docs') {
    dir('workspace') {
      echo "Checking out gmt_docs:gh-pages for generated content"
      dir('gmt_docs_build') {
        checkout([$class: 'GitSCM',
                   branches: [[name: 'refs/remotes/origin/gh-pages']],
                   doGenerateSubmoduleConfigurations: false,
                   extensions: [[$class: 'RelativeTargetDirectory',
                                  relativeTargetDir: 'html']],
                   submoduleCfg: [],
                   userRemoteConfigs: [[credentialsId: 'bc9ee133-98fd-43e3-a094-30ce521a3fca',
                                        url: 'https://github.com/GMTO/gmt_docs.git']]])
      }
      echo "Checking out gmt_docs for source files"
      dir('gmt_docs') {
        checkout scm //TODO: checkout specific git_commit specified in version.json file
        sh 'make jenkins'
      }
      echo "Stashing html files for later use"
      dir('gmt_docs_build/html') {
        stash includes: "**/*", name: 'html', useDefaultExcludes:true
      }
    }
  }

  stage('Upload') {
    if (BRANCH_NAME.contains("master")) {
      echo "Updating gh-pages branch"
      dir('workspace/gmt_docs_build/html') {
        def commit_msg = "Jenkins build $BUILD_NAME $pkgversion-$buildnr ($BUILD_NUMBER)"
        withEnv(["MSG=$commit_msg"]) {
          withCredentials([usernamePassword(credentialsId: 'bc9ee133-98fd-43e3-a094-30ce521a3fca', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
            sh '''
              git remote set-url origin git@github.com:GMTO/gmt_docs.git
              git checkout gh-pages
              CHANGED=$(git status -s)
              if [ ! -z "${CHANGED:0:40}" ]; then
              git add . && git commit -m "${MSG}" && git push origin gh-pages
              fi
            '''
          }
        }
      }
    }
  }
}

node {
    stage('Deploy Test') {
      def apache_root = ''
      if (BRANCH_NAME.startsWith("PR-")) {
        apache_root = env.BRANCH_NAME
      }
      dir('temp') {
        unstash "html"
        withEnv(["ROOT_DIR=$apache_root"]) {
          sh '''
            if [ ! -d "/var/www/html/${ROOT_DIR}" ]; then mkdir /var/www/html/${ROOT_DIR}; fi
            scp -r ./* /var/www/html/${ROOT_DIR}/
          '''
        }
      }
      if (BRANCH_NAME.startsWith("PR-")) {
        def message = "<a href=\"http://172.16.10.22/$BRANCH_NAME\">Preview $BRANCH_NAME Web pages</a>"
        currentBuild.description = message
        githubNotify context: 'jenkins/build-pages',
                     description: 'To preview documentation, click on Details.',
                     status: 'SUCCESS',
                     targetUrl: "http://172.16.10.22/$BRANCH_NAME"
      }
    }
}
