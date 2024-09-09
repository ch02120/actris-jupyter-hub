import os

from setuptools import find_packages, setup
from setuptools.command.test import test as TestCommand

SOURCE_DIR = "src"

REQUIREMENTS = [
    "click",
    "tqdm",
    "matplotlib>=3.4",
]

REQUIREMENTS_NOTEBOOKS = [
    "ipywidgets",
    "notebook",
    "seaborn",
]

