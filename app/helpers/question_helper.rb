module QuestionHelper
	def form_title
		@question.new_record? ? "Publicar Pregunta" : "Modificar Pregunta"
	end

	def form_submit
		@question.new_record? ? "Preguntar!" : "Re-Preguntar!"
	end
end
