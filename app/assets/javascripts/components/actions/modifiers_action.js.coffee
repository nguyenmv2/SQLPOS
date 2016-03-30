class ModifiersActions
  constructor: ->
    @generateActions(
      'initData',
      'addModifier',
      'editModifier'
    )

@ModifiersActions = alt.createActions(ModifiersActions)