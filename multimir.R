library(multiMiR)

venn_deg <- DEG[match(venn$elements[0:68], rownames(DEG)),]
geo_venndeg <- geoDeg[match(venn$elements[0:68], rownames(geoDeg)),]
#two deg tables are significance FDR

sigdeg <- DEG[DEG$FDR<0.05,]
tcga_lnc <- sigdeg[sigdeg$gene_type=="lncRNA",]

siggeodeg <- geoDeg[geoDeg$adj.P.Val<0.05,]
geo_lnc <- siggeodeg[siggeodeg$gene_type=="lncRNA",]

#miR-gene
outPut1 <- get_multimir(org = "hsa",mirna = mir$miRNA, target = venn_deg$gene_name,table = "all",
                        predicted.cutoff = 80, predicted.cutoff.type = "p",predicted.site = "all")

result <- outPut1@data


#miR-lncRNA
lncRNAs <- read.delim(choose.files())

outPut2 <- get_multimir(org = "hsa",mirna = mir$miRNA, target = lncRNAs$gene_name,table = "all",
                        predicted.cutoff = 90, predicted.cutoff.type = "p",predicted.site = "all")

result <- outPut2@data

