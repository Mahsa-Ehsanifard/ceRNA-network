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

* You can filter the final output table based on database column to release the results based on the validated databases. 

```
database	mature_mirna_acc	mature_mirna_id	target_symbol	target_entrez	target_ensembl	experiment	support_type	pubmed_id	type	score
mirtarbase	MIMAT0004954	hsa-miR-543	ADD1	118	ENSG00000087274	HITS-CLIP	Functional MTI (Weak)	23824327	validated	NA
mirtarbase	MIMAT0002818	hsa-miR-496	AKT1	207	ENSG00000142208	PAR-CLIP	Functional MTI (Weak)	22100165	validated	NA
mirtarbase	MIMAT0004954	hsa-miR-543	AMD1	262	ENSG00000123505	PAR-CLIP	Functional MTI (Weak)	27292025	validated	NA
mirtarbase	MIMAT0004954	hsa-miR-543	AMPD3	272	ENSG00000133805	HITS-CLIP	Functional MTI (Weak)	23824327	validated	NA
mirtarbase	MIMAT0004954	hsa-miR-543	AMPD3	272	ENSG00000133805	HITS-CLIP	Functional MTI (Weak)	23313552	validated	NA
mirtarbase	MIMAT0004954	hsa-miR-543	AMPD3	272	ENSG00000133805	HITS-CLIP	Functional MTI (Weak)	27418678	validated	NA
mirdb	      MIMAT0004954	hsa-miR-543	FBXO34	55030	ENSG00000178974	NA	NA	NA	predicted	99.51948263
mirdb      	MIMAT0004954	hsa-miR-543	NWD2	57495	ENSG00000174145	NA	NA	NA	predicted	99.49892675
mirdb	      MIMAT0004954	hsa-miR-543	DMXL2	23312	ENSG00000104093	NA	NA	NA	predicted	99.48519779
mirdb     	MIMAT0004954	hsa-miR-543	ONECUT2	9480	ENSG00000119547	NA	NA	NA	predicted	99.1432345
mirdb	      MIMAT0004954	hsa-miR-543	MAPK1	5594	ENSG00000100030	NA	NA	NA	predicted	99.11935315
mirdb	      MIMAT0004954	hsa-miR-543	ZBTB43	23099	ENSG00000169155	NA	NA	NA	predicted	99.10216587
mirdb	      MIMAT0004954	hsa-miR-543	ANO5	203859	ENSG00000171714	NA	NA	NA	predicted	99.03360751
mirdb	      MIMAT0004954	hsa-miR-543	LIFR	3977	ENSG00000113594	NA	NA	NA	predicted	98.99188046
mirdb	      MIMAT0004954	hsa-miR-543	KLHL5	51088	ENSG00000109790	NA	NA	NA	predicted	98.84214836
targetscan	MIMAT0004954	hsa-miR-543	CASK	8573	ENSG00000147044	NA	NA	NA	predicted	-0.156
targetscan	MIMAT0004954	hsa-miR-543	CMPK1	51727	ENSG00000162368	NA	NA	NA	predicted	-0.156
targetscan	MIMAT0004954	hsa-miR-543	C7orf25	79020	ENSG00000136197	NA	NA	NA	predicted	-0.156
targetscan	MIMAT0004954	hsa-miR-543	CDC20B	166979	ENSG00000164287	NA	NA	NA	predicted	-0.156
targetscan	MIMAT0004954	hsa-miR-543	ADIRF	10974	ENSG00000148671	NA	NA	NA	predicted	-0.156
targetscan	MIMAT0004954	hsa-miR-543	ARL6	84100	ENSG00000113966	NA	NA	NA	predicted	-0.156
targetscan	MIMAT0004954	hsa-miR-543	ING5	84289	ENSG00000168395	NA	NA	NA	predicted	-0.156
targetscan	MIMAT0004954	hsa-miR-543	EEF2KMT	196483	ENSG00000118894	NA	NA	NA	predicted	-0.156
tarbase   	MIMAT0004954	hsa-miR-543	DHX33	56919	ENSG00000005100	Degradome sequencing	positive		validated	NA
tarbase   	MIMAT0004954	hsa-miR-543	ADAM22	53616	ENSG00000008277	Degradome sequencing	positive		validated	NA
tarbase	    MIMAT0004954	hsa-miR-543	REV3L	5980	ENSG00000009413	Degradome sequencing	positive		validated	NA
tarbase	    MIMAT0004954	hsa-miR-543	IDS	3423	ENSG00000010404	Degradome sequencing	positive		validated	NA
tarbase	    MIMAT0004954	hsa-miR-543	SAMD4A	23034	ENSG00000020577	Degradome sequencing	positive		validated	NA
tarbase	    MIMAT0004954	hsa-miR-543	ZFYVE16	9765	ENSG00000039319	Degradome sequencing	positive		validated	NA
```






