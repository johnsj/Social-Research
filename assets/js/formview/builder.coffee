FormView =
  renderForm:(configs)->
    identifier = configs.identifier
    submitText = configs.submitText
    _.each @model.FormSchema, (schema, key)=>
      template = _.template $("#form-input-#{schema.type}-template").html()
      switch schema.type
        when 'text'
          input=
            name: "#{identifier}_#{key}"
            id: "#{identifier}_#{key}"
            label: _(key).capitalize()
            value: if _.isString(@model.get(key)) then @model.get key else ""
          $(@el).find("table.item_form").append template {input: input}
        when 'textarea'
          input=
            name: "#{identifier}_#{key}"
            id: "#{identifier}_#{key}"
            label: _(key).capitalize()
            value: if _.isString(@model.get(key)) then @model.get key else ""
          $(@el).find("table.item_form").append template {input: input}
        when 'select'
          input=
            name: "#{identifier}_#{key}"
            id: "#{identifier}_#{key}"
            label: _(key).capitalize()
          $(@el).find("table.item_form").append template {input: input}
          optionTemplate = _.template $("#form-input-select-option-template").html()
          _.each schema.collection.models, (model)=>
            optionInput=
              label: model.get "title"
              value: model.get schema.key
              selected: if schema.ref and schema.ref._id is model.id then "selected=\"selected\"" else ""
            $(@el).find("select##{input.id}").append optionTemplate optionInput
    submitTemplate = _.template $("#form-submit-template").html()
    $(@el).find("table.item_form").append submitTemplate {submitText: submitText}


Backbone.FormView = FormView