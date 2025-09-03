---
title: "instructor-feedback"
output: html_document
---

#Exceeds specs

## Running the entire analysis requires rendering one Quarto document

I set up the .qmd file so that rendering it runs the whole pipeline and also made it clear in the README how a user can reproduce the results.

## At least one piece of functionality has been refactored into a function in its own file

I moved key code into 3 functions and saved them as their own files. This makes the workflow easier to reuse (reproducibility) in a professional setting. 

# Collaboration

1.

For the peer feedback portion of the project, I was thorough by reviewing each spec and selected two (2) specs that I felt required the most attention to my peer. I contributed to my peer's README to give a purpose of the project and gave them suggestions for how they can improve their README. My peer had one recurring message in their rendered Quarto document (`paper.qmd`) and I gave feedback to hide that message so their rendered document isn't overloaded with that message. Lastly, my second contribution to my peer's project was adding a comment to a line of code to explain what the purpose of the line of code does and it's purpose. 

2. 

a. <https://github.com/mmorenorolon/hurricane-streams/issues/5>

b. <https://github.com/mmorenorolon/hurricane-streams/issues/13>

c. <https://github.com/mmorenorolon/hurricane-streams/issues/14>

3. 

<https://github.com/mmorenorolon/hurricane-streams/commit/342295bde2b21017abd992a85fabac0275f26f6a>

This is the commit on GitHub where I added the line of code that produced the merge conflict. I resolved the merge conflict manually in the GitHub page on the file. I deleted the headers that marked the merge conflict.

# Instructor feedback

## Automate

[E] **Running the entire analysis requires rendering one Quarto document**

- Your Quarto document looks great!

[M] The analysis runs without errors

[M] **The analysis produces the expected output**

[NY] **Data import/cleaning is handled in its own script(s)**

- On lines 23-25 your source the data handling scripts, but then you repeat the steps throughout paper.qmd. Isolate those steps outide of paper.qmd to meet the spec. Those scripts should not go in R/, that should only contain function definitions.
- You made a lot of good progress in your revisions! Some code is still in confusing places, though. To clarify:
  - `R/` should contain .R files that _define functions_ only. E.g., `scripts/03_moving_average.R` should be `R/moving_average.R`.
  - `scripts/` should contain .R files _use functions to perform the analysis_. These files typically produce _intermediate outputs_. E.g., `scripts/01_import_raw_data.R` should read the raw CSV files (which it currently does), but then it should save the result to `outputs/` as either a CSV or RDS file. Then, `paper/paper.qmd` should perform the analysis by picking up where the files in `scripts/` left off, using functions defined in `R/` appropriately. E.g., if `scripts/02_clean_data.R` created `outputs/streams_cleaned.rds` and `R/plotting.R` defines `plot_figure3()`, then `paper/paper.qmd` would read the RDS file and call the plotting function. `paper/paper.qmd` _would not_ repeat the data cleaning and processing steps. In this case, those steps are fast, so it doesn't really matter. But in the future when you're dealing with larger datasets, those steps might take hours or days, so you don't want to repeat them unneccessarily. 

## Organize

[M] Raw data is contained in its own folder

[NY] Intermediate outputs are created and saved to a separate folder from raw data

- See **Data import/cleaning is handled in its own script(s)**

[E] **At least one piece of functionality has been refactored into a function in its own file**

- Your plot_figure_3() function is great! I have only one piece of feedback: the parameter name "df" is kind of vague and could be more specific. Other than that, flawless.

## Document

[M] The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs

[M] **The README includes a flowchart and text explaining how the analysis works**

[M] **The code is appropriately commented**

[M] **Variable and function names are descriptive and follow a consistent naming convention**

## Scale

After cloning the repo on Workbench:

[M] Running the environment initialization script installs all required packages

[M] The analysis script runs without errors

## Collaborate

[M] **The student has provided attentive, constructive feedback in a peer review**

[M] **The student has contributed to a peer's repo by opening an issue and creating a pull request**

[M] The repo has at least three closed GitHub issues

[M] The commit history includes at least one merged branch and a resolved merge conflict

[M] The rendered analysis is accessible via GitHub Pages
