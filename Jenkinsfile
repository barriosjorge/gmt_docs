#!/usr/bin/env groovy
// Only keep the last 10 builds
properties([[$class: 'BuildDiscarderProperty',
              strategy: [$class: 'LogRotator',
                          artifactDaysToKeepStr: '',
                          artifactNumToKeepStr: '',
                          daysToKeepStr: '',
                          numToKeepStr: '10']]]);

// Perform build on docker container running fedora25
node('gmt-jenkins-doc') {

  stage('Build Model') {
    echo "Checking out gmt_model"
    dir('gmt_model') {
      git url: 'https://github.com/GMTO/gmt_model.git'
    }
    echo "Building Model..."
    sh '''
      sudo dnf builddep --nogpgcheck -y gmt-base.spec
      NISAMPLE=1 NHDK=1 NHDKTC3OPCUA=1 NPIPELINE=1 make -j`nproc` all
      NISAMPLE=1 NHDK=1 NHDKTC3OPCUA=1 NPIPELINE=1 make -j`nproc` install
    '''
  }

  // Build parameters from job
  def module = env.JOB_NAME.split('/')[0]
  def build = env.JOB_NAME.split('/')[1]
  def buildnr = VersionNumber versionNumberString:'${BUILDS_ALL_TIME}', skipFailedBuilds:true//, overrideBuildsAllTime:'1'
  def dir = module.substring(4)
  def rpm = module.replace('_', '-')

  // Build parameters from file
  def props = readJSON file: 'version.json'
  def pkgversion = props["version"]["major"] + '.' + props["version"]["minor"]
  def git_commit = props["git_commit"]
  def yum_release = props["yum_release"]
  def yum_repo = props["yum_repo"]

  // Define the package release name
  def pkgrelease
  // Pull Requests on any branch
  if (env.BRANCH_NAME.startsWith("PR-")) {
    def pr = build.replace('-', '')
    pkgrelease = pr + '.' + buildnr
  // Official master builds get a clean version number
  } else if (env.BRANCH_NAME.contains('master')) {
    pkgrelease = buildnr
  // Builds from the Release branch are flagged as release candidates
  } else if (env.BRANCH_NAME.contains('release')) {
    pkgrelease = 'rc' + buildnr
  // Builds from the Development branch simply get the current build tag appended
  } else {
    pkgrelease = env.BRANCH_NAME + '.' + env.BUILD_NUMBER
  }
  echo "Package: $rpm-$pkgversion-$pkgrelease"

  stage('Build') {
    echo "Checking out gmt_docs:gh-pages for generated content"
    // dir('gmt_docs_build') {
    //   checkout([$class: 'GitSCM', branches: [[name: 'refs/remotes/origin/gh-pages']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'html']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/GMTO/gmt_docs.git']]])
    //   sh '''
    //     pwd
    //     ls html/
    //     cd html
    //     git status
    //   '''
    // }
    sh '''
      mkdir gmt_docs_build
      cd gmt_docs_build
      git clone git@github.com:mariannecx/gmt_docs.git html
      cd html
      git checkout -b gh-pages remotes/origin/gh-pages
    '''
    echo "Checking out gmt_docs for source files"
    dir('gmt_docs') {
      checkout scm
      sh '''
        make jenkins
      '''
    }
    // withEnv(["DIR=$dir", "RPM=$rpm", "VER=$pkgversion", "REL=$pkgrelease", "GIT=$git_commit"]) {
    //     sh '''
    //       sudo dnf builddep --nogpgcheck -y ${RPM}.spec
    //       sudo npm install -g browserify
    //       sudo npm install -g uglifyjs
    //       git archive --format=tgz --prefix=${RPM}/ -o ~/rpmbuild/SOURCES/${RPM}-${VER}.tgz ${GIT}
    //       rpmbuild --define="pkgversion ${VER}"  --define="pkgrelease ${REL}" -ba ${RPM}.spec
    //    '''
    // }
  }

  stage('Test') {
    echo "Testing..."
  }

  stage('Deploy') {
    echo "Deploying..."
  }

  stage('Upload') {
    echo "Uploading..."
  }
}
