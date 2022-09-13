plot_ridge2 = function (scrna, id, genes, ncol = 1, step = 0.01, show_split = T, 
          assay = "RNA", slot = "data", aggr.other = F) 
{
  Seurat::DefaultAssay(scrna) <- assay
  require(ggplot2)
  df.all <- data.frame()
  df.split <- data.frame()
  if (aggr.other) {
    for (gene in genes) {
      df.g <- get_gene_score(Seurat::FetchData(scrna, vars = c(gene, 
                                                               "ident")), celltype = id, gene = gene)
      df.g <- df.g[order(df.g$x.margin, decreasing = T), 
      ]
      df.g <- df.g[1, ]
      df.c <- Seurat::FetchData(scrna, vars = c(gene, "ident"))
      df.c$ident <- ifelse(df.c$ident == id, id, "Other")
      df.c$gene <- paste(gene)
      colnames(df.c) <- c("Exprs", "Ident", "Gene")
      df.all <- rbind(df.all, df.c)
      df.g <- df.g[, c(1, 2)]
      colnames(df.g) <- c("Gene", "Split")
      df.split <- rbind(df.split, df.g)
    }
    df.s <- reshape2::melt(df.all)
    df.s[df.s == -Inf] <- 0
    df.s$Gene <- factor(df.s$Gene, levels = as.character(genes))
    df.split$Gene <- factor(df.split$Gene, levels = c(genes))
    g <- ggplot2::ggplot(df.s, aes(x = value, y = variable, 
                                   color = Ident, point_color = Ident, fill = Ident)) + 
      ggridges::geom_density_ridges_gradient(scale = 3, 
                                             size = 0.3, rel_min_height = 0.01) + scale_fill_manual(values = c("#CB181D80", 
                                                                                                               "#2171B580")) + scale_discrete_manual("point_color", 
                                                                                                                                                     values = c("#CB181D80", "#2171B580"), guide = "none") + 
      guides(fill = guide_legend(override.aes = list(fill = c("#CB181D80", 
                                                              "#2171B580"), color = NA, point_color = NA))) + 
      ggridges::theme_ridges(grid = FALSE) + ylab("") + 
      theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5))
    df.split$Gene <- factor(df.split$Gene, levels = c(genes))
    g <- g + facet_wrap(~Gene, ncol = ncol) + geom_vline(data = df.split, 
                                                         aes(xintercept = Split), linetype = "dotted", color = "red", 
                                                         size = 1.5) + labs(fill = "Expression")
  }
  else {
    for (gene in genes) {
      df.g <- get_gene_score(Seurat::FetchData(scrna, vars = c(gene, 
                                                               "ident")), celltype = id, gene = gene)
      df.g <- df.g[order(df.g$x.margin, decreasing = T), 
      ]
      df.g <- df.g[1, ]
      df.c <- Seurat::FetchData(scrna, vars = c(gene, "ident"))
      df.c$gene <- paste(gene)
      colnames(df.c) <- c("Exprs", "Ident", "Gene")
      df.all <- rbind(df.all, df.c)
      df.g <- df.g[, c(1, 2)]
      colnames(df.g) <- c("Gene", "Split")
      df.split <- rbind(df.split, df.g)
    }
    df.split$Gene <- factor(df.split$Gene, levels = c(genes))
    df.all$Gene <- factor(df.all$Gene, levels = c(genes))
    g <- ggplot2::ggplot(df.all, aes(y = reorder(Ident, Exprs, 
                                                 mean), x = log2(Exprs+1), fill = stat(x))) + ggridges::geom_density_ridges_gradient() + 
      scale_fill_viridis_c(option = "D") + theme(legend.position = "none") + 
      theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
      ylab("") + xlab("")
    g <- g + geom_vline(data = df.split, aes(xintercept = Split), 
                        linetype = "dotted", color = "red", size = 1.5) + 
      facet_wrap(~Gene, ncol = ncol)
  }
  g <- g + theme_bw() + theme(panel.border = element_blank(), 
                              panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                              axis.line = element_line(colour = "black")) + labs(fill = "Expression")
  print(g)
}
