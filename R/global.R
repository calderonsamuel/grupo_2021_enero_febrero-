default_tbl <- function(x, caption, ...) {
  x %>% 
    kableExtra::kbl(caption = caption, valign = "c") %>% 
    kableExtra::kable_styling(full_width = TRUE, 
                              bootstrap_options = c("striped", "hover", "condensed", "responsive")) %>%
    kableExtra::scroll_box(width = "100%", height = "600px", fixed_thead = TRUE)
}
