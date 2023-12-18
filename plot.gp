# Script Gnuplot para plotar os resultados

# Defina o estilo de linha e pontos
set style line 1 lc rgb 'blue' lt 1 lw 2 pt 7 ps 1.5
set style line 2 lc rgb 'red' lt 1 lw 2 pt 7 ps 1.5

# Configurações do gráfico
set xlabel 'Valor de m'
set ylabel 'MFPT'
set title 'Mean First Passage Time (MFPT)'
set grid

# Configurações da legenda
set key top left
set key box

# Nome dos arquivos de dados
mfpt_file = 'mfpt.dat'
tau_file = 'tau.dat'
erro_file = 'erro.dat'

# Plota o MFPT
plot mfpt_file using 1:2 with linespoints ls 1 title 'MFPT', \
     tau_file using 2:3 with linespoints ls 2 title 'Tau'

# Salva o gráfico em um arquivo de imagem
set terminal pngcairo
set output 'mfpt_plot.png'
replot
set output

# Plota o erro
reset
set xlabel 'Valor de m'
set ylabel 'Erro Relativo'
set title 'Erro Relativo'
set grid

# Plota o Erro
plot erro_file using 1:2 with linespoints ls 1 title 'Erro'

# Salva o gráfico em um arquivo de imagem
set terminal pngcairo
set output 'erro_plot.png'
replot
set output
