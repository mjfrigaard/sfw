#' name UI
#' 
#' @param id Unique id for module instance.
#' 
#' @keywords internal
nameUI <- function(id){
	ns <- NS(id)

	tagList(
		h2("name")
	)
}

#' name Server
#' 
#' @param id Unique id for module instance.
#' 
#' @keywords internal
name_server <- function(id){
	moduleServer(
		id,
		function(
			input, 
			output, 
			session
			){
				
				ns <- session$ns
				send_message <- make_send_message(session)

				# your code here
		}
	)
}

# UI
# nameUI('id')

# server
# name_server('id')
