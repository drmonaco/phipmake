#' Merge epitopefindr fields from library annotation files
#'
#' @param enrichment_annotations Annotation files
#'
#' @export
#'

merge_annotations <- function(enrichment_annotations){

  a <- lapply(enrichment_annotations, function(x)
    x[, c("u_pep_id", "gene_symbol", "pep_rank", "taxon_species", "pep_aa")])

  a <- lapply(a, as.matrix)
  a <- lapply(a, as.data.frame)

  a <- dplyr::bind_rows(a,)


  a$annotation <- paste(
    substr(a$u_pep_id, 1, 10),
    a$gene_symbol, a$pep_rank, a$taxon_species, sep = "_")


  return(a)

}