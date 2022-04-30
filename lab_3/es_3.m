x = 0:0.001:1;
f = @(x)exp(x).*((x.^2)+1);
string = PlotAsIWant(x, @function_es_1, 1, 'g', '--k','g_graph', 'eps' , 1)
string = PlotAsIWant(x, f, 1, 'f', '--k','f_graph', 'eps' , 1)

PlotAsIWant(x, @function_es_1, 1, '-.g', 'k')
hold on
string = PlotAsIWant(x, f, 1, 'f and g graph', 'b','g_f_graph', 'eps', 1)