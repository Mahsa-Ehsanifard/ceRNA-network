## multiMiR package in R

![](https://img.shields.io/badge/version-4.4-%239933FF?style=flat)
![](https://img.shields.io/badge/Source-Bioconductor-green?style=flat
)
![](https://img.shields.io/badge/Install-R%20studio-blue?style=flat
)
![](https://img.shields.io/badge/Rank-458%2F2300-orange?style=flat
)
![](https://img.shields.io/badge/Platforms-all-cyan?style=flat
)
![](https://img.shields.io/badge/in%20Bioc-7%20years-fuchsia?style=flat
)

![multiMiR web](http://multimir.org/)

The package hosts variable databases containing miRNA-target interactions, and provides functions to communicate with the *multiMiR* web server and its database.

### Installation

```{r}
BiocManager::install("multiMiR")
```

* We need a list of miRNAs' name and a list of targets, such as genes and lncRNAs, to identify the interactions. miRNA-gene and miRNA-lncRNA interactions will be defined. 

> miRNAs are known as nodes, while genes and lncRNAs are known as targets

The function `get_multimir` provides the interactions we need based on *hsa; homo sapiens* project. 

* we can choose the `predicted.cutoff` argument in this function to define the percentage of interactions. Usually, *80* prediction cutoff means top 80% significant interactions based on validated databases including *miRTarBase*, *miRDB*, *TargetScan*, and *TarBase*. We can use *20* cutoff in a highly significant detection of results, exploring less interactions number than 80 cutoff.

* Argument `table` in the function means the generation of table header and footer. It usually is "all".

* Argument `predicted.cutoff.type` means the type of predicted cutoff is used. Usually "P" as *percent* is used.

```{r}
<- get_multimir(org = "hsa",mirna = miRNA, target = genes, predicted.cutoff = 80, table = "all",predicted.cutoff.type = "p")
```




