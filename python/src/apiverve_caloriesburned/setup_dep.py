from setuptools import setup, find_packages

setup(
    name='apiverve_caloriesburned',
    version='1.2.6',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Calories Burned estimates the energy any of 1,100+ activities uses, from running and cycling to gardening and office work. Search by name or Compendium code, pass body weight in kg or lb and a duration, and get calories per hour and in total with the MET value, its Compendium code and the intensity class. Personalise with age, sex and height or a measured RMR, or ask how long it takes to burn a calorie target.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/caloriesburned?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
