#!py
#
# This state file will just extract packages name versions and release info and create a salt compatibale data structure 
# created data structure will be : 
# config = { 'pillar_rpm_packages': [ 'package1==ver1.rel1.x86_64', 'package2==ver2.rel2.x86_64' ] }
#

import os, subprocess

def run():
  config = { 'pillar_rpm_packages': []}
  for package in open('/srv/salt/baseenv/pillar/data/rpm_packages.list'):
    package=package.rstrip()
    repo_query_command="repoquery " + package + " --qf '%{NAME}==%{VERSION}-%{RELEASE}'"
    rep_query_process=subprocess.Popen(repo_query_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    rep_query_process.wait()
    if rep_query_process.returncode == 0:
      formatted_package_name=rep_query_process.stdout.readline().rstrip()
      config['pillar_rpm_packages'].append(formatted_package_name)
  return config
