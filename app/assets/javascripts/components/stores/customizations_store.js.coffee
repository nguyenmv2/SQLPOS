class CustomizationsStore
  @displayName: 'CustomizationStore'

  constructor: ->
    @bindActions(CustomizationsActions)
    @customizations = []

  onInitData: ->
    $.ajax
      method: 'GET'
      url: "/customizations"
      dataType: 'JSON'
      success: (e) =>
        @customizations = e

@CustomizationsStore = alt.createStore(CustomizationsStore)
