from setuptools import setup, find_packages

setup(
    name="ddr5_memory_controller_generator",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        "migen",
        "pulp==2.7.0",
    ],
    entry_points={
        "console_scripts": [
            "generate_ddr5_controller=scripts.genCntrlr:main",
        ],
    },
    author="Your Name",
    author_email="your.email@example.com",
    description="A DDR5 Memory Controller Generator",
    long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    url="https://github.com/yourusername/ddr5_memory_controller_generator",
)