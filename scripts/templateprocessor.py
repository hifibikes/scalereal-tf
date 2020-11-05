#!/usr/bin/env python3
##
 # 
 # 
 # Copyright 2020 ITWox Inc.
 # 
 # All rights reserved in ITWox Inc. authored and generated code, including the
 # selection and arrangement of the source code base regardless of the authorship
 # of individual files.......
 #
##

import os
import sys
import subprocess
import logging
import string
from jinja2 import Environment, FileSystemLoader

try:
  import yaml
except:
  print('YAML module not found, fail to imprt.')
  quite(1)

try:
  import json
except:
  print('JSON module not found, fail to imprt.')
  quite(1)

# ----------------- FUNCTION -----------------------------
# NAME: yaml_loader()
# DESC: load the yaml definition and validate syntaxes 
# --------------------------------------------------------
def yaml_loader(yaml_file_path):
  pass

