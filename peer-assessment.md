# Automate

#### Running the entire analysis requires rendering one Quarto document
*Meets spec*
*To Exceed* - This quarto document looks excellent. If you added a picture to the front and a references section I think you could easily exceed this spec.

#### The analysis runs without errors
*Meets spec* - Ran quickly and without error

#### The analysis produces the expected output
*Meets spec* - The analysis produces an even more beautiful result than the original paper

#### Data import/cleaning is handled in its own script(s)
*Not yet* - I think this technically meets the spec, and I honestly think that what you've done is more effective than what I'm about to suggest. BUT, you might want to put all the packages in a separate script called "environment_init" or something and source that



# Organize

#### Raw data is contained it it's own folder
*Meets spec* - Yup!

#### Intermediate outputs are created and saved in a separate folder from raw data
*Meets spec* - Yes

#### At least one piece of functionality has been refactored in a function in its own file
*Meets spec* - Totally meets the spec
*To exceed* - You may already be exceeding this by also refactoring your cleaning function. If you want to go a step further you could make roxygen pages for each function.



# Document

#### The repo has a README that explains where find (1) date, (2) analysis script, (3) supporting code and (4) outputs.
*Meets* - Fabulous README, this may already be exceeding

#### The README includes a flowchart and text explaining how the analysis works
*Meets* - Gorgeous flowchart, I'm learning a ton from you as I go through this

#### The code is appropriately commented
*Meets* - May even exceed with the funky extra cool comments you have on your functions. Such good work Marie!

#### Variable and function names are descripitive and follow a consistent naming convention
*Meets spec* - Descriptive and follow a pattern.



# Scale

#### Running the environment initialization script installs all required packages
*Meets* - This script is included with your data import - you may want to create a script that just has your environment initialization.

#### The analysis script runs without errors
*Meets* - Not an error or a warning message in sight. This rocks.