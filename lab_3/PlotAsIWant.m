function [varargout]=PlotAsIWant(x,f,fig_number,varargin)
myfig = figure(fig_number);

saved_name = '';
saving_opt = '';
flag = 0;
switch nargin
    case 4
        mytitle=varargin{1};
        title(mytitle);
    case 5
        mytitle=varargin{1};
        title(mytitle);
        grapics=varargin{2};
    case 6
        mytitle=varargin{1};
        title(mytitle);
        grapics=varargin{2};
        saved_name=varargin{3};        
    case 7
        mytitle=varargin{1};
        title(mytitle);
        grapics=varargin{2};
        saved_name=varargin{3};
        saving_opt = varargin{4};
    case 8
        mytitle=varargin{1};
        title(mytitle);
        grapics=varargin{2};
        saved_name=varargin{3};        
        saving_opt = varargin{4};
        flag = varargin{5};
end
plot(x,f(x), grapics);
if ~isempty(saved_name)
    if (isempty(saving_opt) || strcmp(saving_opt, 'fig') )
        savefig(myfig,[saved_name '.fig'])
        if nargout==1
            varargout{1}=['Salvata figura ' num2str(fig_number) ' in ' saved_name '.fig'];
        end
    else 
        if strcmp(saving_opt, 'eps')
            hgexport(myfig,[saved_name '.eps'])
            if nargout==1
                varargout{1}=['Salvata figura ' num2str(fig_number) ' in ' saved_name '.eps'];
            end
        else
            savefig(myfig,[saved_name '.fig'])
            hgexport(myfig,[saved_name '.eps'])
            if nargout==1
                varargout{1}=['Salvata figura ' num2str(fig_number) ' in ' saved_name '.fig' ' e in' saved_name '.eps'];
            end
        end
    end
end
if flag
    close(myfig)
end