default_tbl <- function(x, caption, ...) {
  necesita_scroll <- nrow(x) > 20
  x <- x %>% 
    kableExtra::kbl(caption = caption, valign = "c") %>% 
    kableExtra::kable_styling(full_width = TRUE, 
                              bootstrap_options = c("striped", "hover", "condensed", "responsive"))
    
  if (necesita_scroll) {
    x <- kableExtra::scroll_box(x, width = "100%", height = "600px", fixed_thead = TRUE)
  }
  x
}
