# {Link} = ReactRouter.Link
# {a,abbr,address,area,article,aside,audio,b,base,bdi,bdo,big,blockquote,body,br
# button,canvas,caption,cite,code,col,colgroup,data,datalist,dd,del,details,dfn
# dialog,div,dl,dt,em,embed,fieldset,figcaption,figure,footer,form,h1,h2,h3,h4,h5
# h6,head,header,hgroup,hr,html,i,iframe,img,input,ins,kbd,keygen,label,legend,li
# link,main,map,mark,menu,menuitem,meta,meter,nav,noscript,object,ol,optgroup
# option,output,p,param,picture,pre,progress,q,rp,rt,ruby,s,samp,script,section
# select,small,source,span,strong,style,sub,summary,sup,table,tbody,td,textarea
# tfoot,th,thead,time,title,tr,track,u,ul,video,wbr} = React.DOM
#
# Link = ReactRouter.Link
# RouteHandler = ReactRouter.RouteHandler
#
# @App = React.createClass
#   render: ->
#     console.log("INside component")
#     nav className: "navbar navbar-default",
#       div className: "container-fluid",
#         div className: "navbar-header",
#           button
#             className: "navbar-toggle collapsed",
#             type: "button",
#             data-toggle: "collapse",
#
#               span
#                 className:'sr-only'
#                 'Toggle navigation'
#               span className:'icon-bar',
#               span className:'icon-bar',
#               span className:'icon-bar',
#           a className: "navbar-brand", href='', 'Project Name'
#         # end navbar-header
#         div className: 'navbar-collapse collapse',
#           ul className: 'nav navbar-nav',
#             li className: 'active',
#               Link to='/', 'Orders'
#     div null,
#       RouteHandler {}
