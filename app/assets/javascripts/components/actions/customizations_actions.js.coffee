class CustomizationsActions
  constructor: ->
    @generateActions(
        'initData',
        'addCustomization',
        'editCustomization',
        'deleteCustomization'
    )

@CustomizationsActions = alt.createActions(CustomizationsActions)