# Pipeline-Differental-Expression-Genes-DGEs-

We developed a pipeline for Differental Expression Genes (DGEs) based on DESeq (https://genomebiology.biomedcentral.com/articles/10.1186/gb-2010-11-10-r106). We developed a R script to do a automatic analysis based on DESeq R library. It need only a count file with no header for samples of your interest.

# Require R library

DeSeq:  https://bioconductor.org/packages/release/bioc/html/DESeq.html

Data.table: https://cran.r-project.org/web/packages/data.table/index.html


## Usage

First downlaod the code and the database:

git clone https://github.com/Atlas9266/Pipeline-Differental-Expression-Genes-DGEs-.git

    Rscipt Deseq_pipeline.v1.1.R --help

    Error: At least two arguments must be supplied (input file).n
    Execution halted

# Example 

For example if you have two samples; one is control and the second one is case (eg UTIs). After successfully running this code, you will have results in CSV file in the same directory:

    Rscript Deseq_pipeline.v1.1.R  2 sample1 sample2 Control Case




## Author
Atlas Khan, Department of Medicine (Division Nephrology), Columbia University Medical Centre, New York, USA.

Email: atlas.akhan@gmail.com and ak4046@cumc.columbia.edu
