{div, h3, ul, li, span, table, thead, tr, th, tbody, td, a } = React.DOM


@InfoTile = React.createClass
  render: ->
    console.log("asd")
    div
      className: "col-md-#{@props.width} col-sm-6 col-xs-12"
      div
        className: "info-box-content"
        span
          className: "info-box-text"
          @props.subject
      @props.content
