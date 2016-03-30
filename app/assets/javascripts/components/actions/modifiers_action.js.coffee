class ModifiersActions
  constructor: ->
    @generateActions(
      'initData',
      'addModifier',
      'editModifier',
      'deleteModifier'
    )

@ModifiersActions = alt.createActions(ModifiersActions)
