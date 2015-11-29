module ContattiHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |numero_di_telefono|
      render(association.to_s.singularize + "_campi", f: numero_di_telefono)
    end
    link_to(name, '', class: "aggiungi_campi", data: { id: id, fields: fields.gsub("\n", "")})
  end
end
