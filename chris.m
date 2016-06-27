% Coded by Noah Huber-Feely from Dr. Chris Wilson's code

% Hard coded parameters
MAXNODES = 500;
MAXELEMS=200;
MAXDOFS=400;
MAXMATLS=10;
MAXSECTS=10;

% File names
infile = '';
outfile = '';

infile = input('File name to read from: ', 's');
outfile = input('File name for output: ', 's');

in = textread(infile, '\n');
in

out = fopen(outfile, 'w');
fprintf(out, 'Hello world');