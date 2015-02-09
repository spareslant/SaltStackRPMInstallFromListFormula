#! /usr/bin/env python

import os, subprocess, re, os.path

packages_states = { }
def create_packages_states(pillar_key):
	for pillar_pack in __pillar__[pillar_key]:
	  match_obj=re.search(r'(?P<rpm_pack_name>.+)==(?P<rpm_version>.+)',pillar_pack)
	  pack=match_obj.group('rpm_pack_name')
	  pack_version=match_obj.group('rpm_version')
	  pack_hash = { pack: pack_version } 
	  packages_states[pack] = {'pkg': ['installed', {'version': pack_version }]}
	return packages_states
