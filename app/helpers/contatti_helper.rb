module ContattiHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |campi_form|
      render(association.to_s.singularize + "_campi", f: campi_form)
    end
    link_to(name, '', class: "aggiungi_campi", data: { id: id, fields: fields.gsub("\n", "")})
  end

  def tipo_telefono tipo_numero
  	case tipo_numero
  	  when 1 then 'Personale'
  	  when 2 then 'Aziendale'
  	  when 3 then 'Fax'
  	  else "n.d."
  	end
  end

end
