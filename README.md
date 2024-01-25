# MATH--470
 
This repository is a coordination and storage location for projects and files pertaining to my senior capstone class in Bayesian Data Analysis. This project was graciously overseen by [James Parson Ph.D.](https://www.hood.edu/academics/faculty/james-parson)

In this class Dr. Parson and I explored Bayesian multilevel modeling techniques using the textbook [*Statistical Rethinking* by Richard McElreath](https://xcelab.net/rm/statistical-rethinking/) as a guide. To apply the methods discussed in *Statistical Rethinking*, Dr. Parson and I decided to replicate [Predicting Home Run Production in Major League Baseball Using a Bayesian Semiparametric Model by Gilbert Fellingham and Jared Fisher](https://doi.org/10.1080/00031305.2017.1401959). This article in particular has drawn our attention because of some unique and interesting modeling choices made by the authors. Both Dr. Parson and I believe that the initial investigation by Fellingham and Fisher (2017) is interesting, but there are some questionable modeling choices made by the authors throughout the paper. For example, there are few predictor variables and their associated priors are very weak. The paper does a good job with displaying plenty of visualizations for the reader, yet, under careful examination one is left with the impression that the authors have chosen to display a non-random assortment of players. This leaves careful readers wondering if the validity of their model is constant across all players, or if they have chosen a certain subset because these special players justify the use of their model. These reasons in tandem bring Fellingham and Fisher’s (2017) findings into question. Thus, Dr. Parson and I have embarked to investigate the same research question as them: can we use a multilevel Bayesian model to predict a player’s home run performance? To investigate this Dr. Parson and I used [R](https://www.r-project.org) interfaced with [Stan](https://mc-stan.org) to create our models and the [Lahman database](https://cran.r-project.org/web/packages/Lahman/Lahman.pdf) for player information. 

## Packages
The main textbook for this course was [*Statistical Rethinking* by Richard McElreath](https://xcelab.net/rm/statistical-rethinking/). The examples he provides are in *R* and utilize his package [rethinking](https://github.com/rmcelreath/rethinking). A guide for installation is available [here](https://www.rdocumentation.org/packages/rethinking/versions/2.13), because it is only available on his GitHub repository.

## Directory
Below is an outline of the folders and project documents in them

- Paper - Final Draft
    - This is the final draft of the paper that I submitted. It is a explanation of my model and findings. The code used to generate this can be found in "Lahman Analysis/Formal Analysis".
- Articles
    * This folder comprises articles that were used for project inspiration - It also contains the actual article that Dr. Parson and I chose to replicate "[*Predicting Home Run Production in Major League Baseball Using a Bayesian Semiparametric Model*](https://doi.org/10.1080/00031305.2017.1401959)"
- Lahman Analysis
    - Formal Analysis
        - This folder contains the R workspace used in creating the "final" paper and presentation.
    - Parson Example
        - Dr. Parson's example of various Bayesian modeling techniques coded in both R and Stan.
    - Parson Multilevel
        - Dr. Parson's example of multilevel Bayesian and Spline modeling techniques coded in R and Stan.
    - Rough Analysis
        - Preliminary analysis of Lahman dataset using the *Rethinking* package. 
    - Rough Analysis 2
        - Extension of ideas explore in "Rough Analysis" folder but using Stan and R instead of *Rethinking* package to improve reproducibility.
- Stats Rethinking
    - Ch 2
        - Notes and practice problems from chapter 2 of *Statistical Rethinking*
    - Ch 3
        - Notes and practice problems from chapter 3 of *Statistical Rethinking*
    - Ch 4
        - Notes and practice problems from chapter 4 of *Statistical Rethinking*
    - Ch 7
        - Notes and practice problems from chapter 7 of *Statistical Rethinking*
    - Ch 8
        - Notes and practice problems from chapter 8 of *Statistical Rethinking*
    - Ch 9
        - Notes and practice problems from chapter 9 of *Statistical Rethinking*
    - Ch 11
        - Notes and practice problems from chapter 11 of *Statistical Rethinking*