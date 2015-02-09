#!py

config = {  }

def run():
  config = __salt__['custmod_rpm_packages_from_list.create_packages_states']('pillar_rpm_packages')
  return config

