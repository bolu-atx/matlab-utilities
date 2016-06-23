% stackem - tile all the figures currently open using a N x M grid for easy
% viewing purposes
%  Inputs: N - number of columns
%          M - number of rows
%  default value is a 3x4 grid (considering we currently have wide-screen
%  monitors)
%
% Bo Lu
% The Dow Chemical Company
% July 30th 2015

function stackem(N,M)
if nargin < 2;M = 3;end
if nargin < 1;N = 4;end

resolutions = get(0,'screensize');
resolution = resolutions(3:4);
figuresize = [resolution(1)/N resolution(2)/M];

figures = findall(0,'type','figure');
ids = [];
for i = 1:numel(figures);
    ids = [ids;figures(i).Number];
end

[i,k] = sort(ids);

for i = 1:numel(k)
    pos_x=(mod(i+N-1,N))*figuresize(1)+20;
    pos_y=resolution(2)-(mod(ceil(i/N)+M-1,M)+1)*figuresize(2)-30;
    set(figures(k(i)), 'Position', [pos_x pos_y figuresize-[30 50]]);
end
end