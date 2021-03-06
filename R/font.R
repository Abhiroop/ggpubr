#'Change the Appearance of Titles and Axis Labels
#'
#'@description Change the appearance of the main title, subtitle, caption, axis
#'  labels and text, as well as the legend title and texts. Wrapper around
#'  \code{\link[ggplot2]{element_text}()}.
#'
#'@param object character string specifying the plot components. Allowed values
#'  include: \itemize{ \item \code{"title"} for the main title \item
#'  \code{"subtitle"} for the plot subtitle \item \code{"caption"} for the plot
#'  caption \item \code{"legend.title"} for the legend title \item
#'  \code{"legend.text"} for the legend text \item \code{"x", "xlab", or "x.title"}
#'  for x axis label \item \code{"y", "ylab", or "y.title"} for y axis label \item
#'  \code{"xy", "xylab", "xy.title" or "axis.title"} for both x and y axis
#'  labels \item \code{"x.text"} for x axis texts (x axis tick labels) \item
#'  \code{"y.text"} for y axis texts (y axis tick labels) \item \code{"xy.text"}
#'  or \code{"axis.text"} for both x and y axis texts }
#'
#'@param size numeric value specifying the font size, (e.g.: \code{size = 12}).
#'@param color character string specifying the font color, (e.g.: \code{color =
#'  "red"}).
#'@param face the font face or style. Allowed values include one of
#'  \code{"plain", "bold", "italic", "bold.italic"}, (e.g.: \code{face =
#'  "bold.italic"}).
#'@param family the font family.
#'@param ... other arguments to pass to the function
#'  \code{\link[ggplot2]{element_text}()}.
#'
#'@examples
#'# Load data
#'data("ToothGrowth")
#'
#'# Basic plot
#'p <- ggboxplot(ToothGrowth, x = "dose", y = "len", color = "dose",
#'               title = "Box Plot created with ggpubr",
#'               subtitle = "Length by dose",
#'               caption = "Source: ggpubr",
#'               xlab ="Dose (mg)", ylab = "Teeth length")
#'p
#'
#'# Change the appearance of titles and labels
#'p +
#'  font("title", size = 14, color = "red", face = "bold.italic")+
#'  font("subtitle", size = 10, color = "orange")+
#'  font("caption", size = 10, color = "orange")+
#'  font("xlab", size = 12, color = "blue")+
#'  font("ylab", size = 12, color = "#993333")+
#'  font("xy.text", size = 12, color = "gray", face = "bold")
#'
#'# Change the appearance of legend title and texts
#'p +
#'  font("legend.title", color = "blue", face = "bold")+
#'  font("legend.text", color = "red")
#'
#'@export
font <- function(object, size = NULL, color = NULL, face = NULL, family = NULL, ...){

  elmt <- element_text(size = size, color = color,
                       face = face, family = family, ...)
  switch(object,
         title = theme(plot.title = elmt),
         subtitle = theme(plot.subtitle = elmt),
         caption = theme(plot.caption = elmt),

         x = theme(axis.title.x = elmt),
         xlab = theme(axis.title.x = elmt),
         x.title = theme(axis.title.x = elmt),

         y = theme(axis.title.y = elmt),
         ylab = theme(axis.title.y = elmt),
         y.title = theme(axis.title.y = elmt),

         xy = theme(axis.title.x = elmt, axis.title.y = elmt),
         xylab = theme(axis.title.x = elmt, axis.title.y = elmt),
         xy.title = theme(axis.title.x = elmt, axis.title.y = elmt),
         axis.title = theme(axis.title.x = elmt, axis.title.y = elmt),

         legendtitle = theme(legend.title  = elmt),
         legend.title = theme(legend.title  = elmt),
         legendtext = theme(legend.text  = elmt),
         legend.text = theme(legend.text  = elmt),

         # Axis tick labels
         x.text = theme(axis.text.x  = elmt),
         y.text = theme(axis.text.y  = elmt),
         xy.text = theme(axis.text.x  = elmt, axis.text.y  = elmt),
         yxtext = theme(axis.text.x  = elmt, axis.text.y  = elmt),
         axis.text = theme(axis.text.x  = elmt, axis.text.y  = elmt),
         stop("Don't support ", object)
         )
}
