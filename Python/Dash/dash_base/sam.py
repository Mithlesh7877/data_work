import dash
import dash_core_components as dc
import dash_html_components as html

app=dash.Dash()
# app.layout=html.Div(children=[
#     html.H1('Hello Dash!')
# ])

app.layout=html.Div(
   children= [
html.H1('Hello'),
html.Div('Dash with py'),
dc.Graph(id='ex',figure={'data':[{'x':[1,2,3],'y':[4,3,2],'type':'bar','name':'SF'}]
,'layout':{
    'title':'Bar plot'
}})
    ]

)


if __name__=='__main__':
    app.run_server()