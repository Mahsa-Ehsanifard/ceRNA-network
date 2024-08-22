
## multiMiR package in R

![](https://img.shields.io/badge/version-4.4-%239933FF?style=flat)
![](https://img.shields.io/badge/Source-Bioconductor-green?style=flat)
![](https://img.shields.io/badge/Install-R%20studio-blue?style=flat)
![](https://img.shields.io/badge/Rank-458%2F2300-orange?style=flat)
![](https://img.shields.io/badge/Platforms-all-cyan?style=flat)
![](https://img.shields.io/badge/in%20Bioc-7%20years-fuchsia?style=flat)

![multiMiR web](http://multimir.org/)

The package hosts variable databases containing miRNA-target
interactions, and provides functions to communicate with the *multiMiR*
web server and its database.

### Installation

```{r}
BiocManager::install("multiMiR")
```

-   We need a list of miRNAs' name and a list of targets, such as genes
    and lncRNAs, to identify the interactions. miRNA-gene and
    miRNA-lncRNA interactions will be defined.

> miRNAs are known as source nodes, while genes and lncRNAs are known as targets

The function `get_multimir` provides the interactions we need based on
*hsa; homo sapiens* project.

-   we can choose the `predicted.cutoff` argument in this function to
    define the percentage of interactions. Usually, *80* prediction
    cutoff means top 80% significant interactions based on validated
    databases including *miRTarBase*, *miRDB*, *TargetScan*, and
    *TarBase*. We can use *20* cutoff in a highly significant detection
    of results, exploring less interactions number than 80 cutoff.

-   Argument `table` in the function means the generation of table
    header and footer. It usually is "all".

-   Argument `predicted.cutoff.type` means the type of predicted cutoff
    is used. Usually "P" as *percent* is used.

```{r}
<- get_multimir(org = "hsa",mirna = miRNA, target = genes, predicted.cutoff = 80, table = "all",predicted.cutoff.type = "p")
```

-   You can filter the final output table based on database column to
    release the results based on the validated databases.

```
database	mature_mirna_acc	mature_mirna_id	target_symbol	target_entrez	target_ensembl	experiment	support_type	          pubmed_id	 type	     score
mirtarbase	MIMAT0004954	hsa-miR-543         	ADD1	     118	        ENSG00000087274	  HITS-CLIP	 Functional MTI (Weak)	23824327	validated	  NA
mirtarbase	MIMAT0002818	hsa-miR-496	          AKT1	     207	        ENSG00000142208	  PAR-CLIP	 Functional MTI (Weak)	22100165	validated	  NA
mirdb	      MIMAT0004954	hsa-miR-543	          FBXO34	   55030	      ENSG00000178974	  NA	       NA	                     NA	      predicted	  99.51948263
mirdb      	MIMAT0004954	hsa-miR-543	          NWD2	     57495	      ENSG00000174145	  NA	       NA                      NA	      predicted	  99.49892675
targetscan	MIMAT0004954	hsa-miR-543	          CASK	     8573	        ENSG00000147044	  NA	       NA	                     NA	      predicted	  -0.156
targetscan	MIMAT0004954	hsa-miR-543	          CMPK1	     51727	      ENSG00000162368	  NA       	 NA	                     NA	      predicted	  -0.156
tarbase   	MIMAT0004954	hsa-miR-543	          DHX33	     56919  	ENSG00000005100 Degradome sequencing	positive	                 	validated	  NA
tarbase   	MIMAT0004954	hsa-miR-543	          ADAM22	   53616	  ENSG00000008277	Degradome sequencing	positive		                validated	  NA
```

* Score column shows the significant interactions in two databases including *mirdb* and *targetscan*, which means that we can filter the interactions with 80% cutoff only, describing more than 80 percent significant interactions. The negative scores defined by *targetscan* database based on the negative correlation of interactions and inhibitory effects of miRNA on target, which means highly negative scores, more significant effects of miRNA on targets. So we can choose *-0.5* or *-0.8* cutoff as a score criteria to filter *targetscan* results.

* *type* column shows the type of interactions and database function. *predicted* or *validated* results. We can choose one or both of them.

* For the databases without score number to choose, we can filter the *support-type* column, so that we remove *weak functional MIT* and keep *positive*, *strong*, or those written only *functional MIT*.  **MIT: MicroRNA-Target Interaction**

### Nest process

You should add your attribute features to your final interactions table. Any feature describing the targets attributes. Clinical features, Molecular identification, cellular attribute, regulation or mutation levels, treated or non-treated states, or etc can be used. These features are used for detecting and defining particular targets in the ceRNA network.

* The final prepared table is transferred to **Cytoscape** software for contructing and analyzing the ceRNA network. **Source** nodes should be defined as *miRNA* column with *miR-Ids*, and *Target* nodes should be defined as *target* columns with *symbols or ids*. The columns related to attributes should be defined as *target-attribute*. Then, You can design the network in Cytoscape. 
