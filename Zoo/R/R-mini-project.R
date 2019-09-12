#n_cells_expressed
most_expressed_over500 <- n_cells_expressed[which(n_cells_expressed > 500)]
names_of_most_expressed_over500 <- names(most_expressed_over500)

over500subset <- expression_matrix[which(cell_cycle_genes > 0)]

names_over500 <- names(over500subset)
